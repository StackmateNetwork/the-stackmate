import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'network-members.g.dart';
part 'network-members.freezed.dart';

@freezed
class NetworkMembers with _$NetworkMembers {
  @HiveType(typeId: 11, adapterName: 'NetworkMembersClassAdapter')
  const factory NetworkMembers({
    @HiveField(0) required int genesis,
    @HiveField(1) required String pubkey,
    @HiveField(2) required String username,
  }) = _NetworkMembers;
  const NetworkMembers._();

  factory NetworkMembers.fromJson(Map<String, dynamic> json) =>
      _$NetworkMembersFromJson(json);
}
