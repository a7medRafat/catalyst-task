import 'package:catalyst/config/style/app_fonts.dart';
import 'package:catalyst/core/extentions/date.dart';
import 'package:catalyst/features/properties/model/PropertiesModel.dart';
import 'package:catalyst/features/users/view/widgets/profile_image.dart';
import 'package:flutter/cupertino.dart';

class DetailsUser extends StatelessWidget {
  const DetailsUser({super.key, required this.model});

  final PropertiesModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProfileImage(
          img: model.user!.profileImage,
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.user!.name!, style: AppFonts.bodyText1),
              Row(
                children: [
                  Text(
                    model.user!.role!,
                    style: AppFonts.bodyText3,
                  ),
                  Text(
                    ' . ${model.createdAt!.toCustomString()}',
                    style: AppFonts.bodyText3,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
