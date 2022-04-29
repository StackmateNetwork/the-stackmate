import 'dart:convert';
import 'dart:ffi';
import 'package:bitcoin/ffi-types.dart';
import 'package:ffi/ffi.dart';
// import 'package:isolate/ports.dart';

export 'package:bitcoin/types.dart';

class FFFI {
  FFFI({required this.binary});

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

  String syncBalance({
    required String descriptor,
    required String nodeAddress,
  }) {
    final func = binary.lookupFunction<SyncT, SyncT>('sync_balance');
    final response = func(
      descriptor.toNativeUtf8(),
      nodeAddress.toNativeUtf8(),
    );
    return response.toDartString();
  }

  String getHistory({
    required String descriptor,
    required String nodeAddress,
  }) {
    final func = binary.lookupFunction<SyncT, SyncT>('sync_history');
    final resp = func(
      descriptor.toNativeUtf8(),
      nodeAddress.toNativeUtf8(),
    ).toDartString();
    if (resp.startsWith('Error')) throw resp;
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
    if (resp.startsWith('Error')) throw resp;
    final obj = jsonDecode(resp);

    return obj['address'] as String;
  }

  String buildTransaction({
    required String descriptor,
    required String nodeAddress,
    required String txOutputs,
    required String feeAbsolute,
    required String sweep,
    required String policyPath,
  }) {
    final func = binary.lookupFunction<BuildT, BuildT>('build_tx');
    final resp = func(
      descriptor.toNativeUtf8(),
      nodeAddress.toNativeUtf8(),
      txOutputs.toNativeUtf8(),
      feeAbsolute.toNativeUtf8(),
      policyPath.toNativeUtf8(),
      sweep.toNativeUtf8(),
    ).toDartString();
    if (resp.startsWith('Error')) throw resp;
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
    if (resp.startsWith('Error')) throw resp;
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
    if (resp.startsWith('Error')) throw resp;
    return resp;
  }

  String broadcastTransaction({
    required String descriptor,
    required String nodeAddress,
    required String signedPSBT,
  }) {
    final func = binary.lookupFunction<BroadcastT, BroadcastT>(
      'broadcast_tx',
    );
    final resp = func(
      descriptor.toNativeUtf8(),
      nodeAddress.toNativeUtf8(),
      signedPSBT.toNativeUtf8(),
    ).toDartString();
    if (resp.startsWith('Error')) throw resp;
    return resp;
  }

  String estimateNetworkFee({
    required String network,
    required String nodeAddress,
    required String targetSize,
  }) {
    final func = binary
        .lookupFunction<EstimateFeeT, EstimateFeeT>('estimate_network_fee');
    final resp = func(
      network.toNativeUtf8(),
      nodeAddress.toNativeUtf8(),
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
  }) {
    final func =
        binary.lookupFunction<FeeAbsoluteT, FeeAbsoluteT>('get_height');
    final resp = func(
      network.toNativeUtf8(),
      nodeAddress.toNativeUtf8(),
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
}
