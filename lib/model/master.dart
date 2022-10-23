import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'master.g.dart';
part 'master.freezed.dart';

@freezed
class MasterKey with _$MasterKey {
  @HiveType(typeId: 7, adapterName: 'MasterKeyClassAdapter')
  const factory MasterKey({
    @HiveField(0) String? seed,
    @HiveField(1) String? passphrase,
    @HiveField(2) String? root,
    @HiveField(3) String? fingerprint,
    @HiveField(4) String? network,
    @HiveField(5) bool? hasPassphrase,
  }) = _MasterKey;
  const MasterKey._();
}
