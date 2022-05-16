import 'package:bitcoin/types.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/stackmate-core.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/transaction.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/interface/launcher.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/interface/vibrate.dart';
import 'package:sats/pkg/storage.dart';

part 'info.freezed.dart';

@freezed
class InfoState with _$InfoState {
  const factory InfoState({
    @Default(false) bool loadingTransactions,
    @Default('') String errLoadingTransactions,
    @Default(true) bool loadingBalance,
    @Default('') String errLoadingBalance,
    @Default(0) int balance,
    @Default([]) List<Transaction> transactions,
    @Default('') String errDeleting,
    @Default(false) bool deleted,
    @Default(false) bool showInfo,
  }) = _InfoState;
  const InfoState._();

  bool zeroBalance() => balance == null || balance == 0;
  bool zeroBalanceAmt() => balance != null && balance == 0;
}

class InfoCubit extends Cubit<InfoState> {
  InfoCubit(
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
  ) : super(const InfoState()) {
    // scheduleMicrotask(() async {
    //   await Future.delayed(const Duration(milliseconds: 1000));
    //   getHistory();
    // });
    // getHistory();

    // getHistory();
    _init();
  }

  final WalletsCubit _walletsCubit;
  final IStorage _storage;
  final Logger _logger;
  final IShare _share;
  final ILauncher _launcher;
  final IVibrate _vibrate;
  final ChainSelectCubit _blockchainCubit;
  final NodeAddressCubit _nodeAddressCubit;

  static const blockstreamTestnetURL = 'https://blockstream.info/testnet/tx/';
  static const blockstreamMainnetURL = 'https://blockstream.info/tx/';
  static const emailShareSubject = 'Transaction Details';
  static const walletHasFunds = 'Wallet has funds';

  void _init() async {
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

      emit(
        state.copyWith(
          loadingBalance: true,
          loadingTransactions: true,
          balance: wallet.balance,
          transactions: wallet.transactions,
        ),
      );

      final transactions = await compute(computeHistory, {
        'descriptor': _walletsCubit.state.selectedWallet!.descriptor,
        'nodeAddress': node,
      });

      final int totalIn = transactions.fold(
        0,
        (int sum, Transaction item) => (item.sent == 0 && item.timestamp > 0)
            ? sum + item.received
            : sum + 0,
      );
      final int totalOut = transactions.fold(
        0,
        (int sum, Transaction item) => (item.sent != 0 && item.timestamp > 0)
            ? sum + item.sent + item.fee
            : sum + 0,
      );

      final inferredBalance = totalIn - totalOut;

      _vibrate.vibe();

      emit(
        state.copyWith(
          loadingTransactions: false,
          loadingBalance: false,
          transactions: transactions,
          errLoadingTransactions: '',
          balance: inferredBalance,
        ),
      );

      _walletsCubit.addBalanceToSelectedWallet(inferredBalance);
      _walletsCubit.addTransactionsToSelectedWallet(transactions);
      return;
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
        url = blockstreamTestnetURL;
      else
        url = blockstreamMainnetURL;

      url += transaction.txid;

      _launcher.launchApp(url);
    } catch (e, s) {
      _logger.logException(e, 'HistoryCubit.openLink', s);
    }
  }

  void shareTransaction(Transaction transaction) {
    try {
      String text = '';
      text += '\nTxId: ' + transaction.txid;
      text += 'Amount: ' + transaction.amountToBtc() + ' BTC';
      text += '\nFee: ' + transaction.feesToBtc() + ' BTC';

      _share.share(text: text, subjectForEmail: emailShareSubject);
    } catch (e, s) {
      _logger.logException(e, 'HistoryCubit.shareTransaction', s);
    }
  }

  void deleteClicked() {
    emit(state.copyWith(errDeleting: ''));

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
    descriptor: data['descriptor']!,
    nodeAddress: data['nodeAddress']!,
  );

  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }
  return resp.result!;
}

int computeBalance(dynamic obj) {
  final data = obj as Map<String, String?>;
  final resp = BitcoinFFI().syncBalance(
    descriptor: data['descriptor']!,
    nodeAddress: data['nodeAddress']!,
  );
  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }
  return resp.result!;
}
