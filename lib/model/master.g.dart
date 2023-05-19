// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MasterKey _$$_MasterKeyFromJson(Map<String, dynamic> json) => _$_MasterKey(
      seed: json['seed'] as String?,
      root: json['root'] as String?,
      fingerprint: json['fingerprint'] as String?,
      network: json['network'] as String?,
      backedUp: json['backedUp'] as bool?,
    );

Map<String, dynamic> _$$_MasterKeyToJson(_$_MasterKey instance) =>
    <String, dynamic>{
      'seed': instance.seed,
      'root': instance.root,
      'fingerprint': instance.fingerprint,
      'network': instance.network,
      'backedUp': instance.backedUp,
    };
