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
        return Blockchain.mainNet;
      case 1:
        return Blockchain.testNet;
      default:
        return Blockchain.mainNet;
    }
  }

  @override
  void write(BinaryWriter writer, Blockchain obj) {
    switch (obj) {
      case Blockchain.mainNet:
        writer.writeByte(0);
        break;
      case Blockchain.testNet:
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
