import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:home_automation_control/core/app_log.dart';
import 'package:home_automation_control/core/app_strings.dart';
import 'package:home_automation_control/core/extensions/common_extension.dart';
import 'package:home_automation_control/domain/entities/request/signin_request_params.dart';
import 'package:home_automation_control/domain/entities/request/signup_request_params.dart';
import 'package:home_automation_control/domain/entities/response/app_error.dart';
import 'package:home_automation_control/presentation/blocs/auth/auth_cubit.dart';

part 'form_validation_state.dart';

class FormValidationCubit extends Cubit<FormValidationState> {
  final AuthCubit _authCubit;

  FormValidationCubit(this._authCubit) : super(InitialState());

  bool showError = false;

  Future<void> validateOnEmailChange(String email) async {
    emit(InitialState());
    if (showError) {
      if (!email.isValidEmail()) {
        emit(const EmailErrorState(error: ''));
      }
    }
  }

  Future<void> validateOnName(String name) async {
    emit(InitialState());
    if (showError) {
      if (!name.isValidName()) {
        emit(const NameErrorState(error: ''));
      }
    }
  }

  Future<void> validateOnPassword(String password) async {
    emit(InitialState());
    if (showError) {
      if (!password.isValidPassword()) {
        emit(const PasswordErrorState(error: ''));
      }
    }
  }

  Future<void> validateOnConfirmPass(
      String password, String confirmPassword) async {
    emit(InitialState());
    if (showError) {
      if (!(password.isValidPassword() &&
          (password.toLowerCase() == confirmPassword.toLowerCase()))) {
        emit(const ConfirmPasswordErrorState(error: ''));
      }
    }
  }

  Future<void> validateOnSignInButtonClick(SignInRequestParams params) async {
    showError = true;
    emit(LoadingState());
    if (showError) {
      if (!params.username.isValidName()) {
        emit(const NameErrorState(error: AppStrings.inValidName));
      } else if (!params.password.isValidPassword()) {
        emit(const PasswordErrorState(error: AppStrings.inValidPassword));
      } else {
        final Either<AppError, dynamic> response =
            await _authCubit.signIn(params);
        Log.d('validateOnSignInButtonClick: $response');
        emit(response.fold(
          (l) => ErrorState(error: l.error),
          (r) => SuccessState(),
        ));
      }
    }
  }

  Future<void> validateOnSignUpButtonClick(SignUpRequestParams params) async {
    showError = true;
    emit(LoadingState());
    if (showError) {
      if (!params.username.isValidName()) {
        emit(const NameErrorState(error: AppStrings.inValidName));
      } else if (!params.password.isValidPassword()) {
        emit(const PasswordErrorState(error: AppStrings.inValidPassword));
      } else if (!params.email.isValidEmail()) {
        emit(const EmailErrorState(error: AppStrings.inValidEmail));
      } else {
        final Either<AppError, dynamic> response =
            await _authCubit.signUp(params);
        emit(response.fold(
          (l) => ErrorState(error: l.error),
          (r) => SuccessState(),
        ));
      }
    }
  }
}
