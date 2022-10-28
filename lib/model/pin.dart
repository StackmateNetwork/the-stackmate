import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:hive/hive.dart';

part 'pin.g.dart';
part 'pin.freezed.dart';

@freezed
class Pin with _$Pin {
  @HiveType(typeId: 9, adapterName: 'PinClassAdapter')
  const factory Pin({
    @HiveField(0) required String value,
    @HiveField(1) required int attemptsLeft,
    @HiveField(2) required int lastFailure,
    @HiveField(3) required bool isLocked,
    // @HiveField(3) required bool enabled,
  }) = _Pin;
  const Pin._();
}
