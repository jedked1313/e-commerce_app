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
    if (myServices.sharedPreferences.getBool("onboarding") == true) {
        return const RouteSettings(name: AppRoute.login);
    }
    return null;
    }
}
