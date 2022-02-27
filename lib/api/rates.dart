import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retry/retry.dart';
import 'package:sats/api/_helpers.dart';

const _apiKey = '0145a1f5-96ca-4ead-abd7-f82d52cba040';

abstract class IRatesAPI {
  Future<Response> getRate({required String symbol});
}

class RatesAPI implements IRatesAPI {
  @override
  Future<Response> getRate({required String symbol}) async {
    final path =
        'https://api.coincap.io/v2/markets?baseSymbol=BTC&quoteSymbol=$symbol&limit=2';

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

    return parseResponse(response);
  }
}
