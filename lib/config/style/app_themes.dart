import 'package:catalyst/config/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
    ),
    primaryColor: AppColors.primaryColor,
    useMaterial3: true,
    fontFamily: 'Poppins',
    iconTheme: IconThemeData(color: AppColors.semiBlack, size: 18.sp),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      iconSize: 12.sp,
    ),
  );
}
