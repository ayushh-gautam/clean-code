import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newproject/app/routes/global_key.dart';
import 'package:newproject/multibloc_provider.dart';

import 'app/helper/theme_helper.dart';
import 'app/routes/route.dart';
import 'app/routes/route_handler.dart';
import 'app/utils/string_constant.dart';

void main() {
  runApp(const MultiBlocProviderClass(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 755),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Foodmandu Rider',
          onGenerateRoute: generateRoute,
          navigatorKey: gNavigatorKey,
          theme: ThemeHelper().generateApptheme(
              context,
              AppThemeState
                  .app_theme_light), // theme state should handle from riverpod
          // home: child,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.homePage,
          // builder: (context, child) {}, TODO : check authorization and navigate to dashboard
        );
      },
    );
  }
}
