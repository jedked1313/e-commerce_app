import 'package:e_commerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmailController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;

  goToSuccess(args) {
    Get.toNamed(AppRoute.success, arguments: args);
  }

  checkEmail() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      goToSuccess("Your Account has been created successfully.");
    } else {}
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
