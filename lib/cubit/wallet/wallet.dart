import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/transaction.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/core.dart';
import 'package:sats/pkg/launcher.dart';
import 'package:sats/pkg/share.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sats/pkg/vibrate.dart';

part 'wallet.freezed.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState({
    @Default(false) bool loadingTransactions,
    @Default('') String errLoadingTransactions,
    @Default(true) bool loadingBalance,
    @Default('') String errLoadingBalance,
    int? balance,
    List<Transaction>? transactions,
    @Default('') String errDeleting,
    @Default(false) bool deleted,
    @Default(false) bool showInfo,
  }) = _WalletState;
  const WalletState._();

  bool zeroBalance() => balance == null || balance == 0;
  bool zeroBalanceAmt() => balance != null && balance == 0;
}

class WalletCubit extends Cubit<WalletState> {
  WalletCubit(
    this._walletsCubit,
    // this._bitcoin,
    this._storage,
    this._logger,
    // this._blockchain,
    this._launcher,
    this._share,
    this._vibrate,
    this._nodeAddressCubit,
    this._blockchainCubit,
  ) : super(const WalletState()) {
    // scheduleMicrotask(() async {
    //   await Future.delayed(const Duration(milliseconds: 1000));
    //   getHistory();
    // });
    // getHistory();

    // getHistory();
    _init();
  }

  final WalletsCubit _walletsCubit;
  // final IBitcoin _bitcoin;
  final IStorage _storage;
  final LoggerCubit _logger;
  // final BlockchainCubit _blockchain;
  final IShare _share;
  final ILauncher _launcher;
  final IVibrate _vibrate;
  final ChainSelectCubit _blockchainCubit;
  final NodeAddressCubit _nodeAddressCubit;

  void _init() async {
    // await Future.delayed(const Duration(millis .econds: 1000));

    getHistory();
  }

  void getHistory() async {
    try {
      emit(
        state.copyWith(
          loadingBalance: true,
          errLoadingTransactions: '',
        ),
      );

      final node = _nodeAddressCubit.state.getAddress();
      final wallet = _walletsCubit.state.selectedWallet!;

      final bal = await compute(computeBalance, {
        'depositDesc': wallet.mainWallet.descriptor,
        'nodeAddress': node,
      });

      _vibrate.vibe();

      emit(
        state.copyWith(
          loadingBalance: false,
          loadingTransactions: true,
          balance: bal,
        ),
      );

      final transactions = await compute(computeHistory, {
        'depositDesc':
            _walletsCubit.state.selectedWallet!.mainWallet.descriptor,
        'nodeAddress': node,
        // 'network': _blockchain.state.blockchain.name,
      });

      _vibrate.vibe();

      emit(
        state.copyWith(
          loadingTransactions: false,
          transactions: transactions,
          errLoadingTransactions: '',
        ),
      );

      _walletsCubit.addBalanceToSelectedWallet(bal);
    } catch (e, s) {
      emit(
        state.copyWith(
          loadingBalance: false,
          loadingTransactions: false,
          errLoadingTransactions: e.toString(),
        ),
      );
      _logger.logException(e, 'HistoryCubit.getHistory', s);
    }
  }

  void openLink(Transaction transaction) {
    try {
      String url = '';
      if (_blockchainCubit.state.blockchain == Blockchain.testNet)
        url = 'https://blockstream.info/testnet/tx/';
      else
        url = 'https://blockstream.info/tx/';

      url += transaction.txid;

      _launcher.launchApp(url);
    } catch (e, s) {
      _logger.logException(e, 'HistoryCubit.openLink', s);
    }
  }

  void shareTransaction(Transaction transaction) {
    try {
      String text = '';

      text += 'Amount: ' + transaction.amountToBtc() + ' BTC';
      text += '\nTxId: ' + transaction.txid;
      // text += '\nAddress: ' + transaction.address;
      text += '\nFee: ' + transaction.feesToBtc() + ' BTC';

      _share.share(text: text, subjectForEmail: 'Transaction');
    } catch (e, s) {
      _logger.logException(e, 'HistoryCubit.shareTransaction', s);
    }
  }

  void deleteClicked() {
    emit(state.copyWith(errDeleting: ''));

    if (state.balance == null || state.balance! > 0) {
      emit(state.copyWith(errDeleting: 'Empty wallet first'));
      return;
    }

    _storage.deleteItemAt<Wallet>(
      StoreKeys.Wallet.name,
      _walletsCubit.state.selectedWallet!.id!,
    );

    _walletsCubit.refresh();

    emit(state.copyWith(deleted: true));
  }

  void toggleShowInfo() {
    emit(state.copyWith(showInfo: !state.showInfo));
  }
}

List<Transaction> computeHistory(dynamic obj) {
  final data = obj as Map<String, String?>;
  final resp = BitcoinFFI().getHistory(
    depositDesc: data['depositDesc']!,
    nodeAddress: data['nodeAddress']!,
  );
  return resp;
}

int computeBalance(dynamic obj) {
  final data = obj as Map<String, String?>;
  final resp = BitcoinFFI().syncBalance(
    depositDesc: data['depositDesc']!,
    nodeAddress: data['nodeAddress']!,
  );
  return resp;
}
