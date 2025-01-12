import 'package:flutter/material.dart';
import '../../config/colors/app_colors.dart';

class MyDivider extends StatelessWidget {

  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      color:  AppColors.gray,
      thickness: 0.7,
    );
  }
}
