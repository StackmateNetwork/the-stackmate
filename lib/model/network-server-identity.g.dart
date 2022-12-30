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
      pubkey: fields[3] as String,
      kind: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_NetworkServerIdentity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.hostname)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.pubkey)
      ..writeByte(4)
      ..write(obj.kind);
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
      pubkey: json['pubkey'] as String,
      kind: json['kind'] as String,
    );

Map<String, dynamic> _$$_NetworkServerIdentityToJson(
        _$_NetworkServerIdentity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hostname': instance.hostname,
      'name': instance.name,
      'pubkey': instance.pubkey,
      'kind': instance.kind,
    };
