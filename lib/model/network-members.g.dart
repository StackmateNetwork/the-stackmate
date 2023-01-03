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
      id: fields[0] as int?,
      members: (fields[1] as List).cast<MemberIdentity>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_NetworkMembers obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.members);
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
      id: json['id'] as int?,
      members: (json['members'] as List<dynamic>)
          .map((e) => MemberIdentity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NetworkMembersToJson(_$_NetworkMembers instance) =>
    <String, dynamic>{
      'id': instance.id,
      'members': instance.members,
    };
