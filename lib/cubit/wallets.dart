import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'wallets.freezed.dart';

@freezed
abstract class WalletsState with _$WalletsState {
  const factory WalletsState({
    @Default([]) List<Wallet> wallets,
    @Default(true) bool toggler,
    @Default('') String errDeleting,
    @Default(0) int networth,
  }) = _WalletsState;
}

class WalletsCubit extends Cubit<WalletsState> {
  WalletsCubit(this._storage, this._logger, this._blockchain, this._clipBoard)
    : super(const WalletsState()) {
    refresh();
  }

  final IStorage _storage;
  final Logger _logger;
  final ChainSelectCubit _blockchain;
  final IClipBoard _clipBoard;

  void refresh() {
    try {
      final storedWallets = _storage.getAll<Wallet>(StoreKeys.Wallet.name);
      if (storedWallets.hasError) return;

      final wallets = storedWallets.result!;

      wallets.removeWhere(
        (w) => w.blockchain != _blockchain.state.blockchain.name,
      );

      wallets.sort((a, b) => a.id!.compareTo(b.id!));

      emit(
        state.copyWith(
          wallets: wallets,
          networth: _networth(wallets),
          toggler: !state.toggler,
        ),
      );
    } catch (e, s) {
      _logger.logException(e, 'WalletsCubit.refresh', s);
    }
  }

  void update(Wallet wallet) {
    final index = state.wallets.indexWhere((w) => w.uid == wallet.uid);
    if (index == -1) return;
    final updatedList = List<Wallet>.from(state.wallets);
    updatedList[index] = wallet;
    emit(
      state.copyWith(wallets: updatedList, networth: _networth(updatedList)),
    );
  }

  /// Total balance, counting wallets that share a key only once.
  // THIS WILL ONLY WORK FOR SINGLE SIGS
  // SCRIPTS NEED TO CHECK PUBLIC DESCRIPTOR
  static int _networth(List<Wallet> wallets) {
    var net = 0;
    final seenKeys = <String>{};
    for (final wallet in wallets) {
      final key = wallet.policyElements.firstOrNull;
      if (key == null || seenKeys.add(key)) net += wallet.balance;
    }
    return net;
  }

  Future<void> copyDescriptor(String text) async =>
      await _clipBoard.copyToClipBoard(text);
}
