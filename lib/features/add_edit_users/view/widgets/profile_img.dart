import 'package:catalyst/config/Strings/app_strings.dart';
import 'package:catalyst/core/utils/vContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImg extends StatelessWidget {
  const ProfileImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppContainer(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 20.h),
        borderRadius: BorderRadius.circular(20),
        height: 100.h,
        width: 100.w,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            AppStrings.defaultProfile,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
