import 'package:e_commerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  bool obscureText = true;

  showPassword() {
    obscureText = obscureText == true ? false : true;
    update();
  }

  goToCheckEmail() {
    Get.toNamed(AppRoute.checkEmail);
  }

  signUp() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      goToCheckEmail();
    } else {}
  }

  @override
  void onInit() {
    super.onInit();
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    username.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
  }
}
