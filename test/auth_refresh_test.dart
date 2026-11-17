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
}
