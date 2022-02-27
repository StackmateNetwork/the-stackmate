import 'package:hive/hive.dart';

part 'blockchain.g.dart';

@HiveType(typeId: 4, adapterName: 'BlockchainClassAdaper')
enum Blockchain {
  @HiveField(0)
  mainNet,

  @HiveField(1)
  testNet,
}

extension Blo on Blockchain {
  String get name => const {
        Blockchain.mainNet: 'main',
        Blockchain.testNet: 'test',
      }[this]!;

  String get displayName => const {
        Blockchain.mainNet: 'mainnet',
        Blockchain.testNet: 'testnet',
      }[this]!;
}
