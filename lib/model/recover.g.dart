// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecoveredKeyImpl _$$RecoveredKeyImplFromJson(Map<String, dynamic> json) =>
    _$RecoveredKeyImpl(
      seed: json['seed'] as String?,
      root: json['root'] as String?,
      fingerprint: json['fingerprint'] as String?,
      network: json['network'] as String?,
    );

Map<String, dynamic> _$$RecoveredKeyImplToJson(_$RecoveredKeyImpl instance) =>
    <String, dynamic>{
      'seed': instance.seed,
      'root': instance.root,
      'fingerprint': instance.fingerprint,
      'network': instance.network,
    };
