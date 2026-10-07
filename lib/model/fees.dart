// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive_ce.dart';

part 'fees.g.dart';
part 'fees.freezed.dart';

@freezed
abstract class Fees with _$Fees {
  @HiveType(typeId: 5, adapterName: 'FeesClassAdapter')
  const factory Fees({
    @HiveField(0) required int timestamp,
    @HiveField(1) required double slow,
    @HiveField(2) required double medium,
    @HiveField(3) required double fast,
  }) = _Fees;
  const Fees._();

  factory Fees.fromJson(Map<String, dynamic> json) => _$FeesFromJson(json);
}
