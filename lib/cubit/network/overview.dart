import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libcpclient/cpclient.dart';
import 'package:sats/api/interface/cpsocket.dart';
import 'package:sats/api/libcp.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/social-root.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/model/network-chat-history.dart';
import 'package:sats/model/network-chats.dart';
import 'package:sats/model/network-identity.dart';
import 'package:sats/model/network-members.dart';
import 'package:sats/model/network-posts-index.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';
import 'package:web_socket_channel/io.dart';

part 'overview.freezed.dart';

const couldNotSaveError = 'Error Save Network!';

@freezed
class OverviewState with _$OverviewState {
  const factory OverviewState({
    required NetworkIdentity network,
    String? pubkey,
    @Default(false) bool connectingSocket,
    @Default(false) bool socketConnected,
    @Default(false) bool showInfo,
    @Default('') String error,
    @Default('') String loading,
    @Default('') String displayedInviteSecret,
    @Default(0) int latestGenesis,
    @Default([]) List<String> corrupted,
    @Default('') String counterParty,
    @Default([]) List<Verified> verifiedPosts,
    @Default([]) List<MemberIdentity> members,
    @Default('') String streamNonce,
    @Default('') String streamPubkey,
    @Default('') String streamSignature,
  }) = _OverviewState;

  const OverviewState._();
}

class OverviewCubit extends Cubit<OverviewState> {
  OverviewCubit(
    this._storage,
    this._logger,
    this._clipBoard,
    this._cpStream,
    this._torCubit,
    this._socialRoot,
    NetworkIdentity network,
  ) : super(OverviewState(network: network)) {
    load();
    loadSocket();
  }

  final IStorage _storage;
  final Logger _logger;
  final TorCubit _torCubit;
  final SocialRootCubit _socialRoot;
  final IClipBoard _clipBoard;
  final ICPSocket _cpStream;

  void load() {
    try {
      emit(
        state.copyWith(
          loading: 'fromStorage',
        ),
      );

      final chats = _storage.getAll<NetworkChats>(StoreKeys.NetworkChats.name);
      if (chats.hasError) return;

      final List<Verified> verifiedPosts = chats.result!
          .map(
            (e) => Verified(
              counterParty: e.pubkey,
              posts: e.posts.map((p) => CompletePost.fromJson(p)).toList(),
            ),
          )
          .toList();

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

      emit(
        state.copyWith(
          verifiedPosts: verifiedPosts,
          latestGenesis: storedHistory.result!.latestGenesis,
          corrupted: storedHistory.result!.corruptedPostIds,
          members: storedMembers.result!.members,
          loading: '',
        ),
      );
    } catch (e, s) {
      _logger.logException(e, 'OverviewCubit.load', s);
    }
  }

  void loadSocket() {
    emit(
      state.copyWith(
        connectingSocket: true,
        error: '',
      ),
    );

    createStreamHeaders();

    final Map<String, String> headers = {
      'x-nonce': state.streamNonce,
      'x-client-pubkey': state.streamPubkey,
      'x-client-signature': state.streamSignature,
    };

    _cpStream.connect(
      host: state.network.hostname,
      headers: headers,
      connectEvent: onConnectEvent,
      messageEvent: onMessageEvent,
      disconnectEvent: onDisconnectEvent,
    );
    emit(
      state.copyWith(
        connectingSocket: false,
        socketConnected: true,
        error: '',
      ),
    );
  }

  void onConnectEvent(dynamic data) {
    emit(state.copyWith(socketConnected: true));
  }

  void onDisconnectEvent() {
    emit(state.copyWith(socketConnected: false));
  }

  void onMessageEvent(dynamic data) async {
    try {
      print(data.toString());
      await fetchAllPosts();
      load();
    } catch (e, s) {
      _logger.logException(e, 'OverviewCubit.onMessageEvent', s);
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

    allVerifiedPosts.map(
      (e) async {
        final chats = NetworkChats(
          id: state.network.id!,
          pubkey: e.counterParty!,
          username: usernameByPubkey(e.counterParty!)!.username!,
          posts: e.posts!.map((e) => e.toJson()).toList(),
        );
        await updateNetworkChats(chats, e.counterParty!);
      },
    ).toList();

    final lastGenesis = (sorted.result!.latestGenesis == 0)
        ? state.latestGenesis
        : sorted.result!.latestGenesis! + 1;

    final history = NetworkChatHistory(
      id: state.network.id,
      latestGenesis: lastGenesis,
      corruptedPostIds: sorted.result!.corrupted! + state.corrupted,
    );
    await updateNetworkHistory(history);
    load();
  }

  void removeDuplicatePosts() {}

  Future<void> updateNetworkChats(NetworkChats chats, String index) async {
    try {
      final status = await _storage.saveItemAtIndex<NetworkChats>(
        StoreKeys.NetworkChats.name,
        index,
        chats,
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

  Future<void> updateNetworkHistory(NetworkChatHistory history) async {
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

  void selectCounterParty(String counterParty) {
    emit(
      state.copyWith(
        counterParty: counterParty,
      ),
    );
  }

  void copyInviteCode() {
    _clipBoard.copyToClipBoard(state.displayedInviteSecret);
  }

  void createStreamHeaders() {
    final headerValues = LibCypherpost().streamHeaders(
      socialRoot: _socialRoot.state.key!.xprv,
    );
    emit(
      state.copyWith(
        streamNonce: headerValues.result!.nonce,
        streamPubkey: headerValues.result!.pubkey,
        streamSignature: headerValues.result!.signature,
      ),
    );
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
