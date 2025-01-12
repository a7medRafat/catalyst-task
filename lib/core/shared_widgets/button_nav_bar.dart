import 'package:catalyst/config/colors/app_colors.dart';
import 'package:catalyst/config/style/icons_broken.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class SalomonBottomNav extends StatelessWidget {
  const SalomonBottomNav({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  final int currentIndex;

  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: AppColors.bottomNavColor,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(IconBroken.User1,size: 20),
            title: const Text("Users"),
            selectedColor: Colors.blue,
          ),
          SalomonBottomBarItem(
            icon: const Icon(IconBroken.Category,size: 20),
            title: const Text("Properties"),
            selectedColor: Colors.blue,
          ),
          SalomonBottomBarItem(
            icon: const Icon(IconBroken.Calendar,size: 20),
            title: const Text("Bookings"),
            selectedColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
