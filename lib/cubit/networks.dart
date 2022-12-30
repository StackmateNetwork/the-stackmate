import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libcpclient/cpclient.dart';
import 'package:sats/api/libcp.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/social-root.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/model/master.dart';
import 'package:sats/model/network-server-identity.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sats/api/interface/libcp.dart';

part 'networks.freezed.dart';

@freezed
class NetworksState with _$NetworksState {
  const factory NetworksState({
    @Default([]) List<NetworkServerIdentity> networks,
    String? hostname,
    @Default('') String username,
    @Default('') String inviteCode,
    @Default('') String error,
    String? name,
    String? kind,
    String? pubkey,
    @Default(false) bool isLoading,
  }) = _NetworksState;
}

class NetworksCubit extends Cubit<NetworksState> {
  NetworksCubit(
    this._storage,
    this._logger,
    this._clipBoard,
    this._torCubit,
    this._socialRoot,
  ) : super(const NetworksState()) {
    load();
  }

  final IStorage _storage;
  final Logger _logger;
  final IClipBoard _clipBoard;
  final TorCubit _torCubit;
  final SocialRootCubit _socialRoot;

  void load() {
    try {
      final storedNetworks =
          _storage.getAll<NetworkServerIdentity>(StoreKeys.Networks.name);
      if (storedNetworks.hasError) return;

      final networks = storedNetworks.result!;

      emit(
        state.copyWith(
          networks: networks,
        ),
      );
    } catch (e, s) {
      _logger.logException(e, 'NetworksCubit.load', s);
    }
  }

  void hostnameChanged(String text) {
    emit(
      state.copyWith(
        error: '',
      ),
    );
    if (text.startsWith('https://')) {
      final hostname = text.replaceAll('https://', '');
      emit(
        state.copyWith(
          hostname: hostname,
        ),
      );
    } else
      emit(
        state.copyWith(
          hostname: text,
        ),
      );
  }

  Future<void> pingHost() async {
    try {
      if (state.hostname == '' || state.hostname == null) {
        emit(
          state.copyWith(
            error: 'No hostname entered!',
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          error: '',
          isLoading: true,
        ),
      );
      final socks5 = _torCubit.state.socks5Port;
      final socialRoot = _socialRoot.state.key!.xprv;
      final serverId = await compute(serverIdentity, {
        'hostname': 'https://' + state.hostname!,
        'socks5': socks5.toString(),
        'socialRoot': socialRoot,
      });

      if (serverId.hasError) {
        emit(
          state.copyWith(
            error: 'Could not find host!',
            isLoading: false,
          ),
        );
      } else {
        emit(
          state.copyWith(
            name: serverId.result!.name,
            kind: serverId.result!.kind,
            pubkey: serverId.result!.pubkey,
            error: '',
            isLoading: false,
          ),
        );
      }
    } catch (e, s) {
      _logger.logException(e, 'NetworksCubit.ping', s);
    }
  }

  void usernameChanged(String text) {
    emit(
      state.copyWith(
        username: text,
        error: '',
      ),
    );
  }

  void inviteCodeChanged(String text) {
    emit(
      state.copyWith(
        error: '',
        inviteCode: text,
      ),
    );
  }

  void pasteInviteCode() async {
    final text = await _clipBoard.pasteFromClipBoard();
    if (text.hasError) return;
    inviteCodeChanged(text.result!);
  }

  void join() {
    try {
      final usernameRule = RegExp(r'^[a-zA-Z0-9]{3,12}$');

      if (!usernameRule.hasMatch(state.username!)) {
        emit(
          state.copyWith(
            error: 'Username must be 12 Alphanumeric Characters',
          ),
        );
      }
      if (state.inviteCode!.length != 32) {
        emit(
          state.copyWith(
            error: 'Invalid Invite Code Length.',
          ),
        );
      }
    } catch (e, s) {
      _logger.logException(e, 'NetworksCubit.join', s);
    }
  }

  void clear() => emit(const NetworksState());
  // void addTransactionsToSelectedWallet(List<Transaction> transactions) {
  //   final wallet = state.selectedWallet!.copyWith(
  //     transactions: transactions,
  //   );
  //   emit(state.copyWith(selectedWallet: wallet));
  //   _storage.saveItemAt<Wallet>(StoreKeys.Wallet.name, wallet.id!, wallet);
  //   refresh();
  // }

  // Future<void> addBalanceToSelectedWallet(int balance) async {
  //   if (state.selectedWallet == null) return;

  //   final wallet = state.selectedWallet!.copyWith(
  //     balance: balance,
  //   );

  //   emit(state.copyWith(selectedWallet: wallet));

  //   _storage.saveItemAt<Wallet>(StoreKeys.Wallet.name, wallet.id!, wallet);
  //   refresh();
  // }

  // Future<void> updateAddressIndexToSelectedWallet(int lastIndex) async {
  //   if (state.selectedWallet == null) return;

  //   final wallet = state.selectedWallet!.copyWith(
  //     lastAddressIndex: lastIndex,
  //   );

  //   _storage.saveItemAt<Wallet>(StoreKeys.Wallet.name, wallet.id!, wallet);
  //   refresh();
  // }

}

R<ServerIdentity> serverIdentity(dynamic data) {
  final obj = data as Map<String, String?>;
  final resp = LibCypherpost().getServerIdentity(
    hostname: obj['hostname']!,
    socks5: int.parse(obj['socks5']!),
    socialRoot: obj['socialRoot']!,
  );
  return resp;
}
