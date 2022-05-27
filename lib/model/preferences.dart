import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'preferences.g.dart';
part 'preferences.freezed.dart';

@freezed
class Preferences with _$Preferences {
  @HiveType(typeId: 2, adapterName: 'PreferencesClassAdapter')
  const factory Preferences({
    @HiveField(0) required bool incognito,
    @HiveField(1) required bool bitcoinStandard,
    @HiveField(2) required String preferredBitcoinUnit,
    @HiveField(3) required String preferredExchange,
    @HiveField(4) required String preferredFiatUnit,
  }) = _Preferences;
  const Preferences._();

  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);
}
