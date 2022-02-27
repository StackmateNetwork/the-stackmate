import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retry/retry.dart';
import 'package:sats/api/_helpers.dart';

abstract class IRedditAPI {
  Future<Response> fetchPosts(String topic);
}

class RedditAPI implements IRedditAPI {
  @override
  Future<Response> fetchPosts(String topic) async {
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

    return parseResponse(response);
  }
}

final c = HttpClient();
