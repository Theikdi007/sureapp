import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'money.freezed.dart';
part 'money.g.dart';

/// `{value, currency}` from the API. The app never adds, subtracts or
/// converts money: totals always come from the API. This only formats.
@freezed
abstract class Money with _$Money {
  const Money._();

  const factory Money({required num value, required String currency}) = _Money;

  factory Money.fromJson(Map<String, dynamic> json) => _$MoneyFromJson(json);

  static final _grouped = NumberFormat('#,##0', 'en_US');

  /// Prototype style: `Ks 2,643,900` for MMK, `<CUR> 1,234` otherwise.
  String get display {
    final amount = _grouped.format(value);
    return currency == 'MMK' ? 'Ks $amount' : '$currency $amount';
  }

  /// `2,643,900 MMK` (prototype totals).
  String get displayCode => '${_grouped.format(value)} $currency';
}

/// Where a tap goes (`LinkDto`): search, brand, vendor, product, deals,
/// order, reward, warranty_claim, home_setup, url.
@freezed
abstract class LinkDto with _$LinkDto {
  const factory LinkDto({required String type, String? value}) = _LinkDto;

  factory LinkDto.fromJson(Map<String, dynamic> json) =>
      _$LinkDtoFromJson(json);
}

/// `Page<T>`: `{items, nextCursor}`; `nextCursor == null` is the last page.
class Page<T> {
  const Page({required this.items, this.nextCursor});

  factory Page.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) item,
  ) => Page(
    items: [
      for (final e in (json['items'] as List? ?? const []))
        item(e as Map<String, dynamic>),
    ],
    nextCursor: json['nextCursor'] as String?,
  );

  final List<T> items;
  final String? nextCursor;

  bool get isLast => nextCursor == null;
}
