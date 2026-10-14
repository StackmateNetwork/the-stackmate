import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/bitcoin_worker.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/interface/vibrate.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sats/pkg/wallet_db.dart';

part 'receive.freezed.dart';

@freezed
abstract class ReceiveState with _$ReceiveState {
  const factory ReceiveState({
    required Wallet wallet,
    @Default(true) bool loadingAddress,
    @Default('') String errLoadingAddress,
    @Default('') String address,
    @Default(0) int index,
  }) = _ReceiveState;
  const ReceiveState._();
}

class ReceiveCubit extends Cubit<ReceiveState> {
  ReceiveCubit(
    this.walletsCubit,
    this._logger,
    this._clipBoard,
    this._share,
    this._vibrate,
    this._core,
    this._nodeAddressCubit,
    this._torCubit,
    this._storage,
    Wallet wallet,
  ) : super(ReceiveState(wallet: wallet)) {
    _init();
  }

  final IStorage _storage;
  final WalletsCubit walletsCubit;
  final Logger _logger;
  final IShare _share;
  final IClipBoard _clipBoard;
  final IVibrate _vibrate;
  final IStackMateBitcoin _core;
  final NodeAddressCubit _nodeAddressCubit;
  final TorCubit _torCubit;

  static const emailShareSubject = 'Bitcoin Address';

  Future<void> _init() async {
    // Show the last known address straight away, then look for a better one.
    _showAddressAt(state.wallet.lastAddressIndex);
    await getLastUnusedAddress();
  }

  void _showAddressAt(int index) {
    try {
      final address = _core
          .getAddress(descriptor: state.wallet.descriptor, index: '$index')
          .orThrow();
      emit(
        state.copyWith(
          address: address,
          index: index,
          errLoadingAddress: '',
        ),
      );
    } catch (e, s) {
      emit(state.copyWith(errLoadingAddress: e.toString()));
      _logger.logException(e, 'ReceiveCubit.getAddress', s);
    }
  }

  void getNewAddress() {
    if (state.loadingAddress) return;
    _showAddressAt(state.index + 1);
  }

  void getLastAddress() {
    if (state.loadingAddress || state.index == 0) return;
    _showAddressAt(state.index - 1);
  }

  /// Syncs the wallet and shows the first address that has not received
  /// funds yet.
  Future<void> getLastUnusedAddress() async {
    emit(state.copyWith(loadingAddress: true, errLoadingAddress: ''));
    try {
      final wallet = state.wallet;
      final dbPath = await walletDbPath(wallet.label, wallet.uid);

      (await BitcoinWorker.sync(
        dbPath: dbPath,
        descriptor: wallet.descriptor,
        nodeAddress: _nodeAddressCubit.state.getAddress(),
        socks5: _torCubit.state.getSocks5(),
      )).orThrow();

      final unused = (await BitcoinWorker.lastUnusedAddress(
        descriptor: wallet.descriptor,
        dbPath: dbPath,
      )).orThrow();
      final index = int.parse(unused.index);

      final updated = wallet.copyWith(lastAddressIndex: index);
      await _storage.saveItemAt<Wallet>(
        StoreKeys.Wallet.name,
        updated.id!,
        updated,
      );
      walletsCubit.update(updated);

      emit(
        state.copyWith(
          wallet: updated,
          loadingAddress: false,
          address: unused.address,
          index: index,
        ),
      );
    } catch (e, s) {
      emit(
        state.copyWith(
          loadingAddress: false,
          errLoadingAddress: e.toString(),
        ),
      );
      _logger.logException(e, 'ReceiveCubit.getLastUnusedAddress', s);
    }
  }

  void copyAddress() {
    try {
      _clipBoard.copyToClipBoard(state.address);
      _vibrate.vibe();
    } catch (e, s) {
      _logger.logException(e, 'ReceiveCubit.copyAddress', s);
    }
  }

  void shareAddress() {
    try {
      _share.share(text: state.address, subjectForEmail: emailShareSubject);
    } catch (e, s) {
      _logger.logException(e, 'ReceiveCubit.shareAddress', s);
    }
  }
}
