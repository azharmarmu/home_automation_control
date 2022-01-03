import 'package:dartz/dartz.dart';
import 'package:home_automation_control/domain/entities/request/signin_request_params.dart';
import 'package:home_automation_control/domain/entities/response/app_error.dart';
import 'package:home_automation_control/domain/entities/response/user_entity.dart';
import 'package:home_automation_control/domain/repositories/auth_repository.dart';

import '_use_case.dart';

class SignInUC extends UseCase<UserEntity, SignInRequestParams> {
  final AuthRepository _repository;

  SignInUC(this._repository);

  @override
  Future<Either<AppError, UserEntity>> call(SignInRequestParams params) async =>
      _repository.signin(params.toJson());
}
