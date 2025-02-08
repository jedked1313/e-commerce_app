import 'package:e_commerce/core/localization/arabic.dart';
import 'package:e_commerce/core/localization/english.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleContoller extends GetxController {
  Locale? language;
  Translations? translations;
  MyServices myServices = Get.find();

  changeLanguage(String lang) {
    Locale locale = Locale(lang);
    myServices.sharedPreferences.setString("langcode", lang);
    Get.updateLocale(locale);
  }

  // Select localization file
  Translations selectLocalization() {
    if (myServices.sharedPreferences.getString("langcode") == "ar") {
      return Arabic();
    } else {
      return English();
    }
  }

  // Change Font Family based on selected language
  String selectFontFamily() {
    if (myServices.sharedPreferences.getString("langcode") == "ar") {
      // For Arabic
      return "Rubik";
    } else {
      // For others
      return "Mulish";
    }
  }

  @override
  void onInit() {
    // Display selected language, if there is no selected language display device language
    super.onInit();
    String? sharedPrefLang = myServices.sharedPreferences.getString("langcode");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
  }
}
