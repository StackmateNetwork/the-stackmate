import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/model/master.dart';
import 'package:sats/model/recover.dart';

part 'master.freezed.dart';

const defaultNodeAddress = 'default';

@freezed
class MasterKeyState with _$MasterKeyState {
  const factory MasterKeyState({
    MasterKey? key,
    RecoveredKey? rkey,
    String? error,
    String? network,
  }) = _MasterKeyState;
  const MasterKeyState._();
}

class MasterKeyCubit extends Cubit<MasterKeyState> {
  MasterKeyCubit(
    this._chainSelect,
  ) : super(const MasterKeyState());
  FlutterSecureStorage storage = const FlutterSecureStorage();
  final ChainSelectCubit _chainSelect;

  Future<void> init() async {
    if (_chainSelect.state.blockchain.name == 'main') {
      final value = await storage.read(
        key: 'Masterkey',
      );
      if (value == null) {
        emit(state.copyWith(key: null));
        return;
      } else {
        final jsonD = jsonDecode(value);
        final key = MasterKey.fromJson(jsonD as Map<String, dynamic>);
        if (key.seed != null) {
          emit(
            state.copyWith(
              key: key,
              error: null,
            ),
          );
        }
        return;
      }
    } else {
      final value = await storage.read(
        key: 'Testkey',
      );
      if (value == null) {
        emit(state.copyWith(key: null));
        return;
      } else {
        final jsonD = jsonDecode(value);
        final key = MasterKey.fromJson(jsonD as Map<String, dynamic>);
        if (key.seed != null) {
          emit(
            state.copyWith(
              key: key,
              error: null,
            ),
          );
        }
        return;
      }
    }
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
    if (_chainSelect.state.blockchain.name == 'main')
      final saved = await storage.write(
        key: 'Masterkey',
        value: jsonEncode(masterData),
      );
    //final save =  saveValue();
    else
      final saved = await storage.write(
        key: 'Testkey',
        value: jsonEncode(masterData),
      );
    await Future.delayed(const Duration(milliseconds: 200));
  }

  Future<void> getRecoverkey(
    String fingerPrint,
  ) async {
    if (_chainSelect.state.blockchain.name == 'main') {
      final value = await storage.read(
        key: 'recoverkey' + fingerPrint,
      );
      if (value == null) {
        emit(state.copyWith(key: null));
        return;
      } else {
        final jsonD = jsonDecode(value);
        final key = RecoveredKey.fromJson(jsonD as Map<String, dynamic>);
        if (key.seed != null) {
          emit(
            state.copyWith(
              rkey: key,
              error: null,
            ),
          );
        }
        return;
      }
    } else {
      final value = await storage.read(
        key: 'recovertestkey' + fingerPrint,
      );
      if (value == null) {
        emit(state.copyWith(key: null));
        return;
      } else {
        final jsonD = jsonDecode(value);
        final key = RecoveredKey.fromJson(jsonD as Map<String, dynamic>);
        if (key.seed != null) {
          emit(
            state.copyWith(
              rkey: key,
              error: null,
            ),
          );
        }
        return;
      }
    }
  }

  Future<void> saveRecover(
    String root,
    String fingerPrint,
    String seed,
  ) async {
    final recoverKey = RecoveredKey(
      seed: seed,
      root: root,
      fingerprint: fingerPrint,
      network: _chainSelect.state.blockchain.name,
    );
    final recoverData = recoverKey.toJson();
    if (_chainSelect.state.blockchain.name == 'main')
      final saved = await storage.write(
        key: 'recoverkey' + fingerPrint,
        value: jsonEncode(recoverData),
      );
    else
      final saved = await storage.write(
        key: 'recovertestkey' + fingerPrint,
        value: jsonEncode(recoverData),
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
    if (_chainSelect.state.blockchain.name == 'main')
      final saved = await storage.write(
        key: 'Masterkey',
        value: jsonEncode(masterData),
      );
    else
      final saved = await storage.write(
        key: 'Testkey',
        value: jsonEncode(masterData),
      );

    await Future.delayed(const Duration(milliseconds: 200));
  }
}
