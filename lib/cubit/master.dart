import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
    Master? key,
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

  final FlutterSecureStorage _storage;
  final ChainSelectCubit _chainSelect;

  Future<void> init() async {
    final key = _storage.read(key: 'master');
    // if (key.hasError) {
    //   if (key.error! == 'empty')
    //     emit(
    //       state.copyWith(
    //         key: null,
    //         error: null,
    //       ),
    //     );
    //   else
    //     emit(state.copyWith(error: key.error.toString(), key: null));
    // } else {
    //   emit(
    //     state.copyWith(
    //       key: key.result,
    //       error: null,
    //     ),
    //   );
    // }
  }

  Future<void> save(
    String root,
    String fingerPrint,
    String seed,
  ) async {
    final masterKey = Master(
      seed: seed,
      root: root,
      fingerprint: fingerPrint,
      network: _chainSelect.state.blockchain.name,
      isbackup: true,
    );

    final saved = await _storage.write(
      key: 'master',
      value: json.encode(masterKey.toJson()),
    );
    // if (saved.hasError) {
    //   emit(state.copyWith(error: saved.error.toString()));
    //   return;
    // }
    await Future.delayed(const Duration(milliseconds: 200));
  }

  Future<void> saveBackupPending(
    String seed,
    String root,
    String fingerPrint,
  ) async {
    final masterKey = Master(
      seed: seed,
      root: root,
      fingerprint: fingerPrint,
      network: _chainSelect.state.blockchain.name,
      isbackup: false,
    );

    final saved = await _storage.write(
        key: 'master', value: json.encode(masterKey.toJson()));
    // if (saved.hasError) {
    //   emit(state.copyWith(error: saved.error.toString()));
    //   return;
    // }
    await Future.delayed(const Duration(milliseconds: 200));
  }
}
