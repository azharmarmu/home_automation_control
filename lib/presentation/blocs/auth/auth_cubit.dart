import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:home_automation_control/domain/entities/request/signin_request_params.dart';
import 'package:home_automation_control/domain/entities/request/signup_request_params.dart';
import 'package:home_automation_control/domain/entities/response/app_error.dart';
import 'package:home_automation_control/domain/use_cases/signin_usecase.dart';
import 'package:home_automation_control/domain/use_cases/signup_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInUC _signinUC;
  final SignUpUC _signUpUC;

  AuthCubit(this._signinUC, this._signUpUC) : super(AuthInitialState());

  Future<Either<AppError, dynamic>> signIn(SignInRequestParams params) async {
    final response = await _signinUC(params);
    response.fold(
      (l) => emit(const UnauthenticatedState()),
      (r) => emit(AuthenticatedState()),
    );
    return response;
  }

  Future<Either<AppError, dynamic>> signUp(SignUpRequestParams params) async {
    final response = await _signUpUC(params);
    response.fold(
      (l) => emit(const UnauthenticatedState()),
      (r) => emit(AuthenticatedState()),
    );
    return response;
  }
}
