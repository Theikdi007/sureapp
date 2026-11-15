import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/models/upload_photo.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../home/data/home_dtos.dart' show AddressDto;
import '../data/profile_repository.dart';

part 'profile_providers.g.dart';

/// Who is signed in: memberId, '' when unknown, null when signed out. Only
/// notifies when that changes.
@Riverpod(keepAlive: true)
String? currentMemberId(Ref ref) => switch (ref.watch(sessionProvider).value) {
  SignedIn(:final member) => member?.memberId ?? '',
  _ => null,
};

/// Rebuild kept-alive member data when someone else signs in (or out).
void _perMember(Ref ref) => ref.watch(currentMemberIdProvider);

/// `GET me`, replaced by the answers of `PATCH me` and `PUT me/avatar`.
@Riverpod(keepAlive: true)
class Profile extends _$Profile {
  @override
  Future<ProfileDto> build() {
    _perMember(ref);
    return ref.watch(profileRepositoryProvider).me();
  }

  Future<ProfileDto> save(UpdateProfileRequest request) async {
    final me = await ref.read(profileRepositoryProvider).updateMe(request);
    state = AsyncData(me);
    return me;
  }

  Future<ProfileDto> uploadAvatar(UploadPhoto photo) async {
    final me = await ref.read(profileRepositoryProvider).uploadAvatar(photo);
    state = AsyncData(me);
    return me;
  }
}

/// `GET me/preferences`; the push switch is optimistic.
@Riverpod(keepAlive: true)
class Preferences extends _$Preferences {
  @override
  Future<PreferencesDto> build() {
    _perMember(ref);
    return ref.watch(profileRepositoryProvider).preferences();
  }

  Future<void> setPush(bool on) async {
    final before = state.value;
    if (before != null) state = AsyncData(before.copyWith(pushEnabled: on));
    try {
      state = AsyncData(
        await ref
            .read(profileRepositoryProvider)
            .updatePreferences(pushEnabled: on),
      );
    } on Object {
      if (before != null) state = AsyncData(before);
      rethrow;
    }
  }
}

@riverpod
Future<List<AddressDto>> savedAddresses(Ref ref) =>
    ref.watch(profileRepositoryProvider).addresses();

/// `GET payment-methods`; `PUT payment-methods/default` answers the list.
@riverpod
class PaymentMethods extends _$PaymentMethods {
  @override
  Future<List<PaymentMethodDto>> build() =>
      ref.watch(profileRepositoryProvider).paymentMethods();

  Future<void> setDefault(String code) async {
    state = AsyncData(
      await ref.read(profileRepositoryProvider).setDefaultPayment(code),
    );
  }
}
