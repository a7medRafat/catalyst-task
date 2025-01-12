import 'package:catalyst/config/colors/app_colors.dart';
import 'package:catalyst/core/functions/app_functions.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String? img;
  final Color? circleColor;

  const ProfileImage({
    super.key,
    required this.img,
     this.circleColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: circleColor ?? AppColors.lightBlue,
      radius: 29,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 27,
        child: AppFunctions().imageHandler(img: img!),
      ),
    );
  }
}
