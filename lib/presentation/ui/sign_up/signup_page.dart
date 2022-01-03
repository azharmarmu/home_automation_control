import 'package:flutter/material.dart';
import 'package:home_automation_control/core/app_routes.dart';
import 'package:home_automation_control/core/app_screen_utils.dart';
import 'package:home_automation_control/core/di/dependency_injection.dart';
import 'package:home_automation_control/presentation/blocs/auth/form_validation_cubit/form_validation_cubit.dart';
import 'package:home_automation_control/presentation/ui/__shared/widgets/auth_template.dart';

import 'widgets/signup_bottom_widget.dart';
import 'widgets/signup_top_widget.dart';

class SignUpPage extends StatelessWidget {
  final FormValidationCubit _formValidationCubit =
      getItInstance<FormValidationCubit>();

  @override
  Widget build(BuildContext context) {
    final Radius _radius = Radius.circular(48.sp);
    final height = ScreenUtils.defaultHeight;
    return AuthTemplate(
      _formValidationCubit,
      onSuccess: () => Navigator.of(context).pushReplacementNamed(
        AppRoutes.landing,
      ),
      onError: (error) {},
      child: ListView(
        children: [
          SizedBox(
            height: height * 0.25,
            child: const SignUpTopWidget(),
          ),
          Container(
            height: height * 0.75,
            padding: EdgeInsets.symmetric(
              horizontal: 36.w,
              vertical: 20.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: _radius,
                topRight: _radius,
              ),
            ),
            child: SignUpBottomWidget(),
          ),
        ],
      ),
    );
  }
}
