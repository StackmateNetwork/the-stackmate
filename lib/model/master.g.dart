// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MasterKeyImpl _$$MasterKeyImplFromJson(Map<String, dynamic> json) =>
    _$MasterKeyImpl(
      seed: json['seed'] as String?,
      root: json['root'] as String?,
      fingerprint: json['fingerprint'] as String?,
      network: json['network'] as String?,
      backedUp: json['backedUp'] as bool?,
    );

Map<String, dynamic> _$$MasterKeyImplToJson(_$MasterKeyImpl instance) =>
    <String, dynamic>{
      'seed': instance.seed,
      'root': instance.root,
      'fingerprint': instance.fingerprint,
      'network': instance.network,
      'backedUp': instance.backedUp,
    };
