import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:libstackmate/inputs.dart';

// import 'package:isolate/ports.dart';

export 'package:libstackmate/outputs.dart';

class LibStackmateFFI {
  LibStackmateFFI({required this.binary});

  final DynamicLibrary binary;

  String generateMaster({
    required String network,
    required String length,
    required String passphrase,
  }) {
    final func = binary.lookupFunction<GenerateT, GenerateT>('generate_master');
    final resp = func(
      network.toNativeUtf8(),
      length.toNativeUtf8(),
      passphrase.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String importMaster({
    required String network,
    required String mnemonic,
    required String passphrase,
  }) {
    final func = binary.lookupFunction<ImportT, ImportT>('import_master');
    final resp = func(
      network.toNativeUtf8(),
      mnemonic.toNativeUtf8(),
      passphrase.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String deriveHardened({
    required String masterXPriv,
    required String account,
    required String purpose,
  }) {
    final func =
        binary.lookupFunction<DeriveT, DeriveT>('derive_wallet_account');
    final resp = func(
      masterXPriv.toNativeUtf8(),
      purpose.toNativeUtf8(),
      account.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String compile({
    required String policy,
    required String scriptType,
  }) {
    final func = binary.lookupFunction<CompileT, CompileT>('compile');
    final resp = func(
      policy.toNativeUtf8(),
      scriptType.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String policyId({
    required String descriptor,
  }) {
    final func = binary.lookupFunction<PolicyIdT, PolicyIdT>('policy_id');
    final resp = func(
      descriptor.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String sqliteSync({
    required String dbPath,
    required String descriptor,
    required String nodeAddress,
    required String socks5,
  }) {
    final func = binary.lookupFunction<SyncSQLiteT, SyncSQLiteT>('sqlite_sync');
    final response = func(
      dbPath.toNativeUtf8(),
      descriptor.toNativeUtf8(),
      nodeAddress.toNativeUtf8(),
      socks5.toNativeUtf8(),
    );
    return response.toDartString();
  }

  String sqliteBalance({
    required String descriptor,
    required String dbPath,
  }) {
    try {
      final func =
          binary.lookupFunction<WalletSQLiteT, WalletSQLiteT>('sqlite_balance');
      final response = func(
        descriptor.toNativeUtf8(),
        dbPath.toNativeUtf8(),
      );
      return response.toDartString();
    } catch (e) {
      return 'Error';
    }
  }

  String syncBalance({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
  }) {
    final func = binary.lookupFunction<SyncT, SyncT>('sync_balance');
    final response = func(
      descriptor.toNativeUtf8(),
      nodeAddress.toNativeUtf8(),
      socks5.toNativeUtf8(),
    );
    return response.toDartString();
  }

  String sqliteHistory({
    required String descriptor,
    required String dbPath,
  }) {
    final func =
        binary.lookupFunction<WalletSQLiteT, WalletSQLiteT>('sqlite_history');
    final response = func(
      descriptor.toNativeUtf8(),
      dbPath.toNativeUtf8(),
    );
    return response.toDartString();
  }

  String getHistory({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
  }) {
    final func = binary.lookupFunction<SyncT, SyncT>('sync_history');
    final resp = func(
      descriptor.toNativeUtf8(),
      nodeAddress.toNativeUtf8(),
      socks5.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String listUnspent({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
  }) {
    final func = binary.lookupFunction<SyncT, SyncT>('list_unspent');
    final resp = func(
      descriptor.toNativeUtf8(),
      nodeAddress.toNativeUtf8(),
      socks5.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String getAddress({
    required String descriptor,
    required String index,
  }) {
    final func = binary.lookupFunction<AddressT, AddressT>('get_address');
    final resp = func(
      descriptor.toNativeUtf8(),
      index.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String getLastUnusedAddress({
    required String descriptor,
    required String dbPath,
  }) {
    final func =
        binary.lookupFunction<AddressT, AddressT>('sqlite_last_unused_address');
    final resp = func(
      descriptor.toNativeUtf8(),
      dbPath.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String sqliteBuildTransaction({
    required String descriptor,
    required String dbPath,
    required String txOutputs,
    required String feeAbsolute,
    required String sweep,
    required String policyPath,
  }) {
    final func =
        binary.lookupFunction<BuildSQLiteT, BuildSQLiteT>('sqlite_build_tx');
    final resp = func(
      descriptor.toNativeUtf8(),
      dbPath.toNativeUtf8(),
      txOutputs.toNativeUtf8(),
      feeAbsolute.toNativeUtf8(),
      policyPath.toNativeUtf8(),
      sweep.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String buildTransaction({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
    required String txOutputs,
    required String feeAbsolute,
    required String sweep,
    required String policyPath,
  }) {
    final func = binary.lookupFunction<BuildT, BuildT>('build_tx');
    final resp = func(
      descriptor.toNativeUtf8(),
      nodeAddress.toNativeUtf8(),
      socks5.toNativeUtf8(),
      txOutputs.toNativeUtf8(),
      feeAbsolute.toNativeUtf8(),
      policyPath.toNativeUtf8(),
      sweep.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String decodePsbt({
    required String network,
    required String psbt,
  }) {
    final func = binary.lookupFunction<DecodeT, DecodeT>('decode_psbt');
    final resp = func(
      network.toNativeUtf8(),
      psbt.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String signTransaction({
    required String descriptor,
    required String unsignedPSBT,
  }) {
    final func = binary.lookupFunction<SignT, SignT>('sign_tx');
    final resp = func(
      descriptor.toNativeUtf8(),
      unsignedPSBT.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  Future<String> broadcastTransaction({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
    required String signedPSBT,
  }) async {
    final func = binary.lookupFunction<BroadcastT, BroadcastT>(
      'broadcast_tx',
    );
    final resp = func(
      descriptor.toNativeUtf8(),
      nodeAddress.toNativeUtf8(),
      socks5.toNativeUtf8(),
      signedPSBT.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  Future<String> broadcastTransactionHex({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
    required String signedHex,
  }) async {
    final func = binary.lookupFunction<BroadcastTHex, BroadcastTHex>(
      'broadcast_hex',
    );
    final resp = func(
      descriptor.toNativeUtf8(),
      nodeAddress.toNativeUtf8(),
      socks5.toNativeUtf8(),
      signedHex.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String estimateNetworkFee({
    required String network,
    required String nodeAddress,
    required String socks5,
    required String targetSize,
  }) {
    final func = binary
        .lookupFunction<EstimateFeeT, EstimateFeeT>('estimate_network_fee');
    final resp = func(
      network.toNativeUtf8(),
      nodeAddress.toNativeUtf8(),
      socks5.toNativeUtf8(),
      targetSize.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String getWeight({
    required String descriptor,
    required String psbt,
  }) {
    final func = binary.lookupFunction<WeightT, WeightT>('get_weight');
    final resp = func(
      descriptor.toNativeUtf8(),
      psbt.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String feeAbsoluteToRate({
    required String feeAbs,
    required String weight,
  }) {
    final func = binary
        .lookupFunction<AbsoluteFeeT, AbsoluteFeeT>('fee_absolute_to_rate');
    final resp = func(
      feeAbs.toNativeUtf8(),
      weight.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String feeRateToAbsolute({
    required String feeRate,
    required String weight,
  }) {
    final func = binary
        .lookupFunction<FeeAbsoluteT, FeeAbsoluteT>('fee_rate_to_absolute');
    final resp = func(
      feeRate.toNativeUtf8(),
      weight.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String getHeight({
    required String network,
    required String nodeAddress,
    required String socks5,
  }) {
    final func = binary.lookupFunction<HeightT, HeightT>('get_height');
    final resp = func(
      network.toNativeUtf8(),
      nodeAddress.toNativeUtf8(),
      socks5.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String daysToBlocks({
    required String days,
  }) {
    final func = binary.lookupFunction<DaysT, DaysT>('days_to_blocks');
    final resp = func(
      days.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String torStart({
    required String path,
    required String socsk5Port,
    required String httpProxy,
  }) {
    final func = binary.lookupFunction<TorStartT, TorStartT>('tor_start');
    final resp = func(
      path.toNativeUtf8(),
      socsk5Port.toNativeUtf8(),
      httpProxy.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String torStatus({
    required String controlPort,
    required String controlKey,
  }) {
    final func = binary.lookupFunction<TorStatusT, TorStatusT>('tor_progress');
    final resp = func(
      controlPort.toNativeUtf8(),
      controlKey.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String torStop({
    required String controlPort,
    required String controlKey,
  }) {
    final func = binary.lookupFunction<TorStopT, TorStopT>('tor_stop');
    final resp = func(
      controlPort.toNativeUtf8(),
      controlKey.toNativeUtf8(),
    ).toDartString();
    return resp;
  }
}
