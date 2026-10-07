// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tor.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TorClassAdapter extends TypeAdapter<_Tor> {
  @override
  final typeId = 8;

  @override
  _Tor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _Tor(
      enforced: fields[0] as bool,
      internal: fields[1] as bool,
      externalPort: (fields[2] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, _Tor obj) {
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
