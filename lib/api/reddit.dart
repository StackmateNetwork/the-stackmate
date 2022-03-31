import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retry/retry.dart';
import 'package:sats/api/_helpers.dart';
import 'package:sats/api/interface/reddit.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/model/reddit-post.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/_locator.dart';

class RedditAPI implements IRedditAPI {
  @override
  Future<R<List<RedditPost>>> fetchPosts(String topic) async {
    try {
      final path = 'https://www.reddit.com/r/$topic/hot.json';

      final response = await retry(
        () => client
            // .get(path)
            .get(
              path,
              options: Options(
                validateStatus: (status) => true,
              ),
            )
            .timeout(timeOut),
        retryIf: (e) => e is SocketException || e is TimeoutException,
        maxAttempts: 3,
      );

      checkAPIStatus(response);

      final data = response.data;
      final List<RedditPost> posts = [];
      for (final post in data['data']['children'])
        posts.add(RedditPost.fromJson(post['data'] as Map<String, dynamic>));
      posts.removeWhere((post) => post.score < 100);

      return R(result: posts);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }
}

final c = HttpClient();
