import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:home_automation_control/core/app_log.dart';

class LogUC {
  final String packageDetails;

  LogUC(this.packageDetails);

  Future<void> log({
    required String logMessage,
    required LogLevel logLevel,
    dynamic data,
  }) async {
    if (kDebugMode) {
      if (data == null) {
        developer.log(logMessage, name: packageDetails);
      } else {
        developer.log('$logMessage, data: $data', name: packageDetails);
      }
    }
  }
}
