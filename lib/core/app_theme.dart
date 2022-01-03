import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_automation_control/core/app_screen_utils.dart';

class AppColors {
  static const appPrimary = Color(0xFF03242E);
  static const appAccentColor = Color(0xFF00A79B);

  static const appTextColor = Colors.black;
  static const appButtonTextColor = Colors.white;
  static const appErrorTextColor = Colors.red;
  static const appHintColor = Colors.blueGrey;
}

class AppTheme {
  const AppTheme._();

  static ThemeData init() {
    return ThemeData(
      primaryColor: AppColors.appPrimary,
      accentColor: AppColors.appAccentColor,
      scaffoldBackgroundColor: AppColors.appPrimary,
      brightness: Brightness.dark,
      textTheme: AppTheme.textTheme(),
      iconTheme: AppTheme.iconTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: AppTheme.inputDecorationTheme(),
    );
  }

  static TextTheme get _textTheme => GoogleFonts.rubikTextTheme();

  static TextTheme get _headerTextTheme => GoogleFonts.spartanTextTheme();

  static TextStyle? get _headline6 => _headerTextTheme.headline6?.copyWith(
        color: AppColors.appTextColor,
        fontSize: 20.0.sp,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
      );

  static TextStyle? get _headline5 => _headerTextTheme.headline5?.copyWith(
        color: AppColors.appTextColor,
        fontSize: 24.0.sp,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
        height: 1.5,
      );

  static TextStyle? get _subtitle2 => _headerTextTheme.subtitle2?.copyWith(
    color: AppColors.appTextColor,
    fontSize: 18.0.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.25,
  );

  static TextStyle? get _button => _textTheme.button?.copyWith(
        color: AppColors.appButtonTextColor,
        fontSize: 18.sp,
        letterSpacing: 2.0,
        fontWeight: FontWeight.w600,
        height: 1.5,
      );

  static TextStyle? get _bodyText1 => _textTheme.bodyText1?.copyWith(
        color: AppColors.appTextColor,
        fontSize: 16.sp,
        letterSpacing: 0.5,
        height: 1.5,
      );

  static TextStyle? get _bodyText2 => _textTheme.bodyText2?.copyWith(
        color: AppColors.appTextColor,
        fontSize: 14.sp,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle? get _caption => _textTheme.caption?.copyWith(
        color: AppColors.appTextColor,
        fontSize: 12.sp,
        letterSpacing: 0.4,
        height: 1.5,
      );

  static TextTheme textTheme() => TextTheme(
        headline6: _headline6,
        headline5: _headline5,
        subtitle2: _subtitle2,
        bodyText1: _bodyText1,
        bodyText2: _bodyText2,
        button: _button,
        caption: _caption,
      );

  static IconThemeData iconTheme() => IconThemeData(
        color: AppColors.appButtonTextColor,
        size: 24.sp,
      );

  static InputDecorationTheme inputDecorationTheme() => InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 2.w,
        ),
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle? get tabSelectedTextStyle => caption?.copyWith(fontSize: 12.sp);

  TextStyle? get tabUnSelectedTextStyle => caption?.copyWith(fontSize: 10.sp);

  TextStyle? get cardTextStyle => caption?.copyWith(
        fontSize: 10.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      );

  TextStyle? get tagTextStyle => caption?.copyWith(fontSize: 10.sp);

  TextStyle? get ratingTextStyle => caption?.copyWith(
        fontSize: 10.sp,
      );
}
