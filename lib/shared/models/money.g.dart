// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Money _$MoneyFromJson(Map<String, dynamic> json) =>
    _Money(value: json['value'] as num, currency: json['currency'] as String);

Map<String, dynamic> _$MoneyToJson(_Money instance) => <String, dynamic>{
  'value': instance.value,
  'currency': instance.currency,
};

_LinkDto _$LinkDtoFromJson(Map<String, dynamic> json) =>
    _LinkDto(type: json['type'] as String, value: json['value'] as String?);

Map<String, dynamic> _$LinkDtoToJson(_LinkDto instance) => <String, dynamic>{
  'type': instance.type,
  'value': instance.value,
};
