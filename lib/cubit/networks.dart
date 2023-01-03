import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libcpclient/cpclient.dart';
import 'package:sats/api/libcp.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/social-root.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/model/network-identity.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'networks.freezed.dart';

const couldNotSaveError = 'Error Save Network!';

@freezed
class NetworksState with _$NetworksState {
  const factory NetworksState({
    @Default([]) List<NetworkIdentity> networks,
    String? hostname,
    @Default('') String username,
    @Default('') String inviteCode,
    @Default('')
        String
            error, // Single error variable because resetting all error states are a pain
    @Default(false) bool existingUser,
    String? name,
    String? kind,
    String? serverPubkey,
    @Default('') String loading,
    @Default(false) bool isLoading,
    @Default(false) bool joined,
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

  Future<void> load() async {
    try {
      final storedNetworks =
          _storage.getAll<NetworkIdentity>(StoreKeys.Networks.name);
      if (storedNetworks.hasError) return;
      await Future.delayed(const Duration(milliseconds: 300));
      final networks = storedNetworks.result!;
      emit(
        state.copyWith(
          networks: networks,
          loading: '',
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
          loading: 'ping',
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
            loading: '',
          ),
        );
      } else {
        emit(
          state.copyWith(
            name: serverId.result!.name,
            kind: serverId.result!.kind,
            serverPubkey: serverId.result!.pubkey,
            error: '',
            loading: '',
          ),
        );
      }
    } catch (e, s) {
      _logger.logException(e, 'NetworksCubit.ping', s);
    }
  }

  void toggleExistingUser() {
    emit(
      state.copyWith(
        existingUser: !state.existingUser,
        error: '',
      ),
    );
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

  Future<void> join() async {
    try {
      emit(
        state.copyWith(
          loading: 'ping',
        ),
      );

      final usernameRule = RegExp(r'^[a-zA-Z0-9]{3,12}$');
      if (!usernameRule.hasMatch(state.username)) {
        emit(
          state.copyWith(
            error: 'Username must be 12 Alphanumeric Characters',
            loading: '',
          ),
        );
        return;
      }
      if (state.inviteCode.length != 32) {
        emit(
          state.copyWith(
            error: 'Invalid Invite Code Length.',
            loading: '',
          ),
        );
        return;
      }

      final socks5 = _torCubit.state.socks5Port;
      final socialRoot = _socialRoot.state.key!.xprv;

      late R<ServerIdentity> serverId;
      if (state.name != '') {
        serverId = await compute(serverIdentity, {
          'hostname': 'https://' + state.hostname!,
          'socks5': socks5.toString(),
          'socialRoot': socialRoot,
        });

        if (serverId.hasError) {
          emit(
            state.copyWith(
              error: 'Could not find host!',
              loading: '',
            ),
          );
          return;
        }
      }

      emit(
        state.copyWith(
          loading: 'joining',
        ),
      );

      final inviteDetail = await compute(joinHostServer, {
        'hostname': 'https://' + state.hostname!,
        'socks5': socks5.toString(),
        'socialRoot': socialRoot,
        'username': state.username,
        'inviteCode': state.inviteCode,
      });

      if (inviteDetail.hasError) {
        emit(
          state.copyWith(
            error: inviteDetail.error!,
            loading: '',
          ),
        );
        return;
      }

      final networkServerId = NetworkIdentity(
        hostname: state.hostname!,
        name: (state.name == null) ? serverId.result!.name : state.name!,
        kind: (state.kind == null) ? serverId.result!.kind : state.kind!,
        serverPubkey: (state.serverPubkey == null)
            ? serverId.result!.pubkey
            : state.serverPubkey!,
        username: state.username,
        inviteCode: state.inviteCode,
        inviteCount: inviteDetail.result!.count,
      );

      await updateServerIdStorage(networkServerId);
      await load();

      emit(
        state.copyWith(
          joined: true,
        ),
      );
    } catch (e, s) {
      _logger.logException(e, 'NetworksCubit.join', s);
    }
  }

  Future<void> resyncExistingUser() async {}
  Future<void> updateServerIdStorage(NetworkIdentity serverId) async {
    try {
      final savedid = await _storage.saveItem<NetworkIdentity>(
        StoreKeys.Networks.name,
        serverId,
      );
      if (savedid.hasError) {
        emit(
          state.copyWith(
            error: couldNotSaveError,
            loading: '',
          ),
        );
        return;
      }
      final id = savedid.result!;
      final newId = serverId.copyWith(id: id);
      await _storage.saveItemAt<NetworkIdentity>(
        StoreKeys.Networks.name,
        id,
        newId,
      );
    } catch (e, s) {
      _logger.logException(e, 'NetworksCubit.updateServerIdStorage', s);
    }
  }

  void clear() => emit(
        NetworksState(
          networks: state.networks,
          loading: '',
          joined: false,
        ),
      );
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

R<InvitationDetail> joinHostServer(dynamic data) {
  final obj = data as Map<String, String?>;
  final resp = LibCypherpost().joinServer(
    hostname: obj['hostname']!,
    socks5: int.parse(obj['socks5']!),
    socialRoot: obj['socialRoot']!,
    username: obj['username']!,
    inviteCode: obj['inviteCode']!,
  );
  return resp;
}
