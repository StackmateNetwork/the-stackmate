import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/model/social-root.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'social-root.freezed.dart';

const defaultNodeAddress = 'default';

@freezed
class SocialRootState with _$SocialRootState {
  const factory SocialRootState({
    SocialRoot? key,
    String? error,
  }) = _SocialRootState;
  const SocialRootState._();
}

class SocialRootCubit extends Cubit<SocialRootState> {
  SocialRootCubit(
    this._storage,
    this._chainSelect,
  ) : super(const SocialRootState());

  final IStorage _storage;
  final ChainSelectCubit _chainSelect;

  Future<void> init() async {
    final key = _storage.getItem<SocialRoot>(
      StoreKeys.SocialRoot.name,
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
    String xprv,
    String mnemonic,
  ) async {
    final socialRoot = SocialRoot(
      xprv: xprv,
      mnemonic: mnemonic,
    );

    final saved = await _storage.saveItemAt<SocialRoot>(
      StoreKeys.SocialRoot.name,
      _chainSelect.state.blockchain.index,
      socialRoot,
    );
    if (saved.hasError) {
      emit(state.copyWith(error: saved.error.toString()));
      return;
    }
    await Future.delayed(const Duration(milliseconds: 200));
  }

}
