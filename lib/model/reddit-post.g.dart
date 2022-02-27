// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit-post.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RedditPostClassAdapter extends TypeAdapter<_$_RedditPost> {
  @override
  final int typeId = 8;

  @override
  _$_RedditPost read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_RedditPost(
      title: fields[0] as String,
      permalink: fields[1] as String,
      score: fields[2] as int,
      thumbnail: fields[3] as String,
      url: fields[4] as String,
      createdAt: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, _$_RedditPost obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.permalink)
      ..writeByte(2)
      ..write(obj.score)
      ..writeByte(3)
      ..write(obj.thumbnail)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RedditPostClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RedditPost _$$_RedditPostFromJson(Map<String, dynamic> json) =>
    _$_RedditPost(
      title: json['title'] as String,
      permalink: json['permalink'] as String,
      score: json['score'] as int,
      thumbnail: json['thumbnail'] as String,
      url: json['url'] as String,
      createdAt: (json['created_utc'] as num).toDouble(),
    );

Map<String, dynamic> _$$_RedditPostToJson(_$_RedditPost instance) =>
    <String, dynamic>{
      'title': instance.title,
      'permalink': instance.permalink,
      'score': instance.score,
      'thumbnail': instance.thumbnail,
      'url': instance.url,
      'created_utc': instance.createdAt,
    };
