import 'package:catalyst/config/colors/app_colors.dart';
import 'package:catalyst/config/style/app_fonts.dart';
import 'package:catalyst/core/utils/vContainer.dart';
import 'package:flutter/material.dart';


class MyDialog {
  static Future<dynamic> show(
          {required context,
          required Function() thisFun,
          required Function() addFun,
          required Widget content}) =>
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          buttonPadding:EdgeInsets.zero,
          backgroundColor: AppColors.white,
          surfaceTintColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(3.0))),
          title: Text("Addresses",
              style: TextStyle(color: AppColors.caption, fontSize: 17)),
          content: content,
          actions: <Widget>[
            Row(
              children: [
                AppContainer(
                  function: thisFun,
                  padding: const EdgeInsets.all(10),
                  color: AppColors.scaffoldColor,
                  borderRadius: BorderRadius.circular(3),
                  child: Text(
                    "This Address",
                    style:  AppFonts.bodyText3,
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(width: 10),
                AppContainer(
                  function: addFun,
                  padding: const EdgeInsets.all(10),
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(3),
                  child: Text(
                    "New Address",
                    style: AppFonts.bodyText3.copyWith(color: AppColors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
