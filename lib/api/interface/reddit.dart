import 'dart:async';

import 'package:dio/dio.dart';

abstract class IRedditAPI {
  Future<Response> fetchPosts(String topic);
}
