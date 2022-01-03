import 'package:flutter/material.dart';
import 'package:home_automation_control/core/app_assets.dart';
import 'package:home_automation_control/core/app_screen_utils.dart';
import 'package:home_automation_control/core/app_strings.dart';
import 'package:home_automation_control/core/app_theme.dart';

class SignInTopWidget extends StatelessWidget {
  const SignInTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.maskGroup1,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitWidth,
        ),
        Positioned(
          left: 32.w,
          bottom: 16.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 2.h,
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.sp),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                AppStrings.welcome,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: AppColors.appButtonTextColor,
                    ),
              ),
              SizedBox(height: 8.h),
              Text(
                AppStrings.toRoomControl,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: AppColors.appButtonTextColor,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
