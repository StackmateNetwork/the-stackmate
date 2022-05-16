// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WalletClassAdapter extends TypeAdapter<_$_Wallet> {
  @override
  final int typeId = 1;

  @override
  _$_Wallet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Wallet(
      label: fields[0] as String,
      descriptor: fields[1] as String,
      policy: fields[2] as String,
      requiredPolicyElements: fields[3] as int,
      policyElements: (fields[4] as List).cast<String>(),
      blockchain: fields[5] as String,
      transactions: (fields[6] as List?)?.cast<Transaction>(),
      id: fields[7] as int?,
      balance: fields[8] as int,
      lastAddressIndex: fields[9] as int,
      walletType: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Wallet obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.descriptor)
      ..writeByte(2)
      ..write(obj.policy)
      ..writeByte(3)
      ..write(obj.requiredPolicyElements)
      ..writeByte(4)
      ..write(obj.policyElements)
      ..writeByte(5)
      ..write(obj.blockchain)
      ..writeByte(6)
      ..write(obj.transactions)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.balance)
      ..writeByte(9)
      ..write(obj.lastAddressIndex)
      ..writeByte(10)
      ..write(obj.walletType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WalletClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Wallet _$$_WalletFromJson(Map<String, dynamic> json) => _$_Wallet(
      label: json['label'] as String,
      descriptor: json['descriptor'] as String,
      policy: json['policy'] as String,
      requiredPolicyElements: json['requiredPolicyElements'] as int,
      policyElements: (json['policyElements'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      blockchain: json['blockchain'] as String,
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
      balance: json['balance'] as int,
      lastAddressIndex: json['lastAddressIndex'] as int,
      walletType: json['walletType'] as String,
    );

Map<String, dynamic> _$$_WalletToJson(_$_Wallet instance) => <String, dynamic>{
      'label': instance.label,
      'descriptor': instance.descriptor,
      'policy': instance.policy,
      'requiredPolicyElements': instance.requiredPolicyElements,
      'policyElements': instance.policyElements,
      'blockchain': instance.blockchain,
      'transactions': instance.transactions,
      'id': instance.id,
      'balance': instance.balance,
      'lastAddressIndex': instance.lastAddressIndex,
      'walletType': instance.walletType,
    };
