import 'package:catalyst/config/Strings/app_strings.dart';
import 'package:catalyst/config/colors/app_colors.dart';
import 'package:catalyst/config/style/app_fonts.dart';
import 'package:catalyst/core/shared_widgets/app_bar.dart';
import 'package:catalyst/core/shared_widgets/button_nav_bar.dart';
import 'package:catalyst/features/layout/view_model/layout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutViewModel>(
      builder: (BuildContext context, LayoutViewModel value, Widget? child) {
        return Scaffold(
          appBar: MyAppBar(title: Text(AppStrings.appName,style: AppFonts.headline1.copyWith(color: AppColors.blue))),
          key: value.scaffoldKey,
          body: value.screens[value.currentNavIndex],
          bottomNavigationBar: SalomonBottomNav(
            onTap: (index) => value.changeNavButton(index),
            currentIndex: value.currentNavIndex,
          ),
        );
      },
    );
  }
}
