import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:sats/api/bitcoin_worker.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/transaction.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/interface/launcher.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/interface/vibrate.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sats/pkg/validation.dart';
import 'package:sats/pkg/wallet_db.dart';
import 'package:sqflite/sqflite.dart' hide Transaction;

part 'info.freezed.dart';

@freezed
abstract class InfoState with _$InfoState {
  const factory InfoState({
    required Wallet? wallet,
    @Default(false) bool loadingTransactions,
    @Default('') String errLoadingTransactions,
    @Default(false) bool loadingBalance,
    @Default('') String errLoadingBalance,
    @Default(0) int balance,
    @Default(0) int uconfBalance,
    @Default([]) List<Transaction> transactions,
    @Default('') String errDeleting,
    @Default(false) bool deleted,
    @Default(false) bool showInfo,
    @Default(0) int currentHeight,
    @Default('') String passPhraseTest,
    @Default(false) bool ppTestPassed,
    @Default('') String errorPPTest,
  }) = _InfoState;
  const InfoState._();

  bool zeroBalance() => balance == 0;
  bool zeroBalanceAmt() => balance == 0;
}

class InfoCubit extends Cubit<InfoState> {
  InfoCubit(
    this._walletsCubit,
    this._storage,
    this._logger,
    this._launcher,
    this._share,
    this._vibrate,
    this._nodeAddressCubit,
    this._torCubit,
    this._blockchainCubit,
    Wallet wallet,
  ) : super(InfoState(wallet: wallet)) {
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
  final TorCubit _torCubit;

  static const defaultTestnetExplorer =
      'https://mempool.bullbitcoin.com/testnet/tx/';
  static const defaultMainnetExplorer = 'https://mempool.bullbitcoin.com/tx/';

  static const emailShareSubject = 'Transaction Details';
  static const walletHasFunds = 'Wallet has funds';

  Future<void> _init() async {
    try {
      final wallet = state.wallet;
      walletSelected(wallet!);
      emit(
        state.copyWith(
          wallet: wallet,
          errLoadingTransactions: '',
          balance: wallet.balance,
          transactions: wallet.transactions,
          errorPPTest: '',
          ppTestPassed: false,
          showInfo: wallet.transactions.isEmpty,
        ),
      );
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

  Future<void> walletSelected(Wallet wallet) async {
    emit(state.copyWith(wallet: wallet));
  }

  Future<void> sqliteSyncHistory() async {
    try {
      final wallet = state.wallet;
      emit(
        state.copyWith(
          loadingBalance: true,
          loadingTransactions: true,
          errLoadingTransactions: '',
          balance: wallet!.balance,
          transactions: wallet.transactions,
          errorPPTest: '',
          ppTestPassed: false,
        ),
      );

      final node = _nodeAddressCubit.state.getAddress();
      final socks5 = _torCubit.state.getSocks5();

      final dbPath = await walletDbPath(wallet.label, wallet.uid);

      final currentHeight = (await BitcoinWorker.height(
        network: _blockchainCubit.state.blockchain.name,
        nodeAddress: node,
        socks5: socks5,
      )).orThrow();

      emit(
        state.copyWith(
          loadingBalance: true,
          loadingTransactions: true,
          balance: wallet.balance,
          transactions: wallet.transactions,
          currentHeight: currentHeight,
        ),
      );

      // THIS PART NEEDS TO BE REVIEWS
      // compute is used and errors are not properly handled

      final syncStat = await BitcoinWorker.sync(
        dbPath: dbPath,
        descriptor: state.wallet!.descriptor,
        nodeAddress: node,
        socks5: socks5,
      );
      syncStat.orThrow();
      final balance = (await BitcoinWorker.balance(
        descriptor: state.wallet!.descriptor,
        dbPath: dbPath,
      )).orThrow();

      _vibrate.vibe();

      emit(
        state.copyWith(
          loadingTransactions: true,
          loadingBalance: false,
          errLoadingTransactions: '',
          balance: balance,
          currentHeight: currentHeight,
        ),
      );
      await addBalanceToStorage(balance);

      final transactions = (await BitcoinWorker.history(
        descriptor: state.wallet!.descriptor,
        dbPath: dbPath,
      )).orThrow();

      _vibrate.vibe();

      emit(
        state.copyWith(
          loadingTransactions: false,
          loadingBalance: false,
          transactions: transactions,
          errLoadingTransactions: '',
          balance: balance,
          currentHeight: currentHeight,
        ),
      );

      await addTransactionsToStorage(transactions);

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

  Future<void> updateBalance() async {
    try {
      final wallet = state.wallet;
      final node = _nodeAddressCubit.state.getAddress();
      final socks5 = _torCubit.state.getSocks5();

      emit(
        state.copyWith(
          loadingBalance: true,
          errLoadingTransactions: '',
          balance: wallet!.balance,
          transactions: wallet.transactions,
        ),
      );

      final dbPath = await walletDbPath(wallet.label, wallet.uid);

      final currentHeight = (await BitcoinWorker.height(
        network: _blockchainCubit.state.blockchain.name,
        nodeAddress: node,
        socks5: socks5,
      )).orThrow();

      emit(
        state.copyWith(
          loadingBalance: true,
          loadingTransactions: true,
          balance: wallet.balance,
          transactions: wallet.transactions,
          currentHeight: currentHeight,
        ),
      );

      final syncStat = await BitcoinWorker.sync(
        dbPath: dbPath,
        descriptor: state.wallet!.descriptor,
        nodeAddress: node,
        socks5: socks5,
      );

      syncStat.orThrow();

      final balance = (await BitcoinWorker.balance(
        descriptor: state.wallet!.descriptor,
        dbPath: dbPath,
      )).orThrow();

      _vibrate.vibe();

      emit(
        state.copyWith(
          loadingTransactions: false,
          loadingBalance: false,
          errLoadingTransactions: '',
          balance: balance,
          currentHeight: currentHeight,
        ),
      );
      await addBalanceToStorage(balance);
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

  Future<void> addTransactionsToStorage(List<Transaction> transactions) async {
    final wallet = state.wallet!.copyWith(transactions: transactions);
    emit(state.copyWith(wallet: wallet));
    await _storage.saveItemAt<Wallet>(
      StoreKeys.Wallet.name,
      wallet.id!,
      wallet,
    );
    _walletsCubit.update(wallet);
    // emit(
    //   state.copyWith(
    //     wallet: wallet,
    //   ),
    // );
  }

  Future<void> addBalanceToStorage(int balance) async {
    final wallet = state.wallet!.copyWith(balance: balance);
    emit(state.copyWith(wallet: wallet));
    await _storage.saveItemAt<Wallet>(
      StoreKeys.Wallet.name,
      wallet.id!,
      wallet,
    );
    _walletsCubit.update(wallet);
    // emit(
    //   state.copyWith(
    //     wallet: wallet,
    //   ),
    // );
  }

  void openLink(Transaction transaction) {
    try {
      String url = '';
      if (_blockchainCubit.state.blockchain == Blockchain.test) {
        url = defaultTestnetExplorer;
      } else {
        url = defaultMainnetExplorer;
      }

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
      text += '\nAmount: ' + transaction.amountToBtc() + ' BTC';
      text += '\nFee: ' + transaction.feesToBtc() + ' BTC';

      _share.share(text: text, subjectForEmail: emailShareSubject);
    } catch (e, s) {
      _logger.logException(e, 'HistoryCubit.shareTransaction', s);
    }
  }

  Future<void> deleteClicked() async {
    emit(state.copyWith(errDeleting: ''));
    final wallet = state.wallet;
    final dbPath = await walletDbPath(wallet!.label, wallet.uid);
    await deleteDatabase(dbPath);

    _storage.deleteItemAt<Wallet>(StoreKeys.Wallet.name, state.wallet!.id!);
    _walletsCubit.refresh();
    emit(state.copyWith(deleted: true));
  }

  void toggleShowInfo() {
    emit(state.copyWith(showInfo: !state.showInfo));
  }

  void passPhraseChanged(String text) {
    emit(state.copyWith(passPhraseTest: text));
  }

  Future<void> testPassPhrase(String mnemonic) async {
    final seed = await BitcoinWorker.importMaster(
      mnemonic: mnemonic,
      passphrase: state.passPhraseTest,
      network: _blockchainCubit.state.blockchain.name,
    );

    final wallet = state.wallet;
    if (seed.hasError) {
      emit(
        state.copyWith(
          errorPPTest: seed.error!,
          passPhraseTest: '',
          ppTestPassed: false,
        ),
      );
    } else if (Validation.fingerPrintFromXKey(wallet!.policyElements[0]) ==
        seed.result!.fingerprint) {
      emit(
        state.copyWith(errorPPTest: '', passPhraseTest: '', ppTestPassed: true),
      );
    } else {
      emit(
        state.copyWith(
          errorPPTest: 'Fingerprint Mismatch!',
          passPhraseTest: '',
          ppTestPassed: false,
        ),
      );
    }

    await Future.delayed(const Duration(milliseconds: 500));
    emit(
      state.copyWith(ppTestPassed: false, errorPPTest: '', passPhraseTest: ''),
    );
  }
}
