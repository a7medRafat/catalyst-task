import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'app/my_app.dart';
import 'core/dio_helper/dio_helper.dart';
import 'core/shared_preferances/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  DioHelper.init();
  await ScreenUtil.ensureScreenSize();
  await CacheHelper.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  runApp(
    const StyledToast(
      locale: Locale('en'),
      child: MyApp(),
    ),
  );
}
