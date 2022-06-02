// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MasterKeyClassAdapter extends TypeAdapter<_$_MasterKey> {
  @override
  final int typeId = 7;

  @override
  _$_MasterKey read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_MasterKey(
      root: fields[0] as String?,
      fingerprint: fields[1] as String?,
      network: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_MasterKey obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.root)
      ..writeByte(1)
      ..write(obj.fingerprint)
      ..writeByte(2)
      ..write(obj.network);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MasterKeyClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
