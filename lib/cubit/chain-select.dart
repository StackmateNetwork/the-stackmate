import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'chain-select.freezed.dart';

@freezed
abstract class BlockchainState with _$BlockchainState {
  const factory BlockchainState({
    @Default(Blockchain.main) Blockchain blockchain,
  }) = _BlockchainState;
}

class ChainSelectCubit extends Cubit<BlockchainState> {
  ChainSelectCubit(this._storage, this._logger)
    : super(const BlockchainState());

  final IStorage _storage;
  final Logger _logger;

  Future<void> init() async {
    final blockchain = _storage.getFirstItem<Blockchain>(
      StoreKeys.Blockchain.name,
    );
    if (blockchain.hasError) {
      if (blockchain.error != 'empty') {
        _logger.logException(
          blockchain.error,
          'BlockchainCubit.init',
          StackTrace.current,
        );
      }
      return;
    }
    emit(BlockchainState(blockchain: blockchain.result!));
  }

  Future<void> changeBlockchain(Blockchain blockchain) async {
    try {
      emit(BlockchainState(blockchain: blockchain));
      await _storage.saveItemAt<Blockchain>(
        StoreKeys.Blockchain.name,
        0,
        blockchain,
      );
    } catch (e, s) {
      _logger.logException(e, 'BlockchainCubit.changeBlockchain', s);
    }
  }
}
