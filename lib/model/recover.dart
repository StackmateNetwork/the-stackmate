import 'package:freezed_annotation/freezed_annotation.dart';

part 'recover.g.dart';
part 'recover.freezed.dart';

@freezed
class RecoveredKey with _$RecoveredKey {
  const factory RecoveredKey({
    String? seed,
    String? root,
    String? fingerprint,
    String? network,
  }) = _RecoveredKey;

  factory RecoveredKey.fromJson(Map<String, dynamic> json) =>
      _$RecoveredKeyFromJson(json);
}
