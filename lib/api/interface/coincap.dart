import 'dart:async';

import 'package:dio/dio.dart';

abstract class IRatesAPI {
  Future<Response> getRate({required String symbol});
}
