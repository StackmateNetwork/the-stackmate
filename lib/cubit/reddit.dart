import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/interface/reddit.dart';
import 'package:sats/model/reddit-post.dart';
import 'package:sats/pkg/interface/launcher.dart';

// import 'package:sats/pkg/storage.dart';

part 'reddit.freezed.dart';

@freezed
class RedditState with _$RedditState {
  const factory RedditState({
    @Default([]) List<RedditPost> posts,
    @Default('') String error,
    @Default(false) bool loading,
  }) = _RedditState;
}

class RedditCubit extends Cubit<RedditState> {
  RedditCubit(
    this._reddit,
    this._launcher,
    // this._storage,
  ) : super(const RedditState()) {
    getPosts();
  }

  final IRedditAPI _reddit;
  final ILauncher _launcher;
  // final IStorage _storage;

  void getPosts() async {
    // final storedPosts =
    //     _storage.getAll<RedditPost>(StoreKeys.RedditPost.name);
    // if (storedPosts.length > 0) {
    //   emit(state.copyWith(posts: storedPosts, loading: false));
    //   return;
    // }

    emit(state.copyWith(loading: true, error: ''));
    final posts = await _reddit.fetchPosts('bitcoin');
    if (posts.hasError) {
      emit(state.copyWith(loading: false, error: posts.error!));
      return;
    }

    // final posts = await compute(_parsePosts, response.data);

    emit(state.copyWith(posts: posts.result!, loading: false));

    // for (final p in posts) _storage.saveItem(StoreKeys.RedditPost.name, p);
  }

  void openPostLink(RedditPost post) {
    _launcher.launchApp(post.link());
  }

  void openLink(String link) {
    _launcher.launchApp(link);
  }
}

// List<RedditPost> _parsePosts(dynamic body) {
//   final List<RedditPost> posts = [];
//   for (final post in body['data']['children'])
//     posts.add(RedditPost.fromJson(post['data'] as Map<String, dynamic>));
//   posts.removeWhere((post) => post.score < 100);

//   return posts;
// }
