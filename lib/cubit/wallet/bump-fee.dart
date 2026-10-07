import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart';
import 'package:sats/api/libbitcoin.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/cubit/wallet/signer.dart';
import 'package:sats/model/core.dart';
import 'package:sats/model/result.dart';
import 'package:sats/model/transaction.dart';
import 'package:sats/model/wallet.dart';
import 'package:sqflite/sqflite.dart' hide Transaction;

part 'bump-fee.freezed.dart';

@freezed
abstract class BumpFeeState with _$BumpFeeState {
  const factory BumpFeeState({
    @Default('') String feeRate,
    @Default(false) bool bumping,
    @Default('') String error,
    @Default('') String newTxid,
  }) = _BumpFeeState;
  const BumpFeeState._();

  bool get done => newTxid.isNotEmpty;
}

/// Replaces an unconfirmed outgoing transaction with a higher-fee version
/// (BIP125 replace-by-fee), signs it and broadcasts it.
class BumpFeeCubit extends Cubit<BumpFeeState> {
  BumpFeeCubit(
    this._transaction,
    this._infoCubit,
    this._signer,
    this._nodeAddressCubit,
    this._torCubit,
    this._logger, {
    double suggestedFeeRate = 0,
  }) : super(
          BumpFeeState(
            feeRate: suggestedFeeRate > 0
                ? suggestedFeeRate.ceil().toString()
                : emptyString,
          ),
        );

  final Transaction _transaction;
  final InfoCubit _infoCubit;
  final WalletSigner _signer;
  final NodeAddressCubit _nodeAddressCubit;
  final TorCubit _torCubit;
  final Logger _logger;

  static const emptyString = '';
  static const invalidFeeRateError = 'Enter a fee rate in sats/vbyte.';
  static const notSignedError = 'Transaction signatures not satisfied.';

  void feeRateChanged(String text) =>
      emit(state.copyWith(feeRate: text, error: emptyString));

  Future<void> bump() async {
    if (state.bumping || state.done) return;
    final rate = double.tryParse(state.feeRate);
    if (rate == null || rate <= 0) {
      emit(state.copyWith(error: invalidFeeRateError));
      return;
    }

    emit(state.copyWith(bumping: true, error: emptyString));
    try {
      final Wallet wallet = _infoCubit.state.wallet!;
      final dbName = wallet.label + wallet.uid + '.db';
      final dbPath = join(await getDatabasesPath(), dbName);
      final nodeAddress = _nodeAddressCubit.state.getAddress();
      final socks5 = _torCubit.state.getSocks5();

      // Refresh first so we bump against the latest mempool/chain state.
      final synced = await compute(_sync, {
        'descriptor': wallet.descriptor,
        'dbPath': dbPath,
        'nodeAddress': nodeAddress,
        'socks5': socks5,
      });
      if (synced.hasError) throw SMError.fromJson(synced.error!).message;

      final psbt = await compute(_bumpFee, {
        'descriptor': wallet.descriptor,
        'dbPath': dbPath,
        'txid': _transaction.txid,
        'feeRate': rate.toString(),
      });
      if (psbt.hasError) throw SMError.fromJson(psbt.error!).message;

      final descriptor = await _signer.signingDescriptor(wallet);
      final signed = await compute(_sign, {
        'descriptor': descriptor,
        'unsignedPSBT': psbt.result!.psbt,
      });
      if (signed.hasError) throw SMError.fromJson(signed.error!).message;
      if (!signed.result!.isFinalized) throw notSignedError;

      final txid = await compute(_broadcast, {
        'descriptor': descriptor,
        'nodeAddress': nodeAddress,
        'socks5': socks5,
        'signedPSBT': signed.result!.psbt,
      });
      if (txid.hasError) throw SMError.fromJson(txid.error!).message;

      emit(state.copyWith(bumping: false, newTxid: txid.result!));
      _infoCubit.sqliteSyncHistory();
    } catch (e, s) {
      emit(state.copyWith(bumping: false, error: e.toString()));
      _logger.logException(e, 'BumpFeeCubit.bump', s);
    }
  }
}

R<String> _sync(Map<String, String> data) => LibBitcoin().sqliteSync(
      dbPath: data['dbPath']!,
      descriptor: data['descriptor']!,
      nodeAddress: data['nodeAddress']!,
      socks5: data['socks5']!,
    );

R<PSBT> _bumpFee(Map<String, String> data) => LibBitcoin().sqliteBumpFee(
      descriptor: data['descriptor']!,
      dbPath: data['dbPath']!,
      txid: data['txid']!,
      feeRate: data['feeRate']!,
    );

R<PSBT> _sign(Map<String, String> data) => LibBitcoin().signTransaction(
      descriptor: data['descriptor']!,
      unsignedPSBT: data['unsignedPSBT']!,
    );

Future<R<String>> _broadcast(Map<String, String> data) =>
    LibBitcoin().broadcastTransaction(
      descriptor: data['descriptor']!,
      nodeAddress: data['nodeAddress']!,
      socks5: data['socks5']!,
      signedPSBT: data['signedPSBT']!,
    );
