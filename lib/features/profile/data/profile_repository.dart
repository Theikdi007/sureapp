import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core_providers.dart';
import '../../../core/network/interceptors.dart';
import '../../home/data/home_dtos.dart' show AddressDto;
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
    ApiProfileRepository(ref.watch(dioProvider));

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
