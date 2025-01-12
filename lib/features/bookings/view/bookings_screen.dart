import 'package:catalyst/core/shared_widgets/loading.dart';
import 'package:catalyst/features/bookings/view/Widgets/filters.dart';
import 'package:catalyst/features/bookings/view_model/bookings_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'Widgets/booking_item.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Consumer<BookingsViewModel>(
        builder:
            (BuildContext context, BookingsViewModel value, Widget? child) {
          return value.isLoading
              ? const Center(child: Loading())
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      BookingFilters(
                        onFilterSelected: (String filter) =>
                            value.applyFilter(filter),
                      ),
                      SizedBox(height: 20.h),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => BookingItem(
                          model: value.filteredBookings[index],
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10.h),
                        itemCount: value.filteredBookings.length,
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
