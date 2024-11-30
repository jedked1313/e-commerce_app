import 'package:e_commerce/core/services/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  MyServices myServices = Get.find();

  initialData() {}

  @override
  void onInit() {
    super.onInit();
    initialData();
  }
}
