import 'dart:async';
import 'package:sats/model/result.dart';

abstract class IRatesAPI {
  Future<R<double>> getRate({required String symbol});
}
