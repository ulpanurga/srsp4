import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyles {
  static bool _isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static TextStyle title(BuildContext context) => TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        color: _isDark(context)
            ? AppColors.textDarkPrimary
            : AppColors.textPrimary,
      );

  static TextStyle subtitle(BuildContext context) => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: _isDark(context)
            ? AppColors.textDarkPrimary
            : AppColors.textPrimary,
      );

  static TextStyle body(BuildContext context) => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: _isDark(context)
            ? AppColors.textDarkPrimary
            : AppColors.textPrimary,
      );

  static TextStyle caption(BuildContext context) => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: _isDark(context)
            ? AppColors.textDarkSecondary
            : AppColors.textSecondary,
      );
}