import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/bitcoin_worker.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallet/info.dart';
import 'package:sats/cubit/wallet/signer.dart';
import 'package:sats/model/transaction.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/wallet_db.dart';

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
      final dbPath = await walletDbPath(wallet.label, wallet.uid);
      final nodeAddress = _nodeAddressCubit.state.getAddress();
      final socks5 = _torCubit.state.getSocks5();

      // Refresh first so we bump against the latest mempool/chain state.
      (await BitcoinWorker.sync(
        descriptor: wallet.descriptor,
        dbPath: dbPath,
        nodeAddress: nodeAddress,
        socks5: socks5,
      )).orThrow();

      final unsigned = (await BitcoinWorker.bumpFee(
        descriptor: wallet.descriptor,
        dbPath: dbPath,
        txid: _transaction.txid,
        feeRate: rate.toString(),
      )).orThrow();

      final descriptor = await _signer.signingDescriptor(wallet);
      final signed = (await BitcoinWorker.sign(
        descriptor: descriptor,
        unsignedPSBT: unsigned.psbt,
      )).orThrow();
      if (!signed.isFinalized) throw notSignedError;

      final txid = (await BitcoinWorker.broadcast(
        descriptor: descriptor,
        nodeAddress: nodeAddress,
        socks5: socks5,
        signedPSBT: signed.psbt,
      )).orThrow();

      emit(state.copyWith(bumping: false, newTxid: txid));
      _infoCubit.sqliteSyncHistory();
    } catch (e, s) {
      emit(state.copyWith(bumping: false, error: e.toString()));
      _logger.logException(e, 'BumpFeeCubit.bump', s);
    }
  }
}
