import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  int currentPage = 0;

  MyServices services = Get.find();

  next() {
    Get.offNamed(AppRoute.login);
    // Onboarding screen will not be displeyed after pressing continue button
    myServices.sharedPreferences.setInt("step", 1);
  }

  onPageChange(int val) {
    currentPage = val;
    update();
  }
}
