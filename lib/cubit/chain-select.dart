import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'chain-select.freezed.dart';

@freezed
class BlockchainState with _$BlockchainState {
  const factory BlockchainState({
    @Default(Blockchain.testNet) Blockchain blockchain,
  }) = _BlockchainState;
}

class ChainSelectCubit extends Cubit<BlockchainState> {
  ChainSelectCubit(
    this._storage,
    this._logger,
  ) : super(const BlockchainState()) {
    _init();
  }

  final IStorage _storage;
  final Logger _logger;

  void _init() async {
    try {
      final blockchain = _storage.getFirstItem<Blockchain>(
        StoreKeys.Blockchain.name,
      );

      emit(BlockchainState(blockchain: blockchain));
      await Future.delayed(const Duration(milliseconds: 50));
    } catch (e, s) {
      if (e.toString() != 'empty') _logger.logException(e, 'BlockchainCubit._init', s);
    }
  }

  void changeBlockchain(Blockchain blockchain) async {
    try {
      emit(BlockchainState(blockchain: blockchain));
      await _storage.saveItemAt<Blockchain>(
        StoreKeys.Blockchain.name,
        0,
        blockchain,
      );
      await Future.delayed(const Duration(milliseconds: 50));
    } catch (e, s) {
      _logger.logException(e, 'BlockchainCubit.changeBlockchain', s);
    }
  }
}
