// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogImpl _$$LogImplFromJson(Map<String, dynamic> json) => _$LogImpl(
      type: $enumDecode(_$LogTypeEnumMap, json['type']),
      path: json['path'] as String?,
      response: json['response'] as String?,
      statusCode: json['statusCode'] as String?,
      bloc: json['bloc'] as String?,
      event: json['event'] as String?,
      exceptionType: json['exceptionType'] as String?,
      exceptionSource: json['exceptionSource'] as String?,
      stackTrace: json['stackTrace'] as String?,
    );

Map<String, dynamic> _$$LogImplToJson(_$LogImpl instance) => <String, dynamic>{
      'type': _$LogTypeEnumMap[instance.type]!,
      'path': instance.path,
      'response': instance.response,
      'statusCode': instance.statusCode,
      'bloc': instance.bloc,
      'event': instance.event,
      'exceptionType': instance.exceptionType,
      'exceptionSource': instance.exceptionSource,
      'stackTrace': instance.stackTrace,
    };

const _$LogTypeEnumMap = {
  LogType.api: 'api',
  LogType.event: 'event',
  LogType.exception: 'exception',
};
