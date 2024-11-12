import 'package:e_commerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;

  checkCode() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      goToVerifyCode();
    } else {}
  }

  goToVerifyCode() {
    Get.toNamed(AppRoute.verifyCode);
  }

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
  }
}
