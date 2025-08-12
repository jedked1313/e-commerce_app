import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/localization/changelocale.dart';
import 'package:e_commerce/view/widget/customiconbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Change font family according locale
LocaleContoller controller = Get.put(LocaleContoller());

ThemeData appTheme = ThemeData(
  // splashColor: Colors.transparent,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontWeight: FontWeight.w700),
    headlineMedium: TextStyle(fontWeight: FontWeight.w700),
    headlineSmall: TextStyle(fontWeight: FontWeight.w700),
    titleLarge: TextStyle(fontWeight: FontWeight.w700),
    titleMedium: TextStyle(fontWeight: FontWeight.w700),
  ),
  colorSchemeSeed: AppColor.primaryColor,
  actionIconTheme: ActionIconThemeData(backButtonIconBuilder: (context) {
    return const CustomIconButton(
        color: Colors.transparent,
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColor.black,
        ));
  }),
  fontFamily: controller.selectFontFamily(),
  useMaterial3: true,
);
