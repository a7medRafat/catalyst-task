import 'package:catalyst/config/Strings/app_strings.dart';
import 'package:catalyst/config/colors/app_colors.dart';
import 'package:catalyst/config/style/app_fonts.dart';
import 'package:catalyst/core/extentions/date.dart';
import 'package:catalyst/core/utils/my_Divider.dart';
import 'package:catalyst/core/utils/vContainer.dart';
import 'package:catalyst/features/bookings/model/BookingModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingItem extends StatelessWidget {
  const BookingItem({super.key, required this.model});

  final BookingModel model;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
        shadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(model.user!.name!, style: AppFonts.bodyText2),
                    SizedBox(width: 8.w),
                    Text(model.user!.role!,
                        style: AppFonts.bodyText3.copyWith(color: Colors.red)),
                  ],
                ),
                SizedBox(height: 10.h),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model.startDate!.toCustomString(),
                        style: AppFonts.bodyText3.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      const MyDivider(),
                      Text(
                        model.endDate!.toCustomString(),
                        style: AppFonts.bodyText3.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              model.status!,
              style: AppFonts.bodyText2.copyWith(
                color: model.status! != AppStrings.pending
                    ? Colors.green
                    : AppColors.gray,
              ),
            )
          ],
        ));
  }
}
