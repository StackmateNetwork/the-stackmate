import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libstackmate/outputs.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/api/libbitcoin.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/pkg/interface/vibrate.dart';

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
  ) : super(const ReceiveState()) {
    _init();
  }

  final WalletsCubit _walletsCubit;
  final Logger _logger;
  final IShare _share;
  final IClipBoard _clipBoard;
  final IVibrate _vibrate;
  final IStackMateBitcoin _core;

  static const emailShareSubject = 'Bitcoin Address';

  void _init() {
    getAddress();
  }

  void getAddress() async {
    try {
      emit(
        state.copyWith(
          loadingAddress: true,
          errLoadingAddress: '',
        ),
      );
      final wallet = _walletsCubit.state.selectedWallet!;
      final nextIndex = wallet.lastAddressIndex + 1;
      print(wallet.descriptor);

      final latestAddress = _core.getAddress(
        descriptor: wallet.descriptor,
        index: nextIndex.toString(),
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
        lastAddressIndex: nextIndex,
      );
      _walletsCubit.walletSelected(updated);

      await _walletsCubit.updateAddressIndexToSelectedWallet(nextIndex);

      emit(
        state.copyWith(
          loadingAddress: false,
          address: latestAddress.result!,
          index: nextIndex,
        ),
      );
      return;
    } catch (e, s) {
      emit(
        state.copyWith(
          loadingAddress: false,
          errLoadingAddress: e.toString(),
        ),
      );
      _logger.logException(e, 'ReceiveCubit.getAddress', s);
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

String getAdrr(dynamic msg) {
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
