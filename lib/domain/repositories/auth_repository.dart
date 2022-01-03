import 'package:dartz/dartz.dart';
import 'package:home_automation_control/domain/entities/response/app_error.dart';
import 'package:home_automation_control/domain/entities/response/user_entity.dart';

abstract class AuthRepository {
  Future<Either<AppError, UserEntity>> signin(Map<String, dynamic> params);

  Future<Either<AppError, UserEntity>> signup(Map<String, dynamic> params);
}
