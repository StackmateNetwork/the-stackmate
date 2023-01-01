import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'social-root.g.dart';
part 'social-root.freezed.dart';

@freezed
class SocialRoot with _$SocialRoot {
  @HiveType(typeId: 10, adapterName: 'SocialRootClassAdapter')
  const factory SocialRoot({
    @HiveField(0) required String mnemonic,
    @HiveField(1) required String xprv,
    @HiveField(2) required String pubkey,
  }) = _SocialRoot;
  const SocialRoot._();
}
