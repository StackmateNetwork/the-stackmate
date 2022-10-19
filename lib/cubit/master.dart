import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/model/master.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'master.freezed.dart';

const defaultNodeAddress = 'default';

@freezed
class MasterKeyState with _$MasterKeyState {
  const factory MasterKeyState({
    MasterKey? key,
    String? error,
    String? network,
  }) = _MasterKeyState;
  const MasterKeyState._();
}

class MasterKeyCubit extends Cubit<MasterKeyState> {
  MasterKeyCubit(
    this._storage,
    this._chainSelect,
  ) : super(const MasterKeyState());

  final IStorage _storage;
  final ChainSelectCubit _chainSelect;

  void init() async {
    final key = _storage.getItem<MasterKey>(
      StoreKeys.MasterKey.name,
      _chainSelect.state.blockchain.index,
    );
    if (key.hasError) {
      if (key.error! == 'empty')
        emit(
          state.copyWith(
            key: null,
            error: null,
          ),
        );
      else
        emit(state.copyWith(error: key.error.toString(), key: null));
    } else {
      emit(
        state.copyWith(
          key: key.result,
          error: null,
        ),
      );
    }
  }

  Future<void> save(
    String root,
    String fingerPrint,
    String seed,
  ) async {
    final masterKey = MasterKey(
      seed: seed,
      passphrase: '',
      root: root,
      fingerprint: fingerPrint,
      network: _chainSelect.state.blockchain.name,
    );

    final saved = await _storage.saveItemAt<MasterKey>(
      StoreKeys.MasterKey.name,
      _chainSelect.state.blockchain.index,
      masterKey,
    );
    if (saved.hasError) {
      emit(state.copyWith(error: saved.error.toString()));
      return;
    }
    await Future.delayed(const Duration(milliseconds: 200));
  }

  Future<void> saveBackupPending(
    String seed,
    String passphrase,
    String root,
    String fingerPrint,
  ) async {
    final masterKey = MasterKey(
      seed: seed,
      passphrase: passphrase,
      root: root,
      fingerprint: fingerPrint,
      network: _chainSelect.state.blockchain.name,
    );

    final saved = await _storage.saveItemAt<MasterKey>(
      StoreKeys.MasterKey.name,
      _chainSelect.state.blockchain.index,
      masterKey,
    );
    if (saved.hasError) {
      emit(state.copyWith(error: saved.error.toString()));
      return;
    }
    await Future.delayed(const Duration(milliseconds: 200));
  }
}
