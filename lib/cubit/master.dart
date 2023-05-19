import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/model/master.dart';

part 'master.freezed.dart';

const defaultNodeAddress = 'default';

@freezed
class MasterKeyState with _$MasterKeyState {
  const factory MasterKeyState({
    String? key,
    String? error,
    String? network,
  }) = _MasterKeyState;
  const MasterKeyState._();
}

enum StorageKeys {
  securityKey('securityKey');

  const StorageKeys(this.name);
  final String name;
}

class MasterKeyCubit extends Cubit<MasterKeyState> {
  MasterKeyCubit(
    this.storage,
    this._chainSelect,
  ) : super(const MasterKeyState());
  FlutterSecureStorage storage = const FlutterSecureStorage();
  final ChainSelectCubit _chainSelect;

  Future<String?> init(
    StorageKeys key,
  ) async {
    final value = await storage.read(
      key: key.name,
    );
    final seed = jsonDecode(value.toString());

    if (seed['seed'] == null) {
      if (seed.error! == 'empty')
        emit(
          state.copyWith(
            key: null,
            error: null,
          ),
        );
      else
        emit(state.copyWith(error: seed.error.toString(), key: null));
    } else {
      emit(
        state.copyWith(
          key: seed.toString(),
          error: null,
        ),
      );
    }
    return null;
  }

  Future<void> save(
    String root,
    String fingerPrint,
    String seed,
    StorageKeys key,
  ) async {
    final masterKey = MasterKey(
      seed: seed,
      root: root,
      fingerprint: fingerPrint,
      network: _chainSelect.state.blockchain.name,
      backedUp: true,
    );
    final masterDataEncoded = jsonEncode(masterKey);
    final saved = await storage.write(
      key: key.name,
      value: masterDataEncoded,
    );

    await Future.delayed(const Duration(milliseconds: 200));
  }

  Future<void> saveBackupPending(
    String seed,
    String root,
    String fingerPrint,
    StorageKeys key,
  ) async {
    final masterKey = MasterKey(
      seed: seed,
      root: root,
      fingerprint: fingerPrint,
      network: _chainSelect.state.blockchain.name,
      backedUp: false,
    );
    final masterDataEncoded = jsonEncode(masterKey);
    final saved = await storage.write(
      key: key.name,
      value: masterDataEncoded,
    );

    await Future.delayed(const Duration(milliseconds: 200));
  }
}
