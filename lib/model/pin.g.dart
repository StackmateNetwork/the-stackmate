// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PinClassAdapter extends TypeAdapter<_$PinImpl> {
  @override
  final int typeId = 9;

  @override
  _$PinImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PinImpl(
      value: fields[0] as String,
      attemptsLeft: fields[1] as int,
      lastFailure: fields[2] as int,
      isLocked: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$PinImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.value)
      ..writeByte(1)
      ..write(obj.attemptsLeft)
      ..writeByte(2)
      ..write(obj.lastFailure)
      ..writeByte(3)
      ..write(obj.isLocked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PinClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
