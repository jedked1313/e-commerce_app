import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/services/services.dart';

class AppMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    // If user loggedin redirect to home
    if (myServices.sharedPreferences.getInt("step") == 2) {
      return const RouteSettings(name: AppRoute.home);
    }
    // Display OnBoarding only first time open app
    if (myServices.sharedPreferences.getInt("step") == 1) {
      return const RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}
