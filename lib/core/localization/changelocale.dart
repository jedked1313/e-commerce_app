import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleContoller extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  changeLanguage(String lang) {
    Locale locale = Locale(lang);
    myServices.sharedPreferences.setString("langcode", lang);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    // Display selected language, if there is no selected language display device language
    super.onInit();
    String? sharedPrefLang = myServices.sharedPreferences.getString("langcode");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLang == "e") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
  }
}
