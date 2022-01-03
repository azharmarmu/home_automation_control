import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_automation_control/core/app_log.dart';
import 'package:home_automation_control/presentation/blocs/auth/form_validation_cubit/form_validation_cubit.dart';

class AuthTemplate extends StatelessWidget {
  final FormValidationCubit formValidationCubit;
  final Function() onSuccess;
  final Function(String?) onError;
  final Widget child;

  const AuthTemplate(
    this.formValidationCubit, {
    required this.onSuccess,
    required this.onError,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          formValidationCubit.emit(InitialState());
          FocusScope.of(context).unfocus();
        },
        child: BlocProvider.value(
          value: formValidationCubit,
          child: BlocListener<FormValidationCubit, FormValidationState>(
            bloc: formValidationCubit,
            listener: (_, state) {
              Log.d('Auth-Template: $state');
              if (state is SuccessState) {
                onSuccess();
              } else if (state is ErrorState) {
                onError(state.error);
              }
            },
            child: child,
          ),
        ),
      ),
    );
  }
}
