import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/stackmate-core.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/share.dart';
import 'package:sats/pkg/interface/vibrate.dart';

part 'receive.freezed.dart';

@freezed
class ReceiveState with _$ReceiveState {
  const factory ReceiveState({
    @Default(true) bool loadingAddress,
    @Default('') String errLoadingAddress,
    String? address,
  }) = _ReceiveState;
}

class ReceiveCubit extends Cubit<ReceiveState> {
  ReceiveCubit(
    this._walletCubit,
    // this._bitcoin,
    this._blockchain,
    this._logger,
    this._clipBoard,
    this._share,
    this._vibrate,
    this._nodeAddressCubit,
  ) : super(const ReceiveState()) {
    _init();
  }

  final WalletsCubit _walletCubit;
  // final IBitcoin _bitcoin;
  final LoggerCubit _logger;
  final ChainSelectCubit _blockchain;
  final IShare _share;
  final IClipBoard _clipBoard;
  final IVibrate _vibrate;
  final NodeAddressCubit _nodeAddressCubit;

  void _init() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    getAddress();
  }

  void getAddress() async {
    try {
      // await Future.delayed(const Duration(milliseconds: 500));

      emit(
        state.copyWith(
          loadingAddress: true,
          errLoadingAddress: '',
        ),
      );

      // await Future.delayed(const Duration(seconds: 1));

      // final w = _walletCubit.state.selectedWallet!.descriptor.split('#')[0];
      final w = _walletCubit.state.selectedWallet!.mainWallet.descriptor;
      final node = _nodeAddressCubit.state.getAddress();

      final address = await compute(getAdrr, {
        'depositDesc': w,
        'nodeAddress': node,
      });
      //await _bitcoin.getAddress(
      //   depositDesc: w,
      //   network: _blockchain.state.blockchain.name,
      //   index: '0',
      // );
      // await Future.delayed(const Duration(seconds: 1));

      _logger.logAPI(
        'get address',
        'desc: $w\nnetwork: ' + _blockchain.state.blockchain.name + '\n\nresp:\n$address',
        000,
      );

      _vibrate.vibe();

      emit(
        state.copyWith(
          loadingAddress: false,
          address: address,
        ),
      );
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
      _clipBoard.copyToClipBoard(state.address!);
      _vibrate.vibe();
    } catch (e, s) {
      _logger.logException(e, 'WalletCubit.copyAddress', s);
    }
  }

  void shareAddress() {
    try {
      final address = state.address!;
      final text = 'This is my bitcoin address:\n$address';
      _share.share(text: text, subjectForEmail: 'Bitcoin Address');
    } catch (e, s) {
      _logger.logException(e, 'WalletCubit.shareAddress', s);
    }
  }
}

String getAdrr(dynamic msg) {
  final data = msg as Map<String, String?>;
  final resp = BitcoinFFI().getAddress(
    depositDesc: data['depositDesc']!,
    nodeAddress: data['nodeAddress']!,
    index: '0',
  );
  return resp;
}
