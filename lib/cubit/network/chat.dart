import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:libcpclient/cpclient.dart';
import 'package:sats/api/interface/cpsocket.dart';
import 'package:sats/api/libcp.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/network/overview.dart';
import 'package:sats/cubit/social-root.dart';
import 'package:sats/cubit/tor.dart';
import 'package:sats/model/network-chat-history.dart';
import 'package:sats/model/network-chats.dart';
import 'package:sats/model/network-identity.dart';
import 'package:sats/model/network-posts-index.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'chat.freezed.dart';

const couldNotSaveError = 'Error Save Network!';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    required NetworkIdentity network,
    required String counterParty,
    @Default([]) List<CompletePost> chatHistory,
    @Default('') String loading,
    @Default('') String error,
    @Default(0) int lastIndex,
  }) = _ChatState;

  const ChatState._();
}

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(
    this._storage,
    this._logger,
    this._clipBoard,
    this._cpStream,
    this._torCubit,
    this._socialRoot,
    OverviewCubit overviewCubit,
  ) : super(
          ChatState(
            network: overviewCubit.state.network,
            counterParty: overviewCubit.state.counterParty,
          ),
        ) {
    load();
  }

  final IStorage _storage;
  final Logger _logger;
  final TorCubit _torCubit;
  final SocialRootCubit _socialRoot;
  final IClipBoard _clipBoard;
  final ICPSocket _cpStream;

  Future<void> load() async {
    try {
      emit(
        state.copyWith(
          loading: 'fromStorage',
        ),
      );
      final chats = _storage.getItemAtIndex<NetworkChats>(
        StoreKeys.NetworkChats.name,
        state.counterParty,
      );
      if (chats.hasError) return;

      final List<CompletePost> history = chats.result!.posts
          .map(
            (e) => CompletePost.fromJson(e),
          )
          .toList();

      final storedIndex = _storage.getItem<NetworkPostsIndex>(
        StoreKeys.PostsIndex.name,
        state.network.id!,
      );

      if (storedIndex.hasError) return;

      emit(
        state.copyWith(
          chatHistory: history,
          lastIndex: (storedIndex.hasError) ? storedIndex.result!.lastIndex : 0,
        ),
      );
    } catch (e, s) {
      _logger.logException(e, 'OverviewCubit.load', s);
    }
  }

  // Verified? historyByCounterParty(List<Verified> allPosts) {
  //   return allPosts.firstWhere(
  //     (m) => m.counterParty == state.counterParty,
  //     orElse: () => Verified(
  //       counterParty: state.counterParty,
  //       posts: [],
  //     ),
  //   );
  // }

  Future<void> sendMessage(String text) async {
    emit(
      state.copyWith(
        loading: 'posting',
      ),
    );
    final socks5 = _torCubit.state.socks5Port;
    final socialRoot = _socialRoot.state.key!.xprv;

    final postId = await compute(post, {
      'hostname': 'https://' + state.network.hostname,
      'socks5': socks5.toString(),
      'socialRoot': socialRoot,
      'index': (state.lastIndex + 1).toString(),
      'to': 'direct:${state.counterParty}',
      'kind': 'message',
      'value': text,
    });

    if (postId.hasError) {
      emit(
        state.copyWith(
          error: postId.error!,
          loading: '',
        ),
      );
      return;
    }

    final index = NetworkPostsIndex(
      lastIndex: state.lastIndex,
    );
    await saveIndexToStorage(index);

    final status = await compute(sendKeys, {
      'hostname': 'https://' + state.network.hostname,
      'socks5': socks5.toString(),
      'socialRoot': socialRoot,
      'index': (state.lastIndex + 1).toString(),
      'postId': postId.result!.id,
      'recipients': state.counterParty,
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

    _cpStream.notify(postId.result!.id);
  }

  Future<void> saveIndexToStorage(NetworkPostsIndex index) async {
    try {
      final status = await _storage.saveItemAt<NetworkPostsIndex>(
        StoreKeys.PostsIndex.name,
        state.network.id!,
        index,
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
      await load();
    } catch (e, s) {
      _logger.logException(e, 'Discover.load', s);
    }
  }
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

R<PostId> post(dynamic data) {
  final obj = data as Map<String, String?>;
  final resp = LibCypherpost().sendPost(
    hostname: obj['hostname']!,
    socks5: int.parse(obj['socks5']!),
    socialRoot: obj['socialRoot']!,
    index: int.parse(obj['index']!),
    to: obj['to']!,
    kind: obj['kind']!,
    value: obj['value']!,
  );
  return resp;
}

R<ServerStatus> sendKeys(dynamic data) {
  final obj = data as Map<String, String?>;
  final resp = LibCypherpost().sendKeys(
    hostname: obj['hostname']!,
    socks5: int.parse(obj['socks5']!),
    socialRoot: obj['socialRoot']!,
    index: int.parse(obj['index']!),
    postId: obj['postId']!,
    recipients: obj['recipients']!,
  );
  return resp;
}
