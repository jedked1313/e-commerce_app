import 'package:e_commerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCodeController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late String code;
  checkCode() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      goToResetPassword();
    } else {}
  }

  goToResetPassword() {
    Get.offNamed(AppRoute.resetPassword);
  }

  @override
  void onInit() {
    super.onInit();
    return;
  }
}
