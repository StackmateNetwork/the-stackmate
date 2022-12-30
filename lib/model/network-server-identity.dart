import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'network-server-identity.g.dart';
part 'network-server-identity.freezed.dart';

@freezed
class NetworkServerIdentity with _$NetworkServerIdentity {
  @HiveType(typeId: 11, adapterName: 'NetworkServerIdentityClassAdapter')
  const factory NetworkServerIdentity({
    @HiveField(0) required String hostname,
    @HiveField(1) required String name,
    @HiveField(2) required String pubkey,
    @HiveField(3) required String kind,
  }) = _NetworkServerIdentity;
  const NetworkServerIdentity._();

  factory NetworkServerIdentity.fromJson(Map<String, dynamic> json) =>
      _$NetworkServerIdentityFromJson(json);
}
