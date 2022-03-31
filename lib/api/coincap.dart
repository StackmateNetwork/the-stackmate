import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retry/retry.dart';
import 'package:sats/api/_helpers.dart';
import 'package:sats/api/interface/coincap.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/_locator.dart';

const _apiKey = '0145a1f5-96ca-4ead-abd7-f82d52cba040';

class RatesAPI implements IRatesAPI {
  @override
  Future<R<double>> getRate({required String symbol}) async {
    try {
      final path = 'https://api.coincap.io/v2/markets?baseSymbol=BTC&quoteSymbol=$symbol&limit=2';

      final response = await retry(
        () => client
            .get(
              path,
              options: Options(
                headers: {
                  'Authorization': 'Bearer $_apiKey',
                  'Accept-Encoding': 'gzip, deflate, br',
                },
                validateStatus: (status) => true,
              ),
            )
            .timeout(timeOut),
        retryIf: (e) => e is SocketException || e is TimeoutException,
        maxAttempts: 3,
      );

      checkAPIStatus(response);

      final rate = response.data['data'][0]['priceQuote'] as String;

      return R(result: double.parse(rate));
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }
}
