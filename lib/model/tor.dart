// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive_ce.dart';

part 'tor.g.dart';
part 'tor.freezed.dart';

@freezed
abstract class Tor with _$Tor {
  @HiveType(typeId: 8, adapterName: 'TorClassAdapter')
  const factory Tor({
    @HiveField(0) required bool enforced,
    @HiveField(1) required bool internal,
    @HiveField(2) required int externalPort,
  }) = _Tor;
  const Tor._();
}
