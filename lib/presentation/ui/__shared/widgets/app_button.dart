import 'package:flutter/material.dart';
import 'package:home_automation_control/core/app_screen_utils.dart';

class AppPrimaryButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String label;
  final Function() onPressed;

  const AppPrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height ?? 24.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(4.sp),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(2.w, 2.h),
              color: Theme.of(context).accentColor.withOpacity(0.2),
              blurRadius: 2,
            )
          ],
          color: Theme.of(context).accentColor,
        ),
        alignment: Alignment.center,
        child: Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
