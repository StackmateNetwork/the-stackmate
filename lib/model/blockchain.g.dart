// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blockchain.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlockchainClassAdapter extends TypeAdapter<Blockchain> {
  @override
  final int typeId = 4;

  @override
  Blockchain read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Blockchain.main;
      case 1:
        return Blockchain.test;
      default:
        return Blockchain.main;
    }
  }

  @override
  void write(BinaryWriter writer, Blockchain obj) {
    switch (obj) {
      case Blockchain.main:
        writer.writeByte(0);
        break;
      case Blockchain.test:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlockchainClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
