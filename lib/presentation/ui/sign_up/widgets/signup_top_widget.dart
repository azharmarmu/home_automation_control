import 'package:flutter/material.dart';
import 'package:home_automation_control/core/app_assets.dart';
import 'package:home_automation_control/core/app_screen_utils.dart';
import 'package:home_automation_control/core/app_strings.dart';
import 'package:home_automation_control/core/app_theme.dart';

class SignUpTopWidget extends StatelessWidget {
  const SignUpTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0.w,
          child: Image.asset(
            AppAssets.maskGroup2,
            width: MediaQuery.of(context).size.width * 0.75,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          left: 32.w,
          top: 16.h,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  AppStrings.back,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: AppColors.appButtonTextColor,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 32.w,
          bottom: 16.h,
          child: Text(
            AppStrings.createNewAccount,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: AppColors.appButtonTextColor,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ],
    );
  }
}
