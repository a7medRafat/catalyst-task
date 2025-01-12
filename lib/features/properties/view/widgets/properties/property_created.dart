import 'package:catalyst/core/extentions/date.dart';
import 'package:catalyst/features/properties/model/PropertiesModel.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../config/style/app_fonts.dart';

class PropertyCreated extends StatelessWidget {
  const PropertyCreated({
    super.key,
    required this.model,
  });

  final PropertiesModel model;

  @override
  Widget build(BuildContext context) {
    return Text(
      style: AppFonts.bodyText2.copyWith(fontWeight: FontWeight.normal),
      model.createdAt!.toCustomString(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
    );
  }
}
