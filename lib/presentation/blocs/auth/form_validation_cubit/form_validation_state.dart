part of 'form_validation_cubit.dart';

abstract class FormValidationState extends Equatable {
  const FormValidationState();

  @override
  List<Object> get props => [];
}

class InitialState extends FormValidationState {}

class LoadingState extends FormValidationState {}

class EmailErrorState extends FormValidationState {
  final String error;

  const EmailErrorState({required this.error});
}

class ConfirmEmailErrorState extends FormValidationState {
  final String error;

  const ConfirmEmailErrorState({required this.error});
}

class PasswordErrorState extends FormValidationState {
  final String error;

  const PasswordErrorState({required this.error});
}

class FullNameErrorState extends FormValidationState {
  final String error;

  const FullNameErrorState({required this.error});
}

class ConfirmPasswordErrorState extends FormValidationState {
  final String error;

  const ConfirmPasswordErrorState({required this.error});
}

class OTPErrorState extends FormValidationState {
  final String error;

  const OTPErrorState({required this.error});
}

class NameErrorState extends FormValidationState {
  final String error;

  const NameErrorState({required this.error});
}

class SuccessState extends FormValidationState {}

class ErrorState extends FormValidationState {
  final String? error;

  const ErrorState({this.error});
}

class CardNumberErrorState extends FormValidationState {
  final String error;

  const CardNumberErrorState({required this.error});
}

class ExpiryDateErrorState extends FormValidationState {
  final String error;

  const ExpiryDateErrorState({required this.error});
}

class CardCvvErrorState extends FormValidationState {
  final String error;

  const CardCvvErrorState({required this.error});
}
