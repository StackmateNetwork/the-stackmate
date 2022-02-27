import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/reddit.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/model/reddit-post.dart';
import 'package:sats/pkg/launcher.dart';
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
    this._logger,
    this._launcher,
    // this._storage,
  ) : super(const RedditState()) {
    getPosts();
  }

  final IRedditAPI _reddit;
  final LoggerCubit _logger;
  final ILauncher _launcher;
  // final IStorage _storage;

  void getPosts() async {
    try {
      // final storedPosts =
      //     _storage.getAll<RedditPost>(StoreKeys.RedditPost.name);
      // if (storedPosts.length > 0) {
      //   emit(state.copyWith(posts: storedPosts, loading: false));
      //   return;
      // }

      emit(state.copyWith(loading: true, error: ''));
      final response = await _reddit.fetchPosts('bitcoin');
      if (response.data == null || response.statusCode != 200) throw '';

      final posts = await compute(_parsePosts, response.data);

      emit(state.copyWith(posts: posts, loading: false));

      // for (final p in posts) _storage.saveItem(StoreKeys.RedditPost.name, p);
    } catch (e, s) {
      _logger.logException(e, 'RedditBloc._mapGetPostsToState', s);
      emit(state.copyWith(loading: false, error: 'Error Occured.'));
    }
  }

  void openPostLink(RedditPost post) {
    try {
      _launcher.launchApp(post.link());
    } catch (e, s) {
      _logger.logException(e, 'FeedItem._linkClicked', s);
    }
  }

  void openLink(String link) {
    try {
      _launcher.launchApp(link);
    } catch (e, s) {
      _logger.logException(e, 'HomeInfoPage._openLink:' + link, s);
    }
  }
}

List<RedditPost> _parsePosts(dynamic body) {
  final List<RedditPost> posts = [];
  for (final post in body['data']['children'])
    posts.add(RedditPost.fromJson(post['data'] as Map<String, dynamic>));
  posts.removeWhere((post) => post.score < 100);

  return posts;
}
