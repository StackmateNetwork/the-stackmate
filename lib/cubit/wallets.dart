import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/transaction.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'wallets.freezed.dart';

@freezed
class WalletsState with _$WalletsState {
  const factory WalletsState({
    @Default([]) List<Wallet> wallets,
    Wallet? selectedWallet,
    @Default(false) bool isRearranging,
    @Default('') String errDeleting,
  }) = _WalletsState;
}

class WalletsCubit extends Cubit<WalletsState> {
  WalletsCubit(
    this._storage,
    this._logger,
    this._blockchain,
    this._clipBoard,
  ) : super(const WalletsState()) {
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

      emit(state.copyWith(wallets: wallets));
    } catch (e, s) {
      _logger.logException(e, 'WalletsCubit.refresh', s);
    }
  }

  void walletSelected(Wallet wallet) async {
    emit(state.copyWith(selectedWallet: wallet));
  }

  void addTransactionsToSelectedWallet(List<Transaction> transactions) {
    final wallet = state.selectedWallet!.copyWith(
      transactions: transactions,
    );
    emit(state.copyWith(selectedWallet: wallet));
  }

  Future<void> addBalanceToSelectedWallet(int balance) async {
    if (state.selectedWallet == null) return;

    final wallet = state.selectedWallet!.copyWith(
      balance: balance,
    );

    emit(state.copyWith(selectedWallet: wallet));

    _storage.saveItemAt<Wallet>(StoreKeys.Wallet.name, wallet.id!, wallet);
    refresh();
  }

  void clearSelectedWallet() async {
    await Future.delayed(const Duration(milliseconds: 500));
    emit(state.copyWith(selectedWallet: null));
  }

  void toggleRearranging() {
    emit(state.copyWith(isRearranging: !state.isRearranging));
  }

  void rearrange(int oldIdx, int newIdx) async {
    var oldwallet = state.wallets.elementAt(oldIdx);
    var newwallet = state.wallets.elementAt(newIdx);

    final oldId = oldwallet.id;
    final newId = newwallet.id;

    oldwallet = oldwallet.copyWith(id: newId);
    newwallet = newwallet.copyWith(id: oldId);

    await _storage.saveItemAt<Wallet>(StoreKeys.Wallet.name, newId!, oldwallet);
    await _storage.saveItemAt<Wallet>(StoreKeys.Wallet.name, oldId!, newwallet);

    refresh();
    clearSelectedWallet();
  }

  void copyDescriptor(String text) async => await _clipBoard.copyToClipBoard(text);
}
