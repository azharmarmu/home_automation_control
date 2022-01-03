import 'package:dartz/dartz.dart';
import 'package:home_automation_control/domain/entities/request/signup_request_params.dart';
import 'package:home_automation_control/domain/entities/response/app_error.dart';
import 'package:home_automation_control/domain/repositories/auth_repository.dart';

import '_use_case.dart';

class SignUpUC extends UseCase<dynamic, SignUpRequestParams> {
  final AuthRepository _repository;

  SignUpUC(this._repository);

  @override
  Future<Either<AppError, dynamic>> call(SignUpRequestParams params) async =>
      _repository.signup(params.toJson());
}
