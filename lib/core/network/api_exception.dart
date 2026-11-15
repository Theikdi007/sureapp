import 'package:dio/dio.dart';

/// One field problem from `errors[]` in an API problem response.
class ApiFieldError {
  const ApiFieldError({this.field, required this.code, required this.message});

  final String? field;
  final String code;
  final String message;
}

/// An API problem response (`{type, title, status, detail, code, errors, requestId}`),
/// or a transport failure when [status] is null.
class ApiException implements Exception {
  const ApiException({
    required this.code,
    required this.message,
    this.status,
    this.errors = const [],
    this.requestId,
    this.body,
  });

  factory ApiException.fromDio(DioException e) {
    final data = e.response?.data;
    if (data is Map<String, dynamic> && data['code'] is String) {
      final rawErrors = data['errors'];
      return ApiException(
        code: data['code'] as String,
        message: (data['detail'] ?? data['title'] ?? '') as String,
        status: data['status'] as int? ?? e.response?.statusCode,
        requestId: data['requestId'] as String?,
        body: data,
        errors: rawErrors is List
            ? [
                for (final err in rawErrors.whereType<Map<String, dynamic>>())
                  ApiFieldError(
                    field: err['field'] as String?,
                    code: err['code'] as String? ?? '',
                    message: err['message'] as String? ?? '',
                  ),
              ]
            : const [],
      );
    }
    return ApiException(
      code: switch (e.type) {
        DioExceptionType.connectionTimeout ||
        DioExceptionType.sendTimeout ||
        DioExceptionType.receiveTimeout => 'network.timeout',
        DioExceptionType.connectionError => 'network.offline',
        DioExceptionType.cancel => 'network.cancelled',
        _ => 'network.unknown',
      },
      message: e.message ?? '',
      status: e.response?.statusCode,
    );
  }

  final String code;
  final String message;
  final int? status;
  final List<ApiFieldError> errors;
  final String? requestId;

  /// The whole problem body, for extras like `quote` on
  /// `409 channel.price_changed`.
  final Map<String, dynamic>? body;

  static const unauthenticated = 'mobile.unauthenticated';
  static const refreshInvalid = 'mobile.refresh_invalid';
  static const sessionEnded = 'mobile.session_ended';
  static const updateRequired = 'mobile.update_required';

  /// Text to show the user. API problems carry a ready-to-show `detail`;
  /// transport failures get a generic line.
  String get userMessage => switch (code) {
    'network.offline' => "You're offline. Check your connection and try again.",
    'network.timeout' => 'That took too long. Try again.',
    _ when status != null && message.isNotEmpty => message,
    _ => 'Something went wrong. Try again.',
  };

  /// First field error's message for [field], if any.
  String? fieldMessage(String field) {
    for (final e in errors) {
      if (e.field == field) return e.message;
    }
    return null;
  }

  @override
  String toString() => 'ApiException($status $code: $message)';
}
