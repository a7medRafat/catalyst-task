import 'package:catalyst/config/style/app_fonts.dart';
import 'package:catalyst/features/properties/model/PropertiesModel.dart';
import 'package:catalyst/features/properties/view_model/properties_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.model});

  final PropertiesModel model;

  @override
  Widget build(BuildContext context) {
    return Consumer<PropertiesViewModel>(
      builder:
          (BuildContext context, PropertiesViewModel value, Widget? child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.description!,
                maxLines: value.isExpanded ? null : 2,
                overflow: TextOverflow.fade,
                style: AppFonts.bodyText2.copyWith(fontWeight: FontWeight.w500),
              ),
              InkWell(
                onTap: () => value.changeExpanded(),
                child: Text(
                  value.isExpanded ? 'See Less' : 'See More',
                  style: AppFonts.regular1.copyWith(color: Colors.blue,fontSize: 12),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
