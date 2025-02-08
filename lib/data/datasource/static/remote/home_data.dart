import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apilinks.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:get/get.dart';

class HomeData {
  HomeData(this.crud);
  Crud crud;
  MyServices myServices = Get.find();

  getHomeData() async {
    var response = await crud.requestData(ApiLinks.home,
        {"user_id": myServices.sharedPreferences.getString("user_id")});
    return response.fold((l) => l, (r) => r);
  }
}
