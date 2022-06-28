// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tor.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TorClassAdapter extends TypeAdapter<_$_Tor> {
  @override
  final int typeId = 8;

  @override
  _$_Tor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Tor(
      enforced: fields[0] as bool,
      internal: fields[1] as bool,
      externalPort: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Tor obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.enforced)
      ..writeByte(1)
      ..write(obj.internal)
      ..writeByte(2)
      ..write(obj.externalPort);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TorClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
