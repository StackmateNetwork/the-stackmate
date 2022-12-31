// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network-server-identity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NetworkServerIdentityClassAdapter
    extends TypeAdapter<_$_NetworkServerIdentity> {
  @override
  final int typeId = 11;

  @override
  _$_NetworkServerIdentity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_NetworkServerIdentity(
      id: fields[0] as int?,
      hostname: fields[1] as String,
      name: fields[2] as String,
      serverPubkey: fields[3] as String,
      kind: fields[4] as String,
      username: fields[5] as String,
      inviteCode: fields[6] as String,
      inviteCount: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_NetworkServerIdentity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.hostname)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.serverPubkey)
      ..writeByte(4)
      ..write(obj.kind)
      ..writeByte(5)
      ..write(obj.username)
      ..writeByte(6)
      ..write(obj.inviteCode)
      ..writeByte(7)
      ..write(obj.inviteCount);
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
      id: json['id'] as int?,
      hostname: json['hostname'] as String,
      name: json['name'] as String,
      serverPubkey: json['serverPubkey'] as String,
      kind: json['kind'] as String,
      username: json['username'] as String,
      inviteCode: json['inviteCode'] as String,
      inviteCount: json['inviteCount'] as int,
    );

Map<String, dynamic> _$$_NetworkServerIdentityToJson(
        _$_NetworkServerIdentity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hostname': instance.hostname,
      'name': instance.name,
      'serverPubkey': instance.serverPubkey,
      'kind': instance.kind,
      'username': instance.username,
      'inviteCode': instance.inviteCode,
      'inviteCount': instance.inviteCount,
    };
