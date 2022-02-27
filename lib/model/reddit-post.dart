// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'reddit-post.g.dart';
part 'reddit-post.freezed.dart';

@freezed
class RedditPost with _$RedditPost {
  @HiveType(typeId: 8, adapterName: 'RedditPostClassAdapter')
  const factory RedditPost({
    @HiveField(0) required String title,
    @HiveField(1) required String permalink,
    @HiveField(2) required int score,
    @HiveField(3) required String thumbnail,
    @HiveField(4) required String url,
    @HiveField(5) @JsonKey(name: 'created_utc') required double createdAt,
  }) = _RedditPost;
  const RedditPost._();

  factory RedditPost.fromJson(Map<String, dynamic> json) =>
      _$RedditPostFromJson(json);

  String time() {
    String date = '';
    final inttime = createdAt.toInt();
    final DateTime dt =
        DateTime.fromMillisecondsSinceEpoch(inttime * 1000, isUtc: true);
    date += dt.day.toString() +
        '-' +
        dt.month.toString() +
        '-' +
        dt.year.toString() +
        ' ';
    date += dt.hour.toString() + ':';
    date += dt.minute.toString().length == 1
        ? ('0' + dt.minute.toString())
        : dt.minute.toString();
    // date += dt.hour < 12 ? '  AM' : '  PM';
    // date += ' GMT';
    return date;
  }

  bool hasImage() {
    if (thumbnail.endsWith('.jpg') ||
        thumbnail.endsWith('.jpeg') ||
        thumbnail.endsWith('.png')) return true;
    return false;
  }

  String link() => 'https://www.reddit.com' + permalink;
}
