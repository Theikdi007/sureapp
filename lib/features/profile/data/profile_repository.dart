import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/api_exception.dart';
import '../../../core/network/interceptors.dart';
import '../../home/data/home_dtos.dart' show AddressDto;
import '../../home/data/mock_catalog.dart';
import '../../../shared/models/upload_photo.dart';

part 'profile_repository.freezed.dart';
part 'profile_repository.g.dart';

/// `ProfileDto`: the member's iSure profile. [tier] is the tier key.
@freezed
abstract class ProfileDto with _$ProfileDto {
  const factory ProfileDto({
    required String memberId,
    required String name,
    required String phone,
    required String phoneDisplay,
    String? email,
    String? photoUrl,
    String? dateOfBirth,
    String? address,
    String? township,
    String? state,
    required String tier,
    required String tierLabel,
    int? memberSinceYear,
    @Default(false) bool birthdayToday,
  }) = _ProfileDto;

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);
}

/// `UpdateProfileRequest`: only the fields sent are changed.
class UpdateProfileRequest {
  const UpdateProfileRequest({
    this.name,
    this.email,
    this.dateOfBirth,
    this.address,
    this.township,
    this.state,
  });

  final String? name;
  final String? email;

  /// `yyyy-MM-dd`.
  final String? dateOfBirth;
  final String? address;
  final String? township;
  final String? state;

  bool get isEmpty =>
      name == null &&
      email == null &&
      dateOfBirth == null &&
      address == null &&
      township == null &&
      state == null;

  Map<String, dynamic> toJson() => {
    'name': ?name,
    'email': ?email,
    'dateOfBirth': ?dateOfBirth,
    'address': ?address,
    'township': ?township,
    'state': ?state,
  };
}

@freezed
abstract class PreferencesDto with _$PreferencesDto {
  const factory PreferencesDto({
    required bool pushEnabled,
    String? preferredPayment,
    @Default('en') String language,
  }) = _PreferencesDto;

  factory PreferencesDto.fromJson(Map<String, dynamic> json) =>
      _$PreferencesDtoFromJson(json);
}

/// `PaymentMethodDto`: no card or wallet details, only which one the
/// member prefers.
@freezed
abstract class PaymentMethodDto with _$PaymentMethodDto {
  const factory PaymentMethodDto({
    required String code,
    required String title,
    required String description,
    required bool enabled,
    required bool isDefault,
    String? disabledReason,
  }) = _PaymentMethodDto;

  factory PaymentMethodDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodDtoFromJson(json);
}

/// `AddressRequest`.
class AddressRequest {
  const AddressRequest({
    required this.label,
    required this.line1,
    required this.township,
    this.recipientName,
    this.recipientPhone,
    this.line2,
    this.city,
    this.region,
    this.instructions,
    this.icon,
    this.isDefault = false,
  });

  final String label;
  final String line1;
  final String township;
  final String? recipientName;
  final String? recipientPhone;
  final String? line2;
  final String? city;
  final String? region;
  final String? instructions;
  final String? icon;
  final bool isDefault;

  Map<String, dynamic> toJson() => {
    'label': label,
    'line1': line1,
    'township': township,
    'recipientName': ?recipientName,
    'recipientPhone': ?recipientPhone,
    'line2': ?line2,
    'city': ?city,
    'region': ?region,
    'instructions': ?instructions,
    'icon': ?icon,
    'isDefault': isDefault,
  };
}

/// Profile and account: `me`, avatar, password, preferences, addresses and
/// payment methods.
abstract interface class ProfileRepository {
  Future<ProfileDto> me();
  Future<ProfileDto> updateMe(UpdateProfileRequest request);
  Future<ProfileDto> uploadAvatar(UploadPhoto photo);
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirm,
  });

  Future<PreferencesDto> preferences();
  Future<PreferencesDto> updatePreferences({bool? pushEnabled});

  Future<List<AddressDto>> addresses();

  /// Idempotency-Key: one per tap of "Save address".
  Future<AddressDto> addAddress(
    AddressRequest request, {
    required IdempotencyKey key,
  });
  Future<AddressDto> updateAddress(String id, AddressRequest request);
  Future<void> deleteAddress(String id);

  Future<List<PaymentMethodDto>> paymentMethods();
  Future<List<PaymentMethodDto>> setDefaultPayment(String code);
}

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(Ref ref) =>
    ref.watch(appConfigProvider).isMock
    ? MockProfileRepository()
    : ApiProfileRepository(ref.watch(dioProvider));

class ApiProfileRepository implements ProfileRepository {
  ApiProfileRepository(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> _map(Future<Response<dynamic>> call) async =>
      (await call).data as Map<String, dynamic>;

  Future<List<T>> _list<T>(
    Future<Response<dynamic>> call,
    T Function(Map<String, dynamic>) parse,
  ) async => [
    for (final e in (await call).data as List<dynamic>)
      parse(e as Map<String, dynamic>),
  ];

  @override
  Future<ProfileDto> me() =>
      apiCall(() async => ProfileDto.fromJson(await _map(_dio.get('me'))));

  @override
  Future<ProfileDto> updateMe(UpdateProfileRequest request) => apiCall(
    () async => ProfileDto.fromJson(
      await _map(_dio.patch('me', data: request.toJson())),
    ),
  );

  @override
  Future<ProfileDto> uploadAvatar(UploadPhoto photo) => apiCall(() async {
    final form = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        photo.path,
        filename: photo.fileName,
        contentType: DioMediaType.parse(photo.mimeType),
      ),
    });
    return ProfileDto.fromJson(await _map(_dio.put('me/avatar', data: form)));
  });

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirm,
  }) => apiCall(
    () => _dio.post<void>(
      'me/password',
      data: {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
        'confirm': confirm,
      },
    ),
  );

  @override
  Future<PreferencesDto> preferences() => apiCall(
    () async => PreferencesDto.fromJson(await _map(_dio.get('me/preferences'))),
  );

  @override
  Future<PreferencesDto> updatePreferences({bool? pushEnabled}) => apiCall(
    () async => PreferencesDto.fromJson(
      await _map(
        _dio.patch('me/preferences', data: {'pushEnabled': ?pushEnabled}),
      ),
    ),
  );

  @override
  Future<List<AddressDto>> addresses() =>
      apiCall(() => _list(_dio.get('addresses'), AddressDto.fromJson));

  @override
  Future<AddressDto> addAddress(
    AddressRequest request, {
    required IdempotencyKey key,
  }) => apiCall(
    () async => AddressDto.fromJson(
      await _map(
        _dio.post('addresses', data: request.toJson(), options: key.options),
      ),
    ),
  );

  @override
  Future<AddressDto> updateAddress(String id, AddressRequest request) =>
      apiCall(
        () async => AddressDto.fromJson(
          await _map(
            _dio.put(
              'addresses/${Uri.encodeComponent(id)}',
              data: request.toJson(),
            ),
          ),
        ),
      );

  @override
  Future<void> deleteAddress(String id) =>
      apiCall(() => _dio.delete<void>('addresses/${Uri.encodeComponent(id)}'));

  @override
  Future<List<PaymentMethodDto>> paymentMethods() => apiCall(
    () => _list(_dio.get('payment-methods'), PaymentMethodDto.fromJson),
  );

  @override
  Future<List<PaymentMethodDto>> setDefaultPayment(String code) => apiCall(
    () => _list(
      _dio.put('payment-methods/default', data: {'code': code}),
      PaymentMethodDto.fromJson,
    ),
  );
}

/// Mock flavor: one address book shared by every mock that reads
/// `addresses` (profile, checkout, home), as the API has one.
abstract final class MockAddressBook {
  static final List<AddressDto> items = seed();

  static List<AddressDto> seed() => [
    MockCatalog.homeAddress,
    const AddressDto(
      id: '0b0c3a39-9f5d-4f63-9a25-3d2a7f1c1002',
      label: 'Office',
      recipientName: 'Thiri Aung',
      recipientPhone: '09776234118',
      line1: 'Junction City Tower',
      township: 'Pabedan',
      city: 'Yangon',
      icon: 'briefcase',
      shortLabel: 'Pabedan, Yangon',
      fullText: 'Junction City Tower, Pabedan, Yangon',
    ),
  ];

  /// Tests start from the seed.
  static void reset() => items
    ..clear()
    ..addAll(seed());
}

/// The API doc's examples, kept in memory so edits show up.
class MockProfileRepository implements ProfileRepository {
  MockProfileRepository({this.latency = const Duration(milliseconds: 300)});

  final Duration latency;

  Future<void> _wait() => Future<void>.delayed(latency);

  ProfileDto _me = const ProfileDto(
    memberId: '6f0ab31a48f14aefb5bb825f2764abcd',
    name: 'Thiri Aung',
    phone: '+959776234118',
    phoneDisplay: '+95 9 776 234 118',
    email: 'thiri@example.com',
    dateOfBirth: '1996-04-18',
    address: 'No. 12, Baho Road',
    township: 'Kamayut',
    state: 'Yangon',
    tier: 'classic',
    tierLabel: 'Classic',
    memberSinceYear: 2024,
  );

  PreferencesDto _prefs = const PreferencesDto(
    pushEnabled: true,
    preferredPayment: 'cod',
  );

  String _password = 'sure2026';
  final Map<String, AddressDto> _byKey = {};
  int _seq = 3;

  List<AddressDto> get _addresses => MockAddressBook.items;

  List<PaymentMethodDto> _payments = const [
    PaymentMethodDto(
      code: 'cod',
      title: 'Cash on delivery',
      description: 'Pay the rider in cash or by QR when your order arrives',
      enabled: true,
      isDefault: true,
    ),
    PaymentMethodDto(
      code: 'pay_at_pickup',
      title: 'Pay at pickup',
      description: 'Pay at the store counter when you collect',
      enabled: true,
      isDefault: false,
    ),
    PaymentMethodDto(
      code: 'qr',
      title: 'QR Payment',
      description: 'KBZPay · Wave Pay · AYA Pay',
      enabled: false,
      isDefault: false,
      disabledReason: 'Coming soon — pay on delivery or at pickup for now.',
    ),
  ];

  static ApiException _fields(String code, String message, String field) =>
      ApiException(
        code: code,
        message: message,
        status: 400,
        errors: [ApiFieldError(field: field, code: code, message: message)],
      );

  @override
  Future<ProfileDto> me() async {
    await _wait();
    return _me;
  }

  @override
  Future<ProfileDto> updateMe(UpdateProfileRequest r) async {
    await _wait();
    if (r.name != null && r.name!.trim().isEmpty) {
      throw _fields('mobile.validation_failed', 'Enter your name.', 'name');
    }
    if (r.email != null && r.email!.isNotEmpty && !r.email!.contains('@')) {
      throw _fields(
        'mobile.validation_failed',
        'Enter a valid email address.',
        'email',
      );
    }
    _me = _me.copyWith(
      name: r.name ?? _me.name,
      email: r.email ?? _me.email,
      dateOfBirth: r.dateOfBirth ?? _me.dateOfBirth,
      address: r.address ?? _me.address,
      township: r.township ?? _me.township,
      state: r.state ?? _me.state,
    );
    return _me;
  }

  @override
  Future<ProfileDto> uploadAvatar(UploadPhoto photo) async {
    await _wait();
    // A local file stands in for the uploaded photo's URL.
    _me = _me.copyWith(photoUrl: Uri.file(photo.path).toString());
    return _me;
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirm,
  }) async {
    await _wait();
    if (currentPassword != _password) {
      throw _fields(
        'isure.password_wrong',
        'Incorrect password. Try again.',
        'currentPassword',
      );
    }
    if (newPassword.length < 8 ||
        !newPassword.contains(RegExp('[A-Za-z]')) ||
        !newPassword.contains(RegExp(r'\d'))) {
      throw _fields(
        'mobile.password_weak',
        'Use at least 8 characters with a letter and a number.',
        'newPassword',
      );
    }
    if (newPassword == currentPassword) {
      throw _fields(
        'mobile.password_same',
        'New password must be different from the current one.',
        'newPassword',
      );
    }
    if (confirm != newPassword) {
      throw _fields(
        'mobile.password_mismatch',
        "Passwords don't match.",
        'confirm',
      );
    }
    _password = newPassword;
  }

  @override
  Future<PreferencesDto> preferences() async {
    await _wait();
    return _prefs;
  }

  @override
  Future<PreferencesDto> updatePreferences({bool? pushEnabled}) async {
    await _wait();
    _prefs = _prefs.copyWith(pushEnabled: pushEnabled ?? _prefs.pushEnabled);
    return _prefs;
  }

  AddressDto _fromRequest(String id, AddressRequest r) {
    final city = r.city ?? 'Yangon';
    return AddressDto(
      id: id,
      label: r.label,
      recipientName: r.recipientName ?? _me.name,
      recipientPhone: r.recipientPhone ?? _me.phone,
      line1: r.line1,
      line2: r.line2,
      township: r.township,
      city: city,
      region: r.region,
      instructions: r.instructions,
      icon: r.icon ?? 'map-pin',
      isDefault: r.isDefault,
      shortLabel: '${r.township}, $city',
      fullText: [r.line1, ?r.line2, r.township, city].join(', '),
    );
  }

  void _validate(AddressRequest r) {
    if (r.line1.trim().isEmpty) {
      throw _fields('mobile.validation_failed', 'Enter the address.', 'line1');
    }
    if (r.township.trim().isEmpty) {
      throw _fields(
        'mobile.validation_failed',
        'Enter the township.',
        'township',
      );
    }
  }

  void _put(AddressDto a) {
    if (a.isDefault) {
      for (var i = 0; i < _addresses.length; i++) {
        _addresses[i] = _addresses[i].copyWith(isDefault: false);
      }
    }
    final i = _addresses.indexWhere((x) => x.id == a.id);
    i < 0 ? _addresses.add(a) : _addresses[i] = a;
  }

  @override
  Future<List<AddressDto>> addresses() async {
    await _wait();
    return List.unmodifiable(_addresses);
  }

  @override
  Future<AddressDto> addAddress(
    AddressRequest request, {
    required IdempotencyKey key,
  }) async {
    await _wait();
    if (_byKey[key.value] case final done?) return done;
    _validate(request);
    if (_addresses.length >= 10) {
      throw _fields(
        'mobile.address_limit',
        'You can save up to 10 addresses. Remove one first.',
        'label',
      );
    }
    final a = _fromRequest(
      '01a19b80-177e-7d8d-99bd-0151587fdd${(_seq++).toRadixString(16).padLeft(2, '0')}',
      request,
    );
    _put(a);
    _byKey[key.value] = a;
    return a;
  }

  @override
  Future<AddressDto> updateAddress(String id, AddressRequest request) async {
    await _wait();
    if (!_addresses.any((a) => a.id == id)) {
      throw const ApiException(
        code: 'mobile.not_found',
        message: "We couldn't find that address.",
        status: 404,
      );
    }
    _validate(request);
    final a = _fromRequest(id, request);
    _put(a);
    return a;
  }

  @override
  Future<void> deleteAddress(String id) async {
    await _wait();
    if (_addresses.length <= 1) {
      throw const ApiException(
        code: 'mobile.last_address',
        message: 'Keep at least one saved address.',
        status: 409,
      );
    }
    final removed = _addresses.firstWhere((a) => a.id == id);
    _addresses.remove(removed);
    if (removed.isDefault) {
      _addresses[0] = _addresses[0].copyWith(isDefault: true);
    }
  }

  @override
  Future<List<PaymentMethodDto>> paymentMethods() async {
    await _wait();
    return _payments;
  }

  @override
  Future<List<PaymentMethodDto>> setDefaultPayment(String code) async {
    await _wait();
    if (!_payments.any((p) => p.code == code && p.enabled)) {
      throw _fields(
        'mobile.validation_failed',
        'Choose cash on delivery or pay at pickup.',
        'code',
      );
    }
    _payments = [
      for (final p in _payments) p.copyWith(isDefault: p.code == code),
    ];
    _prefs = _prefs.copyWith(preferredPayment: code);
    return _payments;
  }
}
