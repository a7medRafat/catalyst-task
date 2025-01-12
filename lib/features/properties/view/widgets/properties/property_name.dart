import 'package:catalyst/config/style/app_fonts.dart';
import 'package:catalyst/features/properties/model/PropertiesModel.dart';
import 'package:flutter/cupertino.dart';

class PropertyName extends StatelessWidget {
  const PropertyName({super.key, required this.model, this.textStyle});

  final PropertiesModel model;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      style: textStyle ??
          AppFonts.bodyText2.copyWith(fontWeight: FontWeight.normal),
      model.name!,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
    );
  }
}
