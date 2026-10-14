import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/bitcoin_worker.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/model/fees.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'fees.freezed.dart';

@freezed
abstract class FeesState with _$FeesState {
  const factory FeesState({
    @Default(Fees(timestamp: 0, slow: 0.0, medium: 0.0, fast: 0.0)) Fees fees,
    @Default(false) bool updating,
    @Default('') String errUpdating,
    @Default('') String networkStrength,
  }) = _FeesState;
}

class FeesCubit extends Cubit<FeesState> {
  FeesCubit(
    this._storage,
    this._blockchain,
    this._nodeAddressCubit,
    this._torCubit,
    this._logger,
  ) : super(const FeesState()) {
    init();
  }

  final IStorage _storage;
  final ChainSelectCubit _blockchain;
  final NodeAddressCubit _nodeAddressCubit;
  final TorCubit _torCubit;
  final Logger _logger;

  /// Shows the last saved fees, then fetches fresh ones.
  Future<void> init() async {
    final fees = _storage.getFirstItem<Fees>(StoreKeys.Fees.name);
    if (!fees.hasError) {
      emit(state.copyWith(fees: fees.result!));
      networkStrength();
    }
    await update();
  }

  Fees getFees() => state.fees;

  void networkStrength() {
    final fast = state.fees.fast;
    final strength = fast < 5
        ? 'LOW'
        : fast < 25
            ? 'MEDIUM'
            : 'HIGH';
    emit(state.copyWith(networkStrength: strength));
  }

  Future<void> update() async {
    emit(state.copyWith(updating: true, errUpdating: ''));
    try {
      final fastRate = (await BitcoinWorker.estimateFee(
        network: _blockchain.state.blockchain.name,
        nodeAddress: _nodeAddressCubit.state.getAddress(),
        socks5: _torCubit.state.getSocks5(),
        targetSize: '1',
      )).orThrow();

      const slowRate = 1.0;
      final feesUpdated = Fees(
        timestamp: DateTime.now().millisecondsSinceEpoch,
        slow: slowRate,
        medium: max(slowRate, fastRate / 2),
        fast: max(slowRate, fastRate),
      );
      emit(state.copyWith(fees: feesUpdated));
      networkStrength();

      final cleared = await _storage.clearAll<Fees>(StoreKeys.Fees.name);
      if (cleared.hasError) throw cleared.error!;
      final saved = await _storage.saveItem<Fees>(
        StoreKeys.Fees.name,
        feesUpdated,
      );
      if (saved.hasError) throw saved.error!;

      emit(state.copyWith(updating: false));
    } catch (e, s) {
      emit(state.copyWith(updating: false, errUpdating: e.toString()));
      _logger.logException(e.toString(), 'FeesCubit', s);
    }
  }
}
