import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/model/master.dart';
import 'package:sats/model/recover.dart';
import 'package:sats/pkg/secure-storage.dart';

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
    this.storage,
    this._chainSelect,
  ) : super(const MasterKeyState());
//FlutterSecureStorage storage = const FlutterSecureStorage();
  final SStorage storage;
  final ChainSelectCubit _chainSelect;
  static const mainkey = 'Masterkey';
  static const testkey = 'Testkey';
  static const recoverkey = 'Recoverkey';

  Future<void> init() async {
    if (_chainSelect.state.blockchain.name == 'main') {
      final value = await storage.getValue(mainkey);
      // ignore: unnecessary_null_comparison
      if (value == null) {
        emit(state.copyWith(key: null));
        return;
      } else {
        final jsonD = jsonDecode(value.result!);
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
      final value = await storage.getValue(testkey);
      // ignore: unnecessary_null_comparison
      if (value == null) {
        emit(state.copyWith(key: null));
        return;
      } else {
        final jsonD = jsonDecode(value.result!);
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
      await storage.saveValue(
        key: mainkey,
        value: jsonEncode(masterData),
      );
    else
      await storage.saveValue(
        key: testkey,
        value: jsonEncode(masterData),
      );
    await Future.delayed(const Duration(milliseconds: 200));
  }

  Future<void> getRecoverkey(
    String fingerPrint,
  ) async {
    if (_chainSelect.state.blockchain.name == 'main') {
      final value = await storage.getValue(recoverkey + fingerPrint);
      // ignore: unnecessary_null_comparison
      if (value == null) {
        emit(state.copyWith(rkey: null));
        return;
      } else {
        final jsonD = jsonDecode(value.result!);
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
      final value = await storage.getValue(
        recoverkey + fingerPrint,
      );
      // ignore: unnecessary_null_comparison
      if (value == null) {
        emit(state.copyWith(rkey: null));
        return;
      } else {
        final jsonD = jsonDecode(value.result!);
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
      await storage.saveValue(
        key: recoverkey + fingerPrint,
        value: jsonEncode(recoverData),
      );
    else
      await storage.saveValue(
        key: recoverkey + fingerPrint,
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
      await storage.saveValue(
        key: mainkey,
        value: jsonEncode(masterData),
      );
    else
      await storage.saveValue(
        key: testkey,
        value: jsonEncode(masterData),
      );

    await Future.delayed(const Duration(milliseconds: 200));
  }
}
