import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'log.freezed.dart';
part 'log.g.dart';

enum LogType { api, event, exception }

@freezed
class Log with _$Log {
  const factory Log({
    required LogType type,
    String? path,
    String? response,
    String? statusCode,
    String? bloc,
    String? event,
    String? exceptionType,
    String? exceptionSource,
    String? stackTrace,
  }) = _Log;

  factory Log.fromJson(Map<String, dynamic> json) => _$LogFromJson(json);
}
