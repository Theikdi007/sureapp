// Test-only stand-in moved out of the app build; data from the API doc's
// JSON examples and the prototype.
import 'mocks.dart';

import 'package:sure_app/core/network/api_exception.dart';
import 'package:sure_app/core/network/interceptors.dart';
import 'package:sure_app/features/home/data/home_dtos.dart' show AddressDto;
import 'package:sure_app/features/profile/data/profile_repository.dart';
import 'package:sure_app/shared/models/upload_photo.dart';

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
