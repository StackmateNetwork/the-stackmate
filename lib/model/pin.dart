// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:hive_ce/hive_ce.dart';

part 'pin.g.dart';
part 'pin.freezed.dart';

@freezed
abstract class Pin with _$Pin {
  @HiveType(typeId: 9, adapterName: 'PinClassAdapter')
  const factory Pin({
    @HiveField(0) required String value,
    @HiveField(1) required int attemptsLeft,
    @HiveField(2) required int lastFailure,
    @HiveField(3) required bool isLocked,
  }) = _Pin;
  const Pin._();
}
