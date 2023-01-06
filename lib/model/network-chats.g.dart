// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network-chats.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NetworkChatsClassAdapter extends TypeAdapter<_$_NetworkChats> {
  @override
  final int typeId = 15;

  @override
  _$_NetworkChats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_NetworkChats(
      id: fields[0] as int,
      pubkey: fields[1] as String,
      username: fields[2] as String,
      posts: (fields[3] as List)
          .map((dynamic e) => (e as Map).cast<String, dynamic>())
          .toList(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_NetworkChats obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.pubkey)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.posts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetworkChatsClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
