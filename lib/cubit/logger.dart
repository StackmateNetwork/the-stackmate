import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
//import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sats/api/logger.dart';
import 'package:sats/model/log.dart';
import 'package:sats/pkg/clipboard.dart';

part 'logger.freezed.dart';

@freezed
class LoggerState with _$LoggerState {
  const factory LoggerState({
    @Default([]) List<Log> logs,
  }) = _LoggerState;
}

class LoggerCubit extends Cubit<LoggerState> {
  LoggerCubit(
    this._clipBoard,
    this._logAPI,
  ) : super(const LoggerState());

  final IClipBoard _clipBoard;
  final ILogAPI _logAPI;

  void logAPI(
    String path,
    String response,
    int statusCode,
  ) async {
    try {
      final log = Log(
        type: LogType.api,
        path: path,
        response: response,
        statusCode: statusCode.toString(),
      );

      _addToLog(log);
    } catch (e) {
      print(e.toString());
    }
  }

  void logEvent(String event) async {
    try {
      final strs = event.split('.');
      final log = Log(
        type: LogType.event,
        bloc: strs[0],
        event: strs[1],
      );

      await Future.delayed(const Duration(milliseconds: 5));

      _addToLog(log);
    } catch (e) {
      print(e.toString());
    }
  }

  void logException(
    dynamic e,
    String source,
    dynamic s,
  ) async {
    try {
      final log = Log(
        type: LogType.exception,
        exceptionSource: source,
        exceptionType: e.toString(),
        stackTrace: (s as StackTrace).toString(),
      );

      print(
        '\n\nERROR @ ' +
            log.exceptionSource! +
            '\nMessage: ' +
            log.exceptionType! +
            '\nTrace: ' +
            log.stackTrace! +
            '\n\n',
      );

      _addToLog(log);

      //await Sentry.captureException(
      //  event.e,
      //  stackTrace: event.s,
      //  hint: event.source,
      //);
    } catch (e) {
      print(e.toString());
    }
  }

  void copyToClipboard(String text) {
    _clipBoard.copyToClipBoard(text);
    showToast('COPIED');
  }

  void _addToLog(Log log) {
    final List<Log> logs = state.logs.toList();
    logs.add(log);
    emit(state.copyWith(logs: logs));
    _logAPI.log(log.toString());
  }
}
