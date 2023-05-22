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

class MasterKeyCubit extends Cubit<MasterKeyState> {
  MasterKeyCubit(
    this._chainSelect,
  ) : super(const MasterKeyState());
  FlutterSecureStorage storage = const FlutterSecureStorage();
  final ChainSelectCubit _chainSelect;

  Future<void> init() async {
    emit(
      state.copyWith(
        key: null,
      ),
    );
    if (_chainSelect.state.blockchain.name == 'main') {
      final value = await storage.read(
        key: 'Masterkey',
      );

      final jsonD = await jsonDecode(value!);
      final seed = MasterKey.fromJson(jsonD as Map<String, dynamic>);
      if (seed.root == '') {
        emit(
          state.copyWith(
            key: null,
            error: state.error,
          ),
        );
      } else {
        emit(
          state.copyWith(
            key: seed,
            error: null,
          ),
        );
      }
      return;
    } else {
      final value = await storage.read(
        key: 'Testkey',
      );

      final jsonD = jsonDecode(value!);
      final seed = MasterKey.fromJson(jsonD as Map<String, dynamic>);
      if (seed.root == '') {
        emit(
          state.copyWith(
            key: null,
            error: state.error,
          ),
        );
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
    else
      final saved = await storage.write(
        key: 'Testkey',
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
