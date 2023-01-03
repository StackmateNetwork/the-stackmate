import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'network-identity.g.dart';
part 'network-identity.freezed.dart';

@freezed
class NetworkIdentity with _$NetworkIdentity {
  @HiveType(typeId: 11, adapterName: 'NetworkIdentityClassAdapter')
  const factory NetworkIdentity({
    @HiveField(0) int? id,
    @HiveField(1) required String hostname,
    @HiveField(2) required String name,
    @HiveField(3) required String serverPubkey,
    @HiveField(4) required String kind,
    @HiveField(5) required String username,
    @HiveField(6) required String inviteCode,
    @HiveField(7) required int inviteCount,
    @HiveField(8) String? lastInviteSecret,
  }) = _NetworkIdentity;
  const NetworkIdentity._();

  factory NetworkIdentity.fromJson(Map<String, dynamic> json) =>
      _$NetworkIdentityFromJson(json);
}
