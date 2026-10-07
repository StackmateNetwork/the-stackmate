// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PreferencesClassAdapter extends TypeAdapter<_Preferences> {
  @override
  final typeId = 2;

  @override
  _Preferences read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _Preferences(
      incognito: fields[0] as bool,
      bitcoinStandard: fields[1] as bool,
      preferredBitcoinUnit: fields[2] as String,
      preferredExchange: fields[3] as String,
      preferredFiatUnit: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _Preferences obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.incognito)
      ..writeByte(1)
      ..write(obj.bitcoinStandard)
      ..writeByte(2)
      ..write(obj.preferredBitcoinUnit)
      ..writeByte(3)
      ..write(obj.preferredExchange)
      ..writeByte(4)
      ..write(obj.preferredFiatUnit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreferencesClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Preferences _$PreferencesFromJson(Map<String, dynamic> json) => _Preferences(
  incognito: json['incognito'] as bool,
  bitcoinStandard: json['bitcoinStandard'] as bool,
  preferredBitcoinUnit: json['preferredBitcoinUnit'] as String,
  preferredExchange: json['preferredExchange'] as String,
  preferredFiatUnit: json['preferredFiatUnit'] as String,
);

Map<String, dynamic> _$PreferencesToJson(_Preferences instance) =>
    <String, dynamic>{
      'incognito': instance.incognito,
      'bitcoinStandard': instance.bitcoinStandard,
      'preferredBitcoinUnit': instance.preferredBitcoinUnit,
      'preferredExchange': instance.preferredExchange,
      'preferredFiatUnit': instance.preferredFiatUnit,
    };
