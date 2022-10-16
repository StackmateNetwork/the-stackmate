// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network-my-identity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NetworkMyIdentityClassAdapter extends TypeAdapter<_$_NetworkMyIdentity> {
  @override
  final int typeId = 10;

  @override
  _$_NetworkMyIdentity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_NetworkMyIdentity(
      hostname: fields[0] as String,
      username: fields[1] as String,
      pubkey: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_NetworkMyIdentity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.hostname)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.pubkey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetworkMyIdentityClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NetworkMyIdentity _$$_NetworkMyIdentityFromJson(Map<String, dynamic> json) =>
    _$_NetworkMyIdentity(
      hostname: json['hostname'] as String,
      username: json['username'] as String,
      pubkey: json['pubkey'] as String,
    );

Map<String, dynamic> _$$_NetworkMyIdentityToJson(
        _$_NetworkMyIdentity instance) =>
    <String, dynamic>{
      'hostname': instance.hostname,
      'username': instance.username,
      'pubkey': instance.pubkey,
    };
