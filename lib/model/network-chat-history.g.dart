// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network-chat-history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NetworkChatHistoryClassAdapter
    extends TypeAdapter<_$_NetworkChatHistory> {
  @override
  final int typeId = 13;

  @override
  _$_NetworkChatHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_NetworkChatHistory(
      hostname: fields[0] as String,
      counterParty: fields[1] as String,
      posts: (fields[2] as List).cast<PlainPost>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_NetworkChatHistory obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.hostname)
      ..writeByte(1)
      ..write(obj.counterParty)
      ..writeByte(2)
      ..write(obj.posts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetworkChatHistoryClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
