import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_automation_control/core/app_screen_utils.dart';
import 'package:home_automation_control/core/app_theme.dart';
import 'package:home_automation_control/core/extensions/common_extension.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final FocusNode focusNode;
  final bool autofocus;
  final bool obscureText;
  final TextInputType? textInputType;
  final String prefixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? errorText;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? formatter;

  const AppTextFormField({
    Key? key,
    required this.hintText,
    this.controller,
    required this.focusNode,
    this.autofocus = false,
    this.obscureText = false,
    required this.prefixIcon,
    this.onChanged,
    this.validator,
    this.errorText,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.formatter,
    this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              prefixIcon,
            ).setMarginOnly(right: 20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller,
                    autofocus: autofocus,
                    obscureText: obscureText,
                    obscuringCharacter: '*',
                    onChanged: onChanged,
                    validator: validator,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: AppColors.appTextColor,
                        ),
                    inputFormatters: formatter,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      hintStyle:
                          Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: AppColors.appHintColor,
                              ),
                      hintText: hintText,
                    ),
                    textCapitalization: textCapitalization,
                    textInputAction: textInputAction,
                    keyboardType: textInputType,
                  ),
                  const Divider(color: AppColors.appHintColor),
                ],
              ),
            ),
          ],
        ),
        if (errorText != null)
          Text(
            errorText!,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: AppColors.appErrorTextColor,
                ),
          ).setMarginOnly(top: 2.h, left: 36.w),
      ],
    );
  }
}
