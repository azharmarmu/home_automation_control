import 'package:home_automation_control/domain/entities/response/app_error.dart';

import '../app_log.dart';

class UnauthorisedException implements Exception {
  final String error;

  UnauthorisedException(this.error);
}

class SQLiteException implements Exception {
  final String error;

  SQLiteException(this.error) {
    Log.d('DatabaseException: $error');
  }
}

AppError filterException(e) {
  Log.d('filterException: ${e.runtimeType}, e: $e');
  switch (e.runtimeType) {
    case UnauthorisedException:
      return AppError(
        AppErrorType.unauthorised,
        error: e.error.toString(),
      );
    case SQLiteException:
      return AppError(
        AppErrorType.database,
        error: e.error.toString(),
      );
    default:
      return AppError(
        AppErrorType.database,
        error: e.error.toString(),
      );
  }
}
