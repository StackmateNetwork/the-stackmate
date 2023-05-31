import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sats/api/interface/logger.dart';
import 'package:sats/model/log.dart';
import 'package:sats/pkg/interface/clipboard.dart';

part 'logger.freezed.dart';

@freezed
class LoggerState with _$LoggerState {
  const factory LoggerState({
    @Default([]) List<Log> logs,
  }) = _LoggerState;
}

class Logger extends Cubit<LoggerState> {
  Logger(
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
      print(e);
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
      print(e);
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
      _addToLog(log);
    } catch (e) {
      print(e);
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
