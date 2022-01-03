import 'package:dartz/dartz.dart';
import 'package:home_automation_control/core/exceptions/exception_handling.dart';
import 'package:home_automation_control/data/data_sources/auth_data_source.dart';
import 'package:home_automation_control/data/models/user_model.dart';
import 'package:home_automation_control/domain/entities/response/app_error.dart';
import 'package:home_automation_control/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<Either<AppError, UserModel>> signin(
    Map<String, dynamic> params,
  ) async {
    try {
      return Right(await _dataSource.signin(params));
    } catch (e) {
      return Left(filterException(e));
    }
  }

  @override
  Future<Either<AppError, UserModel>> signup(
    Map<String, dynamic> params,
  ) async {
    try {
      return Right(await _dataSource.signup(params));
    } catch (e) {
      return Left(filterException(e));
    }
  }
}
