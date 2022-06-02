import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
  ) : super(const MasterKeyState());

  final IStorage _storage;

  void init() async {
    final key = _storage.getFirstItem<MasterKey>(StoreKeys.MasterKey.name);
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

  Future<void> save(String root, String fingerPrint, String network) async {
    final masterKey =
        MasterKey(root: root, fingerprint: fingerPrint, network: network);

    final saved =
        await _storage.saveItem<MasterKey>(StoreKeys.MasterKey.name, masterKey);
    if (saved.hasError) {
      emit(state.copyWith(error: saved.error.toString()));
      return;
    }
    await Future.delayed(const Duration(milliseconds: 200));
  }
}
