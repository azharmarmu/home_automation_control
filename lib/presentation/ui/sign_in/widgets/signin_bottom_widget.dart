import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_automation_control/core/app_assets.dart';
import 'package:home_automation_control/core/app_routes.dart';
import 'package:home_automation_control/core/app_screen_utils.dart';
import 'package:home_automation_control/core/app_strings.dart';
import 'package:home_automation_control/core/app_theme.dart';
import 'package:home_automation_control/domain/entities/request/signin_request_params.dart';
import 'package:home_automation_control/presentation/blocs/auth/form_validation_cubit/form_validation_cubit.dart';
import 'package:home_automation_control/presentation/ui/__shared/widgets/app_button.dart';
import 'package:home_automation_control/presentation/ui/__shared/widgets/app_textfield.dart';

class SignInBottomWidget extends StatelessWidget {
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  final _userFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  final SignInRequestParams _requestParams = SignInRequestParams();

  @override
  Widget build(BuildContext context) {
    final FormValidationCubit _formValidationCubit =
        BlocProvider.of<FormValidationCubit>(context);
    return Column(
      children: [
        BlocBuilder<FormValidationCubit, FormValidationState>(
          bloc: _formValidationCubit,
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
        SizedBox(height: 4.h),
        BlocBuilder<FormValidationCubit, FormValidationState>(
          bloc: _formValidationCubit,
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
        SizedBox(height: 16.h),
        AppPrimaryButton(
          label: AppStrings.signIn,
          onPressed: () => _formValidationCubit.validateOnSignInButtonClick(
            _requestParams,
          ),
        ),
        SizedBox(height: 16.h),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.signup),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.dontHaveAccount,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: AppColors.appHintColor,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                AppStrings.signUp.toUpperCase(),
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: AppColors.appAccentColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
