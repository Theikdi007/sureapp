import 'dart:async';

import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../storage/token_storage.dart';
import 'api_exception.dart';

/// Request option `extra` keys understood by the interceptors.
abstract final class RequestFlags {
  /// Adds `X-Device-Name` (sign-in calls).
  static const sendDeviceName = 'sendDeviceName';

  /// Skips the bearer token and the refresh logic (auth endpoints).
  static const skipAuth = 'skipAuth';

  static const _retried = '_retried';
}

/// Sends the app headers on every call.
class AppHeadersInterceptor extends Interceptor {
  AppHeadersInterceptor({
    required this.appVersion,
    required this.platform,
    required this.deviceName,
    required this.languageCode,
  });

  final String appVersion;
  final String platform;
  final String deviceName;

  /// Read on every request so a language switch applies immediately.
  final String Function() languageCode;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-App-Version'] = appVersion;
    options.headers['X-Platform'] = platform;
    options.headers['Accept'] = 'application/json';
    options.headers['Accept-Language'] = languageCode();
    if (options.extra[RequestFlags.sendDeviceName] == true) {
      options.headers['X-Device-Name'] = deviceName;
    }
    handler.next(options);
  }
}

/// Reports `410 mobile.update_required` (app below the minimum version) so
/// the router can block the app with the update screen.
class UpdateRequiredInterceptor extends Interceptor {
  UpdateRequiredInterceptor(this.onUpdateRequired);

  final void Function() onUpdateRequired;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 410 &&
        ApiException.fromDio(err).code == ApiException.updateRequired) {
      onUpdateRequired();
    }
    handler.next(err);
  }
}

/// Bearer token + one refresh-and-retry on `401 mobile.unauthenticated`.
///
/// Concurrent 401s share a single refresh call, because the refresh token
/// rotates and a second use of the old one would end the session.
class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor({
    required this.plainDio,
    required this.tokens,
    required this.onSessionEnded,
  });

  /// Same base options and app headers, but without this interceptor. Used
  /// for the refresh call and the retry so a failing retry can't deadlock
  /// this queued interceptor.
  final Dio plainDio;
  final TokenStorage tokens;

  /// Called when refresh fails: send the user to sign-in.
  final FutureOr<void> Function() onSessionEnded;

  Future<AuthTokens?>? _refreshing;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra[RequestFlags.skipAuth] != true) {
      final current = await tokens.read();
      if (current != null) {
        options.headers['Authorization'] = 'Bearer ${current.accessToken}';
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    final problem = ApiException.fromDio(err);
    final canRetry =
        err.response?.statusCode == 401 &&
        problem.code == ApiException.unauthenticated &&
        options.extra[RequestFlags.skipAuth] != true &&
        options.extra[RequestFlags._retried] != true;

    if (problem.code == ApiException.sessionEnded) {
      await tokens.clear();
      await onSessionEnded();
      return handler.next(err);
    }
    if (!canRetry) return handler.next(err);

    final sentToken = options.headers['Authorization'];
    final current = await tokens.read();
    AuthTokens? fresh;
    if (current != null && sentToken != 'Bearer ${current.accessToken}') {
      // Another request already refreshed while this one was in flight.
      fresh = current;
    } else {
      fresh = await (_refreshing ??= _refresh().whenComplete(
        () => _refreshing = null,
      ));
    }
    if (fresh == null) return handler.next(err);

    try {
      options.extra[RequestFlags._retried] = true;
      options.headers['Authorization'] = 'Bearer ${fresh.accessToken}';
      // A sent multipart body is finalized and can't be sent again.
      if (options.data case final FormData form) options.data = form.clone();
      // Same options => same Idempotency-Key on the retry.
      handler.resolve(await plainDio.fetch<dynamic>(options));
    } on DioException catch (retryErr) {
      handler.next(retryErr);
    }
  }

  Future<AuthTokens?> _refresh() async {
    final current = await tokens.read();
    if (current == null) return null;
    try {
      final res = await plainDio.post<Map<String, dynamic>>(
        'auth/refresh',
        data: {'refreshToken': current.refreshToken},
        options: Options(extra: {RequestFlags.skipAuth: true}),
      );
      final body = res.data!;
      final next = AuthTokens(
        accessToken: body['accessToken'] as String,
        refreshToken: body['refreshToken'] as String,
      );
      await tokens.save(next);
      return next;
    } on DioException {
      await tokens.clear();
      await onSessionEnded();
      return null;
    }
  }
}

/// One `Idempotency-Key` per user action. Create it when the user taps,
/// pass the same [IdempotencyKey] to every retry of that action.
extension type const IdempotencyKey._(String value) {
  factory IdempotencyKey.generate() => IdempotencyKey._(const Uuid().v4());

  Options get options => Options(headers: {'Idempotency-Key': value});
}

/// Runs an API call and turns transport/HTTP failures into [ApiException].
Future<T> apiCall<T>(Future<T> Function() call) async {
  try {
    return await call();
  } on DioException catch (e) {
    throw ApiException.fromDio(e);
  }
}
