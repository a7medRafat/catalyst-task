import 'package:catalyst/config/style/app_fonts.dart';
import 'package:catalyst/features/properties/model/PropertiesModel.dart';
import 'package:flutter/material.dart';

class PropertyPrice extends StatelessWidget {
  const PropertyPrice({super.key, required this.model, this.textStyle});

  final PropertiesModel model;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text(
            style: textStyle ?? AppFonts.bodyText2.copyWith(color: Colors.black),
            '\u20AC ${double.parse(model.price!).round()} ',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
          Text(
            style: AppFonts.bodyText2
                .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
            'night',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
