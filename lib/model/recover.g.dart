// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecoveredKey _$RecoveredKeyFromJson(Map<String, dynamic> json) =>
    _RecoveredKey(
      seed: json['seed'] as String?,
      root: json['root'] as String?,
      fingerprint: json['fingerprint'] as String?,
      network: json['network'] as String?,
    );

Map<String, dynamic> _$RecoveredKeyToJson(_RecoveredKey instance) =>
    <String, dynamic>{
      'seed': instance.seed,
      'root': instance.root,
      'fingerprint': instance.fingerprint,
      'network': instance.network,
    };
