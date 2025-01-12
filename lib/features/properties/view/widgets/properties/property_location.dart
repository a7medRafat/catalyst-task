import 'package:catalyst/config/colors/app_colors.dart';
import 'package:catalyst/config/style/app_fonts.dart';
import 'package:catalyst/features/properties/model/PropertiesModel.dart';
import 'package:flutter/cupertino.dart';

class PropertyLocation extends StatelessWidget {
  const PropertyLocation({super.key, required this.model, this.textStyle});

  final PropertiesModel model;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        style: textStyle ??
            AppFonts.bodyText1.copyWith(color: AppColors.primaryColor),
        model.location!,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
      ),
    );
  }
}
