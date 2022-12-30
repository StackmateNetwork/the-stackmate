import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'network-members.g.dart';
part 'network-members.freezed.dart';

@freezed
class NetworkMembers with _$NetworkMembers {
  @HiveType(typeId: 12, adapterName: 'NetworkMembersClassAdapter')
  const factory NetworkMembers({
    @HiveField(0) required int hostname,
    @HiveField(1) required int genesis,
    @HiveField(2) required String pubkey,
    @HiveField(3) required String username,
  }) = _NetworkMembers;
  const NetworkMembers._();

  factory NetworkMembers.fromJson(Map<String, dynamic> json) =>
      _$NetworkMembersFromJson(json);
}
