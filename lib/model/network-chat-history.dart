import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'network-chat-history.g.dart';
part 'network-chat-history.freezed.dart';

@freezed
class NetworkChatHistory with _$NetworkChatHistory {
  @HiveType(typeId: 13, adapterName: 'NetworkChatHistoryClassAdapter')
  const factory NetworkChatHistory({
    @HiveField(0) int? id,
    @HiveField(1) required List<Map<String, dynamic>> verifiedPosts,
    @HiveField(2) required int latestGenesis,
    @HiveField(3) required List<String> corruptedPostIds,
  }) = _NetworkChatHistory;
  const NetworkChatHistory._();
}
