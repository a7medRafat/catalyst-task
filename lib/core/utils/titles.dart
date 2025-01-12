import 'package:catalyst/config/style/app_fonts.dart';
import 'package:flutter/cupertino.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppFonts.headline3,
    );
  }
}
