import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_color.dart';
import '../utils/hex_color.dart';
import '../utils/string_constant.dart';



class AppTheme {
  static String darkTheme = APP_THEME_DARK;
  static String lightTheme = APP_THEME_LIGHT;
}

class ThemeHelper {
  // ignore: non_constant_identifier_names
  static String CURRENT_THEME = "";
  Color defaultLightTextColor = const Color(0xFF222222);
  Color defaultDarkTextColor = const Color(0xFFF7F7F7);
  static ThemeData? _currentAppThemeData;

  // String getImageAsset(String assetName, String selectedTheme) {
  // }

  // ShimmerlayoutModel getShimmerLayoutModel() {

  //   if (CURRENT_THEME == APP_THEME_DARK) {
  //     return ShimmerlayoutModel(Colors.grey[700]!, Colors.grey[600]!);
  //   } else {
  //     return ShimmerlayoutModel(Colors.grey[300]!, Colors.grey[200]!);
  //   }
  // }

  ThemeData? getAppTheme(BuildContext context) {
    return _currentAppThemeData;
  }

  getStatusBar(context, {color}) {
    return const SystemUiOverlayStyle().copyWith(
      statusBarColor: color ??
          Theme.of(context).appBarTheme.backgroundColor, //top bar color
      statusBarIconBrightness: Theme.of(context)
          .appBarTheme
          .systemOverlayStyle
          ?.statusBarBrightness, //top bar icons
      systemNavigationBarColor: color ??
          Theme.of(context).appBarTheme.backgroundColor, //bottom bar color
      systemNavigationBarIconBrightness: Theme.of(context)
                  .appBarTheme
                  .systemOverlayStyle
                  ?.statusBarBrightness ==
              Brightness.light
          ? Brightness.dark
          : Brightness.light,
    );
  }

  static var mySystemTheme = SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.white, //top bar color
    statusBarIconBrightness: Brightness.dark, //top bar icons
    systemNavigationBarColor: Colors.white, //bottom bar color
    systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
  );

  ThemeData generateApptheme(
    BuildContext context,
    AppThemeState selectedTheme,
  ) {
    CURRENT_THEME = selectedTheme.name;
    if (selectedTheme.name == APP_THEME_LIGHT) {
      _currentAppThemeData = ThemeData(
          scaffoldBackgroundColor: AppColor.scaffoldColor,
          appBarTheme: AppBarTheme(
              backgroundColor: AppColor
                  .primaryYellow)); // define all theme color here -> (light theme)
    } else {
      _currentAppThemeData = ThemeData(scaffoldBackgroundColor: AppColor.black);
    }

    return _currentAppThemeData!;
  }

  getSilverAppBarColor() {
    if (CURRENT_THEME == APP_THEME_LIGHT) {
      return Colors.white;
    } else {
      return Color(HexColor.getColorFromHex("#292929"));
    }
  }

  // ElevatedButtonThemeData getElevatedButtonTheme(BuildContext context) {
  //   if (CURRENT_THEME == APP_THEME_LIGHT) {
  //     return ElevatedButtonThemeData(
  //       style: ElevatedButton.styleFrom(
  //         primary: Colors.deepOrange,
  //         onPrimary: const Color(0XFFF7F7F7),
  //         textStyle: Theme.of(context).textTheme.button?.copyWith(
  //             color: const Color(0XFFF7F7F7), fontWeight: FontWeight.w400),
  //         shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(100),
  //           ),
  //         ),
  //       ),
  //     );
  //   } else {
  //     return ElevatedButtonThemeData(
  //       style: ElevatedButton.styleFrom(
  //         primary: const Color(0xFFF7F7F7),
  //         onPrimary: const Color(0XFF222222),
  //         textStyle: Theme.of(context).textTheme.button?.copyWith(
  //             color: const Color(0XFF222222), fontWeight: FontWeight.w400),
  //         shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(100),
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  // }

  // TextButtonThemeData getTextButtonTheme(BuildContext context) {
  //   if (CURRENT_THEME == APP_THEME_LIGHT) {
  //     return TextButtonThemeData(
  //       style: TextButton.styleFrom(
  //         backgroundColor: const Color(0xFFF7F7F7),
  //         primary: const Color(0xFF222222),
  //         textStyle: Theme.of(context).textTheme.button?.copyWith(
  //             color: const Color(0xFF222222), fontWeight: FontWeight.w400),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(100),
  //           side: const BorderSide(
  //             color: Color(
  //               0XFF9D9D9D,
  //             ),
  //           ),
  //         ),
  //       ),
  //     );
  //   } else {
  //     return TextButtonThemeData(
  //       style: TextButton.styleFrom(
  //         backgroundColor: const Color(0xFF9D9D9D),
  //         primary: const Color(0xFFF7F7F7),
  //         textStyle: Theme.of(context).textTheme.button?.copyWith(
  //             color: const Color(0xFFF7F7F7), fontWeight: FontWeight.w400),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(100),
  //           side: const BorderSide(
  //             color: Color(
  //               0XFF9D9D9D,
  //             ),
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  // }
}
