import 'package:dartz/dartz.dart';
import 'package:home_automation_control/domain/entities/response/app_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}

abstract class UseCase2<Type, Params> {
  Future<Type> call(Params params);
}
