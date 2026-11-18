import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sure_app/core/network/interceptors.dart';
import 'package:sure_app/core/storage/token_storage.dart';

/// Answers `GET me` with a 401 (expired access token) and `auth/refresh`
/// with whatever the test asks for.
class _Adapter implements HttpClientAdapter {
  _Adapter(this.refresh);

  final Future<ResponseBody> Function(RequestOptions) refresh;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (options.path.endsWith('auth/refresh')) return refresh(options);
    return ResponseBody.fromString(
      jsonEncode({'code': 'mobile.unauthenticated', 'status': 401}),
      401,
      headers: {
        Headers.contentTypeHeader: ['application/problem+json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  Future<(TokenStorage, int)> run(
    Future<ResponseBody> Function(RequestOptions) refresh,
  ) async {
    FlutterSecureStorage.setMockInitialValues({
      'auth.access_token': 'old-access',
      'auth.refresh_token': 'old-refresh',
    });
    final tokens = TokenStorage();
    var ended = 0;
    final base = BaseOptions(baseUrl: 'https://example.test/');
    final plain = Dio(base)..httpClientAdapter = _Adapter(refresh);
    final dio = Dio(base)
      ..httpClientAdapter = _Adapter(refresh)
      ..interceptors.add(
        AuthInterceptor(
          plainDio: plain,
          tokens: tokens,
          onSessionEnded: () => ended++,
        ),
      );
    await expectLater(dio.get<void>('me'), throwsA(isA<DioException>()));
    return (tokens, ended);
  }

  test('no network during refresh keeps the member signed in', () async {
    final (tokens, ended) = await run(
      (o) => throw DioException.connectionError(
        requestOptions: o,
        reason: 'Network is unreachable',
      ),
    );
    expect(ended, 0);
    expect((await tokens.read())?.refreshToken, 'old-refresh');
  });

  test('a server error during refresh keeps the member signed in', () async {
    final (tokens, ended) = await run(
      (_) async => ResponseBody.fromString('{}', 503),
    );
    expect(ended, 0);
    expect(await tokens.read(), isNotNull);
  });

  test('a rejected refresh token ends the session', () async {
    final (tokens, ended) = await run(
      (_) async => ResponseBody.fromString(
        jsonEncode({'code': 'mobile.refresh_invalid', 'status': 401}),
        401,
      ),
    );
    expect(ended, 1);
    expect(await tokens.read(), isNull);
  });

  String jwt(DateTime exp) {
    String part(Map<String, Object> m) =>
        base64Url.encode(utf8.encode(jsonEncode(m))).replaceAll('=', '');
    return '${part({'alg': 'HS256'})}.'
        '${part({'exp': exp.millisecondsSinceEpoch ~/ 1000})}.sig';
  }

  test('reads the JWT expiry', () {
    final now = DateTime.utc(2026, 11, 17, 12);
    expect(
      accessTokenExpired(jwt(now.add(const Duration(minutes: 10))), now: now),
      isFalse,
    );
    expect(
      accessTokenExpired(jwt(now.add(const Duration(seconds: 10))), now: now),
      isTrue,
    );
    expect(accessTokenExpired('not-a-jwt', now: now), isFalse);
  });

  test('an expired access token is refreshed before the request', () async {
    final expired = jwt(
      DateTime.now().toUtc().subtract(const Duration(minutes: 1)),
    );
    FlutterSecureStorage.setMockInitialValues({
      'auth.access_token': expired,
      'auth.refresh_token': 'old-refresh',
    });
    final tokens = TokenStorage();
    final sent = <String?>[];
    final adapter = _Recorder(sent);
    final base = BaseOptions(baseUrl: 'https://example.test/');
    final plain = Dio(base)..httpClientAdapter = adapter;
    final dio = Dio(base)
      ..httpClientAdapter = adapter
      ..interceptors.add(
        AuthInterceptor(plainDio: plain, tokens: tokens, onSessionEnded: () {}),
      );
    await dio.get<void>('home');
    // The refresh went first; home went out with the new token.
    expect(sent, ['auth/refresh', 'home Bearer new-access']);
  });
}

/// Records each request; answers refresh with a new pair and others 200.
class _Recorder implements HttpClientAdapter {
  _Recorder(this.sent);

  final List<String?> sent;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (options.path.endsWith('auth/refresh')) {
      sent.add('auth/refresh');
      return ResponseBody.fromString(
        jsonEncode({
          'accessToken': 'new-access',
          'refreshToken': 'new-refresh',
        }),
        200,
        headers: {
          Headers.contentTypeHeader: ['application/json'],
        },
      );
    }
    sent.add('${options.path} ${options.headers['Authorization']}');
    return ResponseBody.fromString('{}', 200);
  }

  @override
  void close({bool force = false}) {}
}
