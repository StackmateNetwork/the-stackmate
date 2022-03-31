import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/pkg/_locator.dart';

final client = Dio(BaseOptions(validateStatus: (status) => true));

Response parseResponse(Response res) {
  try {
    locator<Logger>().logAPI(
      res.requestOptions.path,
      jsonEncode(res.data),
      res.statusCode!,
    );

    // if (res.statusCode == 401) userCubit.logOut();
  } catch (e, s) {
    locator<Logger>().logException(e, 'api.logresponse', s);
  }

  return res;
}

const timeOut = Duration(seconds: 5);

void checkAPIStatus(Response response) {
  final statusCode = response.statusCode;
  if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
    // locator<UserCubit>().logOut();
    throw 'Unauthorised';
  }
  if (statusCode == 500) throw 'Error Occured. Try Again';
  if (statusCode != 200) throw response.data.toString();
}
