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
      id: fields[0] as int?,
      latestGenesis: fields[1] as int,
      corruptedPostIds: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_NetworkChatHistory obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.latestGenesis)
      ..writeByte(2)
      ..write(obj.corruptedPostIds);
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
