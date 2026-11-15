import 'package:intl/intl.dart';

/// API timestamps are UTC ISO 8601; the app shows Myanmar time (UTC+06:30)
/// regardless of the device time zone.
abstract final class MyanmarTime {
  static const offset = Duration(hours: 6, minutes: 30);

  /// A wall-clock [DateTime] in Myanmar time. Only use it for display.
  static DateTime fromUtc(DateTime utc) => utc.toUtc().add(offset);

  static DateTime parse(String iso) => fromUtc(DateTime.parse(iso));

  static String format(String iso, {String pattern = 'd MMM y, h:mm a'}) =>
      DateFormat(pattern).format(parse(iso));
}
