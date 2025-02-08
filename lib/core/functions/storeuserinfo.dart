import 'package:e_commerce/core/services/services.dart';
import 'package:get/get.dart';

MyServices myServices = Get.find();

storeUserInfo(response) {
  myServices.sharedPreferences
      .setString("user_id", response['user_data']['user_id'].toString());
  myServices.sharedPreferences
      .setString("user_email", response['user_data']['user_email']);
  myServices.sharedPreferences
      .setString("user_name", response['user_data']['user_name']);
  myServices.sharedPreferences.setString("token", response['token']);
  myServices.sharedPreferences.setInt("step", 2);
}
