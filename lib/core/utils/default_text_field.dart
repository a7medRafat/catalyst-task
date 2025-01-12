import 'package:catalyst/config/style/app_fonts.dart';
import 'package:flutter/material.dart';

class DefaultField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final String? suffixText;
  final Widget? suffixIconBtn;
  final Widget? suffixTextBtn;
  final Color? suffixIconColor;
  final bool isPassword;
  final TextInputType textInputType;
  final Function()? suffixPressed;
  final validation;
  final Function(String)? onChanged;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  bool? borderSide = true;
  final bool? isRead;

  DefaultField({
    super.key,
    required this.controller,
    required this.hint,
    required this.isPassword,
    required this.textInputType,
    required this.validation,
    this.suffixPressed,
    this.suffixIcon,
    this.suffixText,
    this.suffixIconColor,
    this.prefixIcon,
    this.suffixIconBtn,
    this.padding,
    this.suffixTextBtn,
    this.onChanged,
    this.borderSide,
    this.borderRadius,
    this.isRead = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: isRead!,
      onChanged: onChanged,
      keyboardType: textInputType,
      validator: validation,
      obscureText: isPassword,
      style: AppFonts.bodyText1,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: padding ?? const EdgeInsets.symmetric(vertical: 18,horizontal: 10),
        border: OutlineInputBorder(
            borderSide: BorderSide.none, borderRadius: borderRadius!),
        prefixIcon: prefixIcon,
        suffixIcon: IconButton(
            onPressed: suffixPressed,
            icon: Icon(suffixIcon, color: suffixIconColor)),
        suffixText: suffixText,
        hintText: hint,
        hintStyle: AppFonts.regular1,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
