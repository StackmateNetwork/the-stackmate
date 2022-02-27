import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:sats/cubit/_state.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/pkg/_deps.dart';

final client = Dio(BaseOptions(validateStatus: (status) => true));

Response parseResponse(Response res) {
  try {
    locator<LoggerCubit>().logAPI(
      res.requestOptions.path,
      jsonEncode(res.data),
      res.statusCode!,
    );

    // if (res.statusCode == 401) userCubit.logOut();
  } catch (e, s) {
    locator<LoggerCubit>().logException(e, 'api.logresponse', s);
  }

  return res;
}

const timeOut = Duration(seconds: 5);
