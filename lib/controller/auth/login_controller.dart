import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/core/functions/storeuserinfo.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/login.dart';
import 'package:e_commerce/view/widget/dialogs/auth/logindialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  LoginData loginData = LoginData(Get.find());
  late TextEditingController email;
  late TextEditingController password;
  bool obscureText = true;
  StatusRequests statusRequests = StatusRequests.none;

  showPassword() {
    obscureText = obscureText == true ? false : true;
    update();
  }

  login() async {
    if (formState.currentState!.validate()) {
      statusRequests = StatusRequests.loading;
      // Refresh UI and Display loading
      update();
      var response = await loginData.getLoginData(email.text, password.text);
      statusRequests = handlingData(response);
      if (statusRequests == StatusRequests.success) {
        if (response['user_data']['user_approve'] == 1) {
          // Save user info on local storage
          storeUserInfo(response);
          // Redirect to home screen
          Get.offAllNamed(AppRoute.rootScreen);
        } else {
          confirmationEmailDialog(email.text);
        }
      } else if (statusRequests == StatusRequests.failure) {
        incorrectEmailDialog();
      }
    }
    update();
  }

  goToForgotPassword() {
    Get.toNamed(AppRoute.forgotPassword);
  }

  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  tryAgain() {
    statusRequests = StatusRequests.failure;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
  }
}
