// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Rate _$RateFromJson(Map<String, dynamic> json) => _Rate(
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  rate: (json['rate'] as num).toDouble(),
);

Map<String, dynamic> _$RateToJson(_Rate instance) => <String, dynamic>{
  'symbol': instance.symbol,
  'name': instance.name,
  'rate': instance.rate,
};
