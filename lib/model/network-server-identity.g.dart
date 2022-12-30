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
      hostname: fields[0] as String,
      name: fields[1] as String,
      pubkey: fields[2] as String,
      kind: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_NetworkServerIdentity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.hostname)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.pubkey)
      ..writeByte(3)
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
      hostname: json['hostname'] as String,
      name: json['name'] as String,
      pubkey: json['pubkey'] as String,
      kind: json['kind'] as String,
    );

Map<String, dynamic> _$$_NetworkServerIdentityToJson(
        _$_NetworkServerIdentity instance) =>
    <String, dynamic>{
      'hostname': instance.hostname,
      'name': instance.name,
      'pubkey': instance.pubkey,
      'kind': instance.kind,
    };
