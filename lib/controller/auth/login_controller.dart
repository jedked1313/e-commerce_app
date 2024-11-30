import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdata_controller.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/login.dart';
import 'package:e_commerce/view/widget/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  LoginData loginData = LoginData(Get.find());
  late TextEditingController email;
  late TextEditingController password;
  bool obscureText = true;
  StatusRequests? statusRequests;
  MyServices myServices = Get.find();

  showPassword() {
    obscureText = obscureText == true ? false : true;
    update();
  }

  login() async {
    if (formState.currentState!.validate()) {
      statusRequests = StatusRequests.loading;
      // Refresh UI and Display loading
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequests = handlingData(response);
      if (statusRequests == StatusRequests.success) {
        if (response['status'] == "success" &&
            response['user_data']['user_approve'] == 1) {
          // Save user info on local storage
          myServices.sharedPreferences
              .setString("user_id", response['user_data']['user_id']);
          myServices.sharedPreferences
              .setString("user_email", response['user_data']['user_email']);
          myServices.sharedPreferences
              .setString("user_name", response['user_data']['user_name']);
          myServices.sharedPreferences.setString("token", response['token']);
          myServices.sharedPreferences.setInt("step", 2);
          // Redirect to Home
          Get.offAllNamed(AppRoute.home);
        } else if (response['status'] == "success" &&
            response['user_data']['user_approve'] == 0) {
          Get.dialog(CustomDialog(
              icon: Icons.notification_add,
              iconColor: Colors.yellow,
              title: "Warning",
              content: "Please confirm your email, \n Then you can continue.",
              buttonTitle: "OK",
              onConfirm: () {
                Get.toNamed(AppRoute.confirmEmail,
                    arguments: {"user_email": email.text});
              }));
        } else {
          Get.dialog(CustomDialog(
              icon: Icons.warning_rounded,
              iconColor: Colors.yellow,
              title: "Warning",
              content: "Incorrect email or password",
              buttonTitle: "OK",
              onConfirm: () {
                Get.back();
              }));
          statusRequests == StatusRequests.failure;
        }
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
  }
}
