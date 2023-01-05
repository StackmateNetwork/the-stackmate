import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libcpclient/cpclient.dart';
import 'package:sats/api/libcp.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/social-root.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/model/network-chat-history.dart';
import 'package:sats/model/network-identity.dart';
import 'package:sats/model/network-members.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'overview.freezed.dart';

const couldNotSaveError = 'Error Save Network!';

@freezed
class OverviewState with _$OverviewState {
  const factory OverviewState({
    required NetworkIdentity network,
    String? pubkey,
    @Default(false) bool showInfo,
    @Default('') String error,
    @Default('') String loading,
    @Default('') String displayedInviteSecret,
    @Default(0) int latestGenesis,
    @Default([]) List<Verified> verifiedPosts,
    @Default([]) List<String> corruptedPostIds,
    @Default([]) List<MemberIdentity> members,
  }) = _OverviewState;

  const OverviewState._();
}

class OverviewCubit extends Cubit<OverviewState> {
  OverviewCubit(
    this._storage,
    this._logger,
    this._clipBoard,
    this._torCubit,
    this._socialRoot,
    NetworkIdentity network,
  ) : super(OverviewState(network: network)) {
    load();
  }

  final IStorage _storage;
  final Logger _logger;
  final TorCubit _torCubit;
  final SocialRootCubit _socialRoot;
  final IClipBoard _clipBoard;

  Future<void> load() async {
    try {
      emit(
        state.copyWith(
          loading: 'fromStorage',
        ),
      );
      final storedHistory = _storage.getItem<NetworkChatHistory>(
        StoreKeys.ChatHistory.name,
        state.network.id!,
      );
      if (storedHistory.hasError) return;

      final storedMembers = _storage.getItem<NetworkMembers>(
        StoreKeys.Members.name,
        state.network.id!,
      );
      if (storedMembers.hasError) return;
      await Future.delayed(const Duration(milliseconds: 300));

      emit(
        state.copyWith(
          verifiedPosts: storedHistory.result!.verifiedPosts
              .map((e) => Verified.fromJson(e))
              .toList(),
          corruptedPostIds: storedHistory.result!.corruptedPostIds,
          latestGenesis: storedHistory.result!.latestGenesis,
          members: storedMembers.result!.members,
          loading: '',
        ),
      );
    } catch (e, s) {
      _logger.logException(e, 'OverviewCubit.load', s);
    }
  }

  MemberIdentity? usernameByPubkey(String pubkey) {
    return state.members.firstWhere(
      (m) => m.pubkey == pubkey,
      orElse: () => MemberIdentity(
        username: '*notfound*',
        pubkey: pubkey,
      ),
    );
  }

  Future<void> generateInvite() async {
    try {
      emit(
        state.copyWith(
          error: '',
          loading: 'inviting',
        ),
      );

      final socks5 = _torCubit.state.socks5Port;
      final socialRoot = _socialRoot.state.key!.xprv;

      final inviteSecret = await compute(getInvite, {
        'hostname': 'https://' + state.network.hostname,
        'socks5': socks5.toString(),
        'socialRoot': socialRoot,
        'inviteCode': state.network.inviteCode,
      });

      if (inviteSecret.hasError) {
        emit(
          state.copyWith(
            error: inviteSecret.error!,
            loading: '',
          ),
        );
        return;
      }

      final networkServerId = NetworkIdentity(
        id: state.network.id,
        hostname: state.network.hostname,
        name: state.network.name,
        kind: state.network.kind,
        serverPubkey: state.network.serverPubkey,
        username: state.network.username,
        inviteCode: state.network.inviteCode,
        inviteCount: state.network.inviteCount - 1,
        lastInviteSecret: inviteSecret.result!.inviteCode,
      );

      await updateServerIdStorage(networkServerId);

      emit(
        state.copyWith(
          displayedInviteSecret: inviteSecret.result!.inviteCode,
          network: networkServerId,
          loading: '',
        ),
      );
    } catch (e, s) {
      _logger.logException(e, 'OverviewCubit.genInvite', s);
    }
  }

  Future<void> leaveNetwork() async {
    try {
      emit(
        state.copyWith(
          loading: 'leaving',
          error: '',
        ),
      );
      final socks5 = _torCubit.state.socks5Port;
      final socialRoot = _socialRoot.state.key!.xprv;

      final status = await compute(leave, {
        'hostname': 'https://' + state.network.hostname,
        'socks5': socks5.toString(),
        'socialRoot': socialRoot,
      });

      if (status.hasError) {
        emit(
          state.copyWith(
            error: status.error!,
            loading: '',
          ),
        );
        return;
      }

      purgeServerModels();

      emit(
        state.copyWith(
          loading: '',
        ),
      );
    } catch (e, s) {
      _logger.logException(e, 'OverviewCubit.leave', s);
    }
  }

  Future<void> updateServerIdStorage(NetworkIdentity serverId) async {
    try {
      final status = await _storage.saveItemAt<NetworkIdentity>(
        StoreKeys.Networks.name,
        serverId.id!,
        serverId,
      );
      if (status.hasError) {
        emit(
          state.copyWith(
            error: couldNotSaveError,
            loading: '',
          ),
        );
        return;
      }
    } catch (e, s) {
      _logger.logException(e, 'OverviewCubit.updateServerIdStorage', s);
    }
  }

  Future<void> fetchAllPosts() async {
    emit(
      state.copyWith(
        loading: 'fetching',
        error: '',
      ),
    );
    final socks5 = _torCubit.state.socks5Port;
    final socialRoot = _socialRoot.state.key!.xprv;

    final sorted = await compute(getPosts, {
      'hostname': 'https://' + state.network.hostname,
      'socks5': socks5.toString(),
      'socialRoot': socialRoot,
      'genesisFilter': state.latestGenesis.toString(),
    });

    if (sorted.hasError) {
      emit(
        state.copyWith(
          error: sorted.error!,
          loading: '',
        ),
      );
      return;
    }

    final allVerifiedPosts = state.verifiedPosts + sorted.result!.verified!;

    final history = NetworkChatHistory(
      verifiedPosts: allVerifiedPosts.map((e) => e.toJson()).toList(),
      latestGenesis: sorted.result!.latestGenesis! + 1,
      corruptedPostIds: state.corruptedPostIds + sorted.result!.corrupted!,
    );

    await updateNetworkPosts(history);
    await load();
    emit(
      state.copyWith(
        loading: '',
      ),
    );
  }

  void removeDuplicatePosts() {}

  Future<void> updateNetworkPosts(NetworkChatHistory history) async {
    try {
      final status = await _storage.saveItemAt<NetworkChatHistory>(
        StoreKeys.ChatHistory.name,
        state.network.id!,
        history,
      );
      if (status.hasError) {
        emit(
          state.copyWith(
            error: couldNotSaveError,
            loading: '',
          ),
        );
        return;
      }
    } catch (e, s) {
      _logger.logException(e, 'OverviewCubit.load', s);
    }
  }

  void purgeServerModels() {
    try {
      final status = _storage.deleteItemAt<NetworkIdentity>(
        StoreKeys.Networks.name,
        state.network.id!,
      );
      if (status.hasError) {
        emit(
          state.copyWith(
            error: 'Could not delete Network Identity Model',
            loading: '',
          ),
        );
        return;
      }
    } catch (e, s) {
      _logger.logException(e, 'OverviewCubit.purgeServerModels', s);
    }
  }

  void toggleShowInfo() {
    emit(
      state.copyWith(
        showInfo: !state.showInfo,
      ),
    );
  }

  void copyInviteCode() {
    _clipBoard.copyToClipBoard(state.displayedInviteSecret);
  }
}

R<Invitation> getInvite(dynamic data) {
  final obj = data as Map<String, String?>;
  final resp = LibCypherpost().privUserInvite(
    hostname: obj['hostname']!,
    socks5: int.parse(obj['socks5']!),
    socialRoot: obj['socialRoot']!,
    inviteCode: obj['inviteCode']!,
  );
  return resp;
}

R<ServerStatus> leave(dynamic data) {
  final obj = data as Map<String, String?>;
  final resp = LibCypherpost().leaveServer(
    hostname: obj['hostname']!,
    socks5: int.parse(obj['socks5']!),
    socialRoot: obj['socialRoot']!,
  );
  return resp;
}

R<SortedPosts> getPosts(dynamic data) {
  final obj = data as Map<String, String?>;
  final resp = LibCypherpost().getAllPosts(
    hostname: obj['hostname']!,
    socks5: int.parse(obj['socks5']!),
    socialRoot: obj['socialRoot']!,
    genesisFilter: int.parse(obj['genesisFilter']!),
  );
  return resp;
}
