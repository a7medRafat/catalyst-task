import 'package:catalyst/config/colors/app_colors.dart';
import 'package:catalyst/core/utils/vContainer.dart';
import 'package:flutter/cupertino.dart';

class DetailsHead extends StatelessWidget {
  const DetailsHead({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: AppColors.white,
      height: MediaQuery.of(context).size.height / 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          fit: BoxFit.cover,
          img,
        ),
      ),
    );
  }
}
