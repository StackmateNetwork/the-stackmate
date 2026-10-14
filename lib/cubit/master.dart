import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/model/master.dart';
import 'package:sats/model/recover.dart';
import 'package:sats/pkg/secure-storage.dart';

part 'master.freezed.dart';

@freezed
abstract class MasterKeyState with _$MasterKeyState {
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

  final SStorage storage;
  final ChainSelectCubit _chainSelect;
  static const mainkey = 'Masterkey';
  static const testkey = 'Testkey';
  static const recoverkey = 'Recoverkey';

  String get _network => _chainSelect.state.blockchain.name;

  String get _masterKeyName => _network == 'main' ? mainkey : testkey;

  /// Loads the master key of the selected network, or clears it if that
  /// network has none.
  Future<void> init() async {
    final value = await storage.getValue(_masterKeyName);
    MasterKey? key;
    if (value.result != null) {
      key = MasterKey.fromJson(
        jsonDecode(value.result!) as Map<String, dynamic>,
      );
      if (key.seed == null) key = null;
    }
    emit(state.copyWith(key: key, error: null));
  }

  Future<void> save(String root, String fingerPrint, String seed) =>
      _saveMaster(root, fingerPrint, seed, backedUp: true);

  Future<void> saveBackupPending(
    String seed,
    String root,
    String fingerPrint,
  ) =>
      _saveMaster(root, fingerPrint, seed, backedUp: false);

  Future<void> _saveMaster(
    String root,
    String fingerPrint,
    String seed, {
    required bool backedUp,
  }) async {
    final masterKey = MasterKey(
      seed: seed,
      root: root,
      fingerprint: fingerPrint,
      network: _network,
      backedUp: backedUp,
    );
    await storage.saveValue(
      key: _masterKeyName,
      value: jsonEncode(masterKey.toJson()),
    );
  }

  Future<void> getRecoverkey(String fingerPrint) async {
    final value = await storage.getValue(recoverkey + fingerPrint);
    RecoveredKey? key;
    if (value.result != null) {
      key = RecoveredKey.fromJson(
        jsonDecode(value.result!) as Map<String, dynamic>,
      );
      if (key.seed == null) key = null;
    }
    emit(state.copyWith(rkey: key, error: null));
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
      network: _network,
    );
    await storage.saveValue(
      key: recoverkey + fingerPrint,
      value: jsonEncode(recoverKey.toJson()),
    );
  }
}
