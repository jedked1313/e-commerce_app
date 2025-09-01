import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/signup.dart';
import 'package:e_commerce/view/widget/dialogs/auth/signupdialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  bool obscureText = true;
  StatusRequests statusRequests = StatusRequests.none;
  SignUpData signupData = SignUpData(Get.find());
  List data = [];

  showPassword() {
    obscureText = obscureText == true ? false : true;
    update();
  }

  signUp() async {
    if (formState.currentState!.validate()) {
      statusRequests = StatusRequests.loading;
      // Refresh UI and Display loading
      update();
      var response = await signupData.getSignupData(
          username.text, email.text, password.text);
      statusRequests = handlingData(response);
      if (statusRequests == StatusRequests.success) {
        accountCreatedDialog(email);
      } else if (statusRequests == StatusRequests.failure) {
        // Email is already registered
        emailExistsDialog();
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }
}
