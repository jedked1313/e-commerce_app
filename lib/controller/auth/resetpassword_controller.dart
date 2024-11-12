import 'package:e_commerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController confirmPassword;
  bool obscureText = true;

  showPassword() {
    obscureText = obscureText == true ? false : true;
    update();
  }

  resetPassword() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      goToSuccess();
    } else {}
  }

  goToSuccess() {
    Get.toNamed(AppRoute.success, arguments: "success_reset_password".tr);
  }

  @override
  void onInit() {
    super.onInit();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    password.dispose();
    confirmPassword.dispose();
  }
}
