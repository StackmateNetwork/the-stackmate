// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network-server-identity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NetworkServerIdentityClassAdapter
    extends TypeAdapter<_$_NetworkServerIdentity> {
  @override
  final int typeId = 9;

  @override
  _$_NetworkServerIdentity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_NetworkServerIdentity(
      hostName: fields[0] as String,
      name: fields[1] as String,
      pubkey: fields[2] as String,
      kind: fields[3] as String,
      memberCount: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_NetworkServerIdentity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.hostName)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.pubkey)
      ..writeByte(3)
      ..write(obj.kind)
      ..writeByte(4)
      ..write(obj.memberCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetworkServerIdentityClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NetworkServerIdentity _$$_NetworkServerIdentityFromJson(
        Map<String, dynamic> json) =>
    _$_NetworkServerIdentity(
      hostName: json['hostName'] as String,
      name: json['name'] as String,
      pubkey: json['pubkey'] as String,
      kind: json['kind'] as String,
      memberCount: json['memberCount'] as int,
    );

Map<String, dynamic> _$$_NetworkServerIdentityToJson(
        _$_NetworkServerIdentity instance) =>
    <String, dynamic>{
      'hostName': instance.hostName,
      'name': instance.name,
      'pubkey': instance.pubkey,
      'kind': instance.kind,
      'memberCount': instance.memberCount,
    };
