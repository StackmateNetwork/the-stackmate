import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:sats/cubit/_state.dart';

final client = Dio(BaseOptions(validateStatus: (status) => true));

Response parseResponse(Response res) {
  try {
    loggerCubit.logAPI(
      res.requestOptions.path,
      jsonEncode(res.data),
      res.statusCode!,
    );

    // if (res.statusCode == 401) userCubit.logOut();
  } catch (e, s) {
    loggerCubit.logException(e, 'api.logresponse', s);
  }

  return res;
}

const timeOut = Duration(seconds: 5);
