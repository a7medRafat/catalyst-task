import 'package:catalyst/config/colors/app_colors.dart';
import 'package:catalyst/config/style/app_fonts.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.function,
    required this.text,
    this.btnColor,
    this.width,
    this.radius,
    this.txtColor,
  });

  final Function() function;
  final String text;
  final Color? btnColor;
  final Color? txtColor;
  final double? width;

  final BorderRadius? radius;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: radius ?? BorderRadius.circular(15),
      ),
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 17),
      onPressed: function,
      color: btnColor,
      minWidth: width ?? double.infinity,
      textColor: txtColor ?? AppColors.white,
      child: Text(
        text.toUpperCase(),
        style: AppFonts.bodyText2.copyWith(color: Colors.white),
      ),
    );
  }
}
