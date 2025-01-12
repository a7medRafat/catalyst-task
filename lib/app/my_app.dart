import 'package:catalyst/config/Strings/app_strings.dart';
import 'package:catalyst/config/style/app_themes.dart';
import 'package:catalyst/core/utils/video_player_view_model.dart';
import 'package:catalyst/features/add_edit_users/view_model/add_edit_view_model.dart';
import 'package:catalyst/features/bookings/view_model/bookings_view_model.dart';
import 'package:catalyst/features/layout/view/app_layout.dart';
import 'package:catalyst/features/layout/view_model/layout_view_model.dart';
import 'package:catalyst/features/properties/view_model/properties_view_model.dart';
import 'package:catalyst/features/users/view_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LayoutViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => UsersViewModel()..getAllUsers(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddEditViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PropertiesViewModel()..getAllProperties(),
        ),
        ChangeNotifierProvider(
          create: (_) => BookingsViewModel()..getAllBookings(),
        ),
        ChangeNotifierProvider(
          create: (_) => VideoPlayerViewModel()..initializeVideo(videoUrl: AppStrings.introVideo),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          home: const AppLayout(),
        ),
      ),
    );
  }
}
