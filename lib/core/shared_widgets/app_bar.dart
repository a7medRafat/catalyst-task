import 'package:catalyst/config/colors/app_colors.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.backColor,
    this.centerTitle,
  });

  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backColor;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      centerTitle: centerTitle,
      titleSpacing: 4,
      elevation: 0,
      backgroundColor: backColor ?? AppColors.scaffoldColor,
      leading: leading,
      actions: actions,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: title,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
