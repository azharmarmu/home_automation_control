import 'package:home_automation_control/domain/use_cases/log_usecase.dart';
import 'di/dependency_injection.dart';

enum LogLevel { error, info, warn, debug, trace }

class Log {
  static void e(String logMessage, {Map<String, dynamic>? data}) {
    getItInstance<LogUC>().log(
      logLevel: LogLevel.error,
      logMessage: logMessage,
      data: data,
    );
  }

  static void w(String logMessage, {Map<String, dynamic>? data}) {
    getItInstance<LogUC>().log(
      logLevel: LogLevel.warn,
      logMessage: logMessage,
      data: data,
    );
  }

  static void i(String logMessage, {Map<String, dynamic>? data}) {
    getItInstance<LogUC>().log(
      logLevel: LogLevel.info,
      logMessage: logMessage,
      data: data,
    );
  }

  static void d(String logMessage, {Map<String, dynamic>? data}) {
    getItInstance<LogUC>().log(
      logLevel: LogLevel.debug,
      logMessage: logMessage,
      data: data,
    );
  }
}
