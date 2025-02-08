import 'package:e_commerce/core/services/services.dart';
import 'package:get/get.dart';

translateData(columnAr, columnEn) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("langcode") == "ar") {
    return columnAr;
  } else {
    return columnEn;
  }
}
