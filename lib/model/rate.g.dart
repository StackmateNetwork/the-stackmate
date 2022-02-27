// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Rate _$$_RateFromJson(Map<String, dynamic> json) => _$_Rate(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$_RateToJson(_$_Rate instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'rate': instance.rate,
    };
