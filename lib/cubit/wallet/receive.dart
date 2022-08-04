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
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/pkg/interface/vibrate.dart';
import 'package:sqflite/sqflite.dart' hide Transaction;

part 'receive.freezed.dart';

@freezed
class ReceiveState with _$ReceiveState {
  const factory ReceiveState({
    @Default(true) bool loadingAddress,
    @Default('') String errLoadingAddress,
    @Default('') String address,
    @Default(0) int index,
  }) = _ReceiveState;
}

class ReceiveCubit extends Cubit<ReceiveState> {
  ReceiveCubit(
    this._walletsCubit,
    this._logger,
    this._clipBoard,
    this._share,
    this._vibrate,
    this._core,
    this._nodeAddressCubit,
    this._torCubit,
  ) : super(const ReceiveState()) {
    _init();
  }

  final WalletsCubit _walletsCubit;
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

    final wallet = _walletsCubit.state.selectedWallet!;
    final index = wallet.lastAddressIndex;

    final latestAddress = _core.getAddress(
      descriptor: wallet.descriptor,
      index: index.toString(),
    );
    if (latestAddress.hasError) {
      throw SMError.fromJson(latestAddress.error!);
    }

    // emit(
    //   state.copyWith(
    //     loadingAddress: true,
    //     address: latestAddress.result!,
    //   ),
    // );

    final updated = wallet.copyWith(
      lastAddressIndex: index,
    );
    _walletsCubit.walletSelected(updated);

    await _walletsCubit.updateAddressIndexToSelectedWallet(index);
    emit(
      state.copyWith(
        address: latestAddress.result!,
        index: index,
      ),
    );
    getLastUnusedAddress();
  }

  void getNewAddress() async {
    try {
      emit(
        state.copyWith(
          errLoadingAddress: '',
        ),
      );
      final wallet = _walletsCubit.state.selectedWallet!;
      final currentIndex = wallet.lastAddressIndex + 1;

      final latestAddress = _core.getAddress(
        descriptor: wallet.descriptor,
        index: currentIndex.toString(),
      );
      if (latestAddress.hasError) {
        throw SMError.fromJson(latestAddress.error!);
      }

      // emit(
      //   state.copyWith(
      //     loadingAddress: true,
      //     address: latestAddress.result!,
      //   ),
      // );

      final updated = wallet.copyWith(
        lastAddressIndex: currentIndex,
      );
      _walletsCubit.walletSelected(updated);

      await _walletsCubit.updateAddressIndexToSelectedWallet(currentIndex);

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
      final wallet = _walletsCubit.state.selectedWallet!;
      final currentIndex = wallet.lastAddressIndex - 1;

      final latestAddress = _core.getAddress(
        descriptor: wallet.descriptor,
        index: currentIndex.toString(),
      );
      if (latestAddress.hasError) {
        throw SMError.fromJson(latestAddress.error!);
      }

      final updated = wallet.copyWith(
        lastAddressIndex: currentIndex,
      );
      _walletsCubit.walletSelected(updated);

      await _walletsCubit.updateAddressIndexToSelectedWallet(currentIndex);

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

  void getLastUnusedAddress() async {
    emit(
      state.copyWith(
        loadingAddress: true,
      ),
    );

    final node = _nodeAddressCubit.state.getAddress();
    final socks5 = _torCubit.state.getSocks5();
    final wallet = _walletsCubit.state.selectedWallet!;
    final dbName = wallet.label + '_sm8.db';
    final db = await openDatabase(dbName);

    final databasesPath = await getDatabasesPath();
    final dbPath = join(databasesPath, dbName);

    // THIS PART NEEDS TO BE REVIEWS
    // compute is used and errors are not properly handled

    // ignore: unused_local_variable
    final syncStat = await compute(sqliteSync, {
      'dbPath': dbPath,
      'descriptor': _walletsCubit.state.selectedWallet!.descriptor,
      'nodeAddress': node,
      'socks5': socks5,
    });

    final lastUnused = _core.lastUnusedAddress(
      descriptor: wallet.descriptor,
      dbPath: dbPath,
    );
    if (lastUnused.hasError) {
      throw SMError.fromJson(lastUnused.error!);
    }
    final updated = wallet.copyWith(
      lastAddressIndex: int.parse(lastUnused.result!.index),
    );
    _walletsCubit.walletSelected(updated);
    await _walletsCubit.updateAddressIndexToSelectedWallet(
      int.parse(lastUnused.result!.index),
    );

    emit(
      state.copyWith(
        loadingAddress: false,
        address: lastUnused.result!.address,
        index: int.parse(lastUnused.result!.index),
      ),
    );
    db.close();
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

String getAddressByIndex(dynamic msg) {
  final data = msg as Map<String, String?>;
  final resp = LibBitcoin().getAddress(
    descriptor: data['descriptor']!,
    index: data['index']!,
  );
  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }
  return resp.result!;
}

Address getLastUnusedAddress(dynamic msg) {
  final data = msg as Map<String, String?>;
  final resp = LibBitcoin().lastUnusedAddress(
    descriptor: data['descriptor']!,
    dbPath: data['dbPath']!,
  );
  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }
  return resp.result!;
}

String sqliteSync(dynamic obj) {
  final data = obj as Map<String, String?>;
  final resp = LibBitcoin().sqliteSync(
    dbPath: obj['dbPath']!,
    descriptor: data['descriptor']!,
    nodeAddress: data['nodeAddress']!,
    socks5: obj['socks5']!,
  );
  if (resp.hasError) {
    throw SMError.fromJson(resp.error!);
  }
  return resp.result!;
}
