// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RateImpl _$$RateImplFromJson(Map<String, dynamic> json) => _$RateImpl(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$RateImplToJson(_$RateImpl instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'rate': instance.rate,
    };
