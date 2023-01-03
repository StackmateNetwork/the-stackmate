import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:libcpclient/outputs.dart';

part 'network-members.g.dart';
part 'network-members.freezed.dart';

@freezed
class NetworkMembers with _$NetworkMembers {
  @HiveType(typeId: 12, adapterName: 'NetworkMembersClassAdapter')
  const factory NetworkMembers({
    @HiveField(0) int? id,
    @HiveField(1) required List<MemberIdentity> members,
  }) = _NetworkMembers;
  const NetworkMembers._();

  factory NetworkMembers.fromJson(Map<String, dynamic> json) =>
      _$NetworkMembersFromJson(json);
}
