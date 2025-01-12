import 'package:catalyst/config/colors/app_colors.dart';
import 'package:catalyst/config/style/app_fonts.dart';
import 'package:catalyst/core/shared_widgets/app_bar.dart';
import 'package:catalyst/features/properties/model/PropertiesModel.dart';
import 'package:catalyst/features/properties/view/widgets/details/details.dart';
import 'package:catalyst/features/properties/view/widgets/details/details_head.dart';
import 'package:catalyst/features/properties/view/widgets/details/details_user.dart';
import 'package:catalyst/features/properties/view/widgets/properties/property_location.dart';
import 'package:catalyst/features/properties/view/widgets/properties/property_name.dart';
import 'package:catalyst/features/properties/view/widgets/properties/property_price.dart';
import 'package:catalyst/features/users/view/widgets/user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({super.key, required this.model});

  final PropertiesModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          'details',
          style: AppFonts.headline2,
        ),
        backColor: Colors.white,
      ),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const DetailsHead(img: 'assets/images/img2.jpg'),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PropertyName(
                  model: model,
                  textStyle: AppFonts.headline2.copyWith(color: Colors.black),
                ),
                PropertyLocation(
                    model: model, textStyle: AppFonts.headline3.copyWith()),
                SizedBox(height: 5.h),
                PropertyPrice(
                  model: model,
                  textStyle: AppFonts.bodyText1.copyWith(color: Colors.black),
                ),
                Details(model: model),
                SizedBox(height: 12.h),
                DetailsUser(
                  model: model,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
