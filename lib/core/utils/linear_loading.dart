import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinearLoading extends StatelessWidget {

  const LinearLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: const LinearProgressIndicator(minHeight: 2),
    );
  }
}
