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
    MasterKey? key,
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

  Future<void> init() async {
    final value = await storage.read(
      key: 'key',
    );
    final jsonD = jsonDecode(value!);
    final seed = MasterKey.fromJson(jsonD as Map<String, dynamic>);
    if (seed.root == '') {
      if (seed.seed == 'empty')
        emit(
          state.copyWith(
            key: null,
            error: null,
          ),
        );
      else
        emit(state.copyWith(error: state.error, key: null));
    } else {
      emit(
        state.copyWith(
          key: seed,
          error: null,
        ),
      );
    }
    return;
  }

  Future<void> save(
    String root,
    String fingerPrint,
    String seed,
  ) async {
    final masterKey = MasterKey(
      seed: seed,
      root: root,
      fingerprint: fingerPrint,
      network: _chainSelect.state.blockchain.name,
      backedUp: true,
    );
    final masterData = masterKey.toJson();
    final saved = await storage.write(
      key: 'key',
      value: jsonEncode(masterData),
    );

    await Future.delayed(const Duration(milliseconds: 200));
  }

  Future<void> saveBackupPending(
    String seed,
    String root,
    String fingerPrint,
  ) async {
    final masterKey = MasterKey(
      seed: seed,
      root: root,
      fingerprint: fingerPrint,
      network: _chainSelect.state.blockchain.name,
      backedUp: false,
    );
    final masterData = masterKey.toJson();
    final saved = await storage.write(
      key: 'key',
      value: jsonEncode(masterData),
    );

    await Future.delayed(const Duration(milliseconds: 200));
  }
}
