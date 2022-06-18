import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'tor.g.dart';
part 'tor.freezed.dart';

@freezed
class Tor with _$Tor {
  @HiveType(typeId: 8, adapterName: 'TorClassAdapter')
  const factory Tor({
    @HiveField(0) required bool enforced,
    @HiveField(1) required bool internal,
    @HiveField(2) required int externalPort,
  }) = _Tor;
  const Tor._();
}
