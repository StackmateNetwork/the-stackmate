import 'dart:async';

import 'package:dio/dio.dart';
import 'package:sats/model/reddit-post.dart';
import 'package:sats/model/result.dart';

abstract class IRedditAPI {
  Future<R<List<RedditPost>>> fetchPosts(String topic);
}
