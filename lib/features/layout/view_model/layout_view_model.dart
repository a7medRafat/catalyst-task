import 'package:catalyst/features/bookings/view/bookings_screen.dart';
import 'package:catalyst/features/properties/view/screens/properties_screen.dart';
import 'package:catalyst/features/users/view/users_screen.dart';
import 'package:flutter/material.dart';

class LayoutViewModel extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int currentNavIndex = 0;

  List<Widget> screens = [
     UsersScreen(),
    const PropertiesScreen(),
    const BookingsScreen(),
  ];

  void changeNavButton(int index) {
    currentNavIndex = index;
    notifyListeners();
  }
}
