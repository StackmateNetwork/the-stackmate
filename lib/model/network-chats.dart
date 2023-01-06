import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'network-chats.g.dart';
part 'network-chats.freezed.dart';

@freezed
class NetworkChats with _$NetworkChats {
  @HiveType(typeId: 15, adapterName: 'NetworkChatsClassAdapter')
  const factory NetworkChats({
    @HiveField(0) required int id,
    @HiveField(1) required String pubkey,
    @HiveField(2) required String username,
    @HiveField(3) required List<Map<String, dynamic>> posts,
  }) = _NetworkChats;
  const NetworkChats._();
}
