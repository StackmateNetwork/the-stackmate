import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'network-posts-index.g.dart';
part 'network-posts-index.freezed.dart';

@freezed
class NetworkPostsIndex with _$NetworkPostsIndex {
  @HiveType(typeId: 14, adapterName: 'NetworkPostsIndexClassAdapter')
  const factory NetworkPostsIndex({
    @HiveField(0) int? id,
    @HiveField(1) required int lastIndex,
  }) = _NetworkPostsIndex;
  const NetworkPostsIndex._();

  factory NetworkPostsIndex.fromJson(Map<String, dynamic> json) =>
      _$NetworkPostsIndexFromJson(json);
}
