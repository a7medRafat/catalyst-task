import 'package:catalyst/config/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class MyToast {
  static show({required String text, BuildContext? context}) {
    debugPrint('Showing toast: $text');

    showToast(
      text,
      context: context,
      textStyle: TextStyle(fontSize: 12, color: AppColors.scaffoldColor),
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.slideFromBottomFade,
      position: StyledToastPosition.top,
      animDuration: const Duration(seconds: 1),
      duration: const Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  }
}
