import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_automation_control/core/app_assets.dart';
import 'package:home_automation_control/core/app_screen_utils.dart';
import 'package:home_automation_control/core/app_strings.dart';
import 'package:home_automation_control/domain/entities/request/signup_request_params.dart';
import 'package:home_automation_control/presentation/blocs/auth/form_validation_cubit/form_validation_cubit.dart';
import 'package:home_automation_control/presentation/ui/__shared/widgets/app_button.dart';
import 'package:home_automation_control/presentation/ui/__shared/widgets/app_textfield.dart';

class SignUpBottomWidget extends StatelessWidget {
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();

  final _userFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();

  final SignUpRequestParams _requestParams = SignUpRequestParams();

  @override
  Widget build(BuildContext context) {
    final FormValidationCubit _formValidationCubit =
        BlocProvider.of<FormValidationCubit>(context);
    return Column(
      children: [
        SizedBox(height: 16.h),
        BlocBuilder<FormValidationCubit, FormValidationState>(
          builder: (_, state) {
            String? errorText;
            if (state is NameErrorState) {
              errorText = state.error;
              _userFocusNode.requestFocus();
            }
            return AppTextFormField(
              controller: _usernameCtrl,
              focusNode: _userFocusNode,
              hintText: AppStrings.username,
              autofocus: true,
              prefixIcon: AppAssets.userIcon,
              errorText: errorText,
              onChanged: (String val) {
                _requestParams.username = val;
                _formValidationCubit.validateOnName(val);
              },
            );
          },
        ),
        BlocBuilder<FormValidationCubit, FormValidationState>(
          builder: (_, state) {
            String? errorText;
            if (state is PasswordErrorState) {
              errorText = state.error;
              _userFocusNode.requestFocus();
            }
            return AppTextFormField(
              controller: _passwordCtrl,
              focusNode: _passwordFocusNode,
              hintText: AppStrings.password,
              prefixIcon: AppAssets.lockIcon,
              obscureText: true,
              errorText: errorText,
              onChanged: (String val) {
                _requestParams.password = val;
                _formValidationCubit.validateOnPassword(val);
              },
            );
          },
        ),
        BlocBuilder<FormValidationCubit, FormValidationState>(
          builder: (_, state) {
            String? errorText;
            if (state is EmailErrorState) {
              errorText = state.error;
              _userFocusNode.requestFocus();
            }
            return AppTextFormField(
              controller: _emailCtrl,
              focusNode: _emailFocusNode,
              hintText: AppStrings.email,
              prefixIcon: AppAssets.mailIcon,
              errorText: errorText,
              onChanged: (String val) {
                _requestParams.email = val;
                _formValidationCubit.validateOnEmailChange(val);
              },
            );
          },
        ),
        SizedBox(height: 48.h),
        AppPrimaryButton(
          label: AppStrings.signUp,
          onPressed: () => _formValidationCubit.validateOnSignUpButtonClick(
            _requestParams,
          ),
        ),
      ],
    );
  }
}
