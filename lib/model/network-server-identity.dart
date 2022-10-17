import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'network-server-identity.g.dart';
part 'network-server-identity.freezed.dart';

@freezed
class NetworkServerIdentity with _$NetworkServerIdentity {
  @HiveType(typeId: 10, adapterName: 'NetworkServerIdentityClassAdapter')
  const factory NetworkServerIdentity({
    @HiveField(0) required String hostName,
    @HiveField(1) required String name,
    @HiveField(2) required String pubkey,
    @HiveField(3) required String kind,
    @HiveField(4) required int memberCount,
  }) = _NetworkServerIdentity;
  const NetworkServerIdentity._();

  factory NetworkServerIdentity.fromJson(Map<String, dynamic> json) =>
      _$NetworkServerIdentityFromJson(json);
}
