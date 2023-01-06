// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network-posts-index.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NetworkPostsIndexClassAdapter extends TypeAdapter<_$_NetworkPostsIndex> {
  @override
  final int typeId = 14;

  @override
  _$_NetworkPostsIndex read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_NetworkPostsIndex(
      id: fields[0] as int?,
      lastIndex: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_NetworkPostsIndex obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.lastIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetworkPostsIndexClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NetworkPostsIndex _$$_NetworkPostsIndexFromJson(Map<String, dynamic> json) =>
    _$_NetworkPostsIndex(
      id: json['id'] as int?,
      lastIndex: json['lastIndex'] as int,
    );

Map<String, dynamic> _$$_NetworkPostsIndexToJson(
        _$_NetworkPostsIndex instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastIndex': instance.lastIndex,
    };
