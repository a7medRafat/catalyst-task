import 'package:catalyst/config/Strings/app_strings.dart';
import 'package:catalyst/config/colors/app_colors.dart';
import 'package:catalyst/core/extentions/navigation.dart';
import 'package:catalyst/core/shared_widgets/loading.dart';
import 'package:catalyst/core/utils/vContainer.dart';
import 'package:catalyst/features/properties/view/widgets/properties/property_created.dart';
import 'package:catalyst/features/properties/view/widgets/properties/property_img.dart';
import 'package:catalyst/features/properties/view/widgets/properties/property_location.dart';
import 'package:catalyst/features/properties/view/widgets/properties/property_name.dart';
import 'package:catalyst/features/properties/view/widgets/properties/property_price.dart';
import 'package:catalyst/features/properties/view_model/properties_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detailsScreen.dart';

class PropertiesScreen extends StatelessWidget {
  const PropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PropertiesViewModel>(
        builder:
            (BuildContext context, PropertiesViewModel value, Widget? child) {
          if (value.isLoading) {
            return const Center(child: Loading());
          } else if (value.properties.isEmpty) {
            return Center(child: Text(AppStrings.noProperties));
          } else {
            return SingleChildScrollView(
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                padding: const EdgeInsets.all(10),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1 / 1.3,
                children: List.generate(value.properties.length, (index) {
                  var model = value.properties[index];

                  return AppContainer(
                    function: () => context.go(screen: PropertyDetails(model: model)),
                    color: AppColors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const PropertyImg(img: 'assets/images/img1.jpg'),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PropertyLocation(model: model),
                              PropertyName(model: model),
                              PropertyCreated(model: model),
                              PropertyPrice(model: model),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
            );
          }
        },
      ),
    );
  }
}
