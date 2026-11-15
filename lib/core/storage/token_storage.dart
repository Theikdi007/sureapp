import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthTokens {
  const AuthTokens({required this.accessToken, required this.refreshToken});

  final String accessToken;
  final String refreshToken;
}

/// Keeps the token pair in the Keychain / Android Keystore.
class TokenStorage {
  TokenStorage([FlutterSecureStorage? storage])
    : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  static const _accessKey = 'auth.access_token';
  static const _refreshKey = 'auth.refresh_token';
  static const _memberKey = 'auth.member';

  AuthTokens? _cache;

  Future<AuthTokens?> read() async {
    if (_cache != null) return _cache;
    final access = await _storage.read(key: _accessKey);
    final refresh = await _storage.read(key: _refreshKey);
    if (access == null || refresh == null) return null;
    return _cache = AuthTokens(accessToken: access, refreshToken: refresh);
  }

  /// The refresh token rotates on every refresh: always store both.
  Future<void> save(AuthTokens tokens) async {
    _cache = tokens;
    await _storage.write(key: _accessKey, value: tokens.accessToken);
    await _storage.write(key: _refreshKey, value: tokens.refreshToken);
  }

  /// The signed-in member's brief profile as JSON, shown before `/me` loads.
  Future<String?> readMember() => _storage.read(key: _memberKey);

  Future<void> saveMember(String json) =>
      _storage.write(key: _memberKey, value: json);

  Future<void> clear() async {
    _cache = null;
    await _storage.delete(key: _accessKey);
    await _storage.delete(key: _refreshKey);
    await _storage.delete(key: _memberKey);
  }
}
