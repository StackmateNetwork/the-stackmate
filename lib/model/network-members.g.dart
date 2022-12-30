// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network-members.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NetworkMembersClassAdapter extends TypeAdapter<_$_NetworkMembers> {
  @override
  final int typeId = 12;

  @override
  _$_NetworkMembers read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_NetworkMembers(
      hostname: fields[0] as int,
      genesis: fields[1] as int,
      pubkey: fields[2] as String,
      username: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_NetworkMembers obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.hostname)
      ..writeByte(1)
      ..write(obj.genesis)
      ..writeByte(2)
      ..write(obj.pubkey)
      ..writeByte(3)
      ..write(obj.username);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetworkMembersClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NetworkMembers _$$_NetworkMembersFromJson(Map<String, dynamic> json) =>
    _$_NetworkMembers(
      hostname: json['hostname'] as int,
      genesis: json['genesis'] as int,
      pubkey: json['pubkey'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$$_NetworkMembersToJson(_$_NetworkMembers instance) =>
    <String, dynamic>{
      'hostname': instance.hostname,
      'genesis': instance.genesis,
      'pubkey': instance.pubkey,
      'username': instance.username,
    };
