import 'package:catalyst/config/colors/app_colors.dart';
import 'package:catalyst/config/style/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingFilters extends StatefulWidget {
  final Function(String filter) onFilterSelected;

  const BookingFilters({super.key, required this.onFilterSelected});

  @override
  // ignore: library_private_types_in_public_api
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<BookingFilters> {
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    final filters = ['All', 'Confirmed', 'Pending'];

    return Row(
      children: filters.map((filter) {
        final isSelected = filter == selectedFilter;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedFilter = filter;
            });
            widget.onFilterSelected(filter);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              filter,
              style: AppFonts.bodyText1.copyWith(
                color: isSelected ? AppColors.primaryColor : Colors.grey[700],
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
