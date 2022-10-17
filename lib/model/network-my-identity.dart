import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'network-my-identity.g.dart';
part 'network-my-identity.freezed.dart';

@freezed
class NetworkMyIdentity with _$NetworkMyIdentity {
  @HiveType(typeId: 11, adapterName: 'NetworkMyIdentityClassAdapter')
  const factory NetworkMyIdentity({
    @HiveField(0) required String hostname,
    @HiveField(1) required String username,
    @HiveField(2) required String pubkey,
  }) = _NetworkMyIdentity;
  const NetworkMyIdentity._();

  factory NetworkMyIdentity.fromJson(Map<String, dynamic> json) =>
      _$NetworkMyIdentityFromJson(json);
}
