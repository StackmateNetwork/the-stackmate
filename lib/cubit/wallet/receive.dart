import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libstackmate/outputs.dart';
import 'package:path/path.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/api/libbitcoin.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/result.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/interface/vibrate.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sqflite/sqflite.dart' hide Transaction;

part 'receive.freezed.dart';

@freezed
class ReceiveState with _$ReceiveState {
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
    emit(
      state.copyWith(
        errLoadingAddress: '',
      ),
    );

    final wallet = state.wallet;
    final index = wallet.lastAddressIndex;

    final latestAddress = _core.getAddress(
      descriptor: wallet.descriptor,
      index: index.toString(),
    );
    if (latestAddress.hasError) {
      throw SMError.fromJson(latestAddress.error!).message;
    }
    emit(
      state.copyWith(
        loadingAddress: true,
        address: latestAddress.result!,
      ),
    );

    await getLastUnusedAddress();
  }

  Future<void> updateWalletStorage(Wallet wallet) async {
    await _storage.saveItemAt<Wallet>(
      StoreKeys.Wallet.name,
      wallet.id!,
      wallet,
    );
    walletsCubit.refresh();
  }

  void getNewAddress() async {
    try {
      emit(
        state.copyWith(
          errLoadingAddress: '',
        ),
      );
      final wallet = state.wallet;
      final currentIndex = state.index + 1;

      final latestAddress = _core.getAddress(
        descriptor: wallet.descriptor,
        index: currentIndex.toString(),
      );
      if (latestAddress.hasError) {
        throw SMError.fromJson(latestAddress.error!);
      }

      // final updated = wallet.copyWith(
      //   lastAddressIndex: currentIndex,
      // );

      // updateWalletStorage(updated);

      emit(
        state.copyWith(
          address: latestAddress.result!,
          index: currentIndex,
        ),
      );
    } catch (e, s) {
      emit(
        state.copyWith(
          errLoadingAddress: e.toString(),
        ),
      );
      _logger.logException(e, 'ReceiveCubit.getAddress', s);
    }
  }

  void getLastAddress() async {
    try {
      emit(
        state.copyWith(
          errLoadingAddress: '',
        ),
      );
      final wallet = state.wallet;
      final currentIndex = state.index - 1;

      final latestAddress = _core.getAddress(
        descriptor: wallet.descriptor,
        index: currentIndex.toString(),
      );
      if (latestAddress.hasError) {
        throw SMError.fromJson(latestAddress.error!);
      }

      // final updated = wallet.copyWith(
      //   lastAddressIndex: currentIndex,
      // );

      // await updateWalletStorage(updated);

      emit(
        state.copyWith(
          address: latestAddress.result!,
          index: currentIndex,
        ),
      );
    } catch (e, s) {
      emit(
        state.copyWith(
          errLoadingAddress: e.toString(),
        ),
      );
      _logger.logException(e, 'ReceiveCubit.getAddress', s);
    }
  }

  Future<void> getLastUnusedAddress() async {
    emit(
      state.copyWith(
        loadingAddress: true,
      ),
    );
    try {
      final node = _nodeAddressCubit.state.getAddress();
      final socks5 = _torCubit.state.getSocks5();
      final wallet = state.wallet;

      final dbName = wallet.label + wallet.uid + '.db';
      final db = await openDatabase(dbName);

      final databasesPath = await getDatabasesPath();
      final dbPath = join(databasesPath, dbName);

      // THIS PART NEEDS TO BE REVIEWS
      // compute is used and errors are not properly handled

      // ignore: unused_local_variable
      final syncStat = await compute(sqliteSync, {
        'dbPath': dbPath,
        'descriptor': state.wallet.descriptor,
        'nodeAddress': node,
        'socks5': socks5,
      });
      if (syncStat.hasError) throw SMError.fromJson(syncStat.error!).message;

      final lastUnused = _core.lastUnusedAddress(
        descriptor: wallet.descriptor,
        dbPath: dbPath,
      );

      if (lastUnused.hasError) {
        throw SMError.fromJson(lastUnused.error!).message;
      }
      final updated = wallet.copyWith(
        lastAddressIndex: int.parse(lastUnused.result!.index),
      );
      await updateWalletStorage(
        updated,
      );

      emit(
        state.copyWith(
          loadingAddress: false,
          address: lastUnused.result!.address,
          index: int.parse(lastUnused.result!.index),
        ),
      );
      db.close();
    } catch (e, s) {
      emit(
        state.copyWith(
          loadingAddress: false,
          errLoadingAddress: e.toString(),
        ),
      );
      _logger.logException(e, 'WalletCubit.lastUnusedAddress', s);
    }
  }

  void copyAddress() {
    try {
      _clipBoard.copyToClipBoard(state.address);
      _vibrate.vibe();
    } catch (e, s) {
      _logger.logException(e, 'WalletCubit.copyAddress', s);
    }
  }

  void shareAddress() {
    try {
      final address = state.address;
      final text = address;
      _share.share(text: text, subjectForEmail: emailShareSubject);
    } catch (e, s) {
      _logger.logException(e, 'WalletCubit.shareAddress', s);
    }
  }
}

R<String> getAddressByIndex(dynamic msg) {
  final data = msg as Map<String, String?>;
  final resp = LibBitcoin().getAddress(
    descriptor: data['descriptor']!,
    index: data['index']!,
  );

  return resp;
}

R<Address> getLastUnusedAddress(dynamic msg) {
  final data = msg as Map<String, String?>;
  final resp = LibBitcoin().lastUnusedAddress(
    descriptor: data['descriptor']!,
    dbPath: data['dbPath']!,
  );
  return resp;
}

R<String> sqliteSync(dynamic obj) {
  final data = obj as Map<String, String?>;
  final resp = LibBitcoin().sqliteSync(
    dbPath: obj['dbPath']!,
    descriptor: data['descriptor']!,
    nodeAddress: data['nodeAddress']!,
    socks5: obj['socks5']!,
  );

  return resp;
}
