// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network-posts-info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NetworkPostsInfoClassAdapter extends TypeAdapter<_$_NetworkPostsInfo> {
  @override
  final int typeId = 14;

  @override
  _$_NetworkPostsInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_NetworkPostsInfo(
      latestGenesis: fields[0] as int,
      corruptedPostIds: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_NetworkPostsInfo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.latestGenesis)
      ..writeByte(1)
      ..write(obj.corruptedPostIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetworkPostsInfoClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NetworkPostsInfo _$$_NetworkPostsInfoFromJson(Map<String, dynamic> json) =>
    _$_NetworkPostsInfo(
      latestGenesis: json['latestGenesis'] as int,
      corruptedPostIds: (json['corruptedPostIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_NetworkPostsInfoToJson(_$_NetworkPostsInfo instance) =>
    <String, dynamic>{
      'latestGenesis': instance.latestGenesis,
      'corruptedPostIds': instance.corruptedPostIds,
    };
