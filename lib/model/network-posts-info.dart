import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'network-posts-info.g.dart';
part 'network-posts-info.freezed.dart';

@freezed
class NetworkPostsInfo with _$NetworkPostsInfo {
  @HiveType(typeId: 13, adapterName: 'NetworkPostsInfoClassAdapter')
  const factory NetworkPostsInfo({
    @HiveField(0) required int lastGenesis,
    @HiveField(1) required List<String> corruptedPostIds,
  }) = _NetworkPostsInfo;
  const NetworkPostsInfo._();

  factory NetworkPostsInfo.fromJson(Map<String, dynamic> json) =>
      _$NetworkPostsInfoFromJson(json);
}
