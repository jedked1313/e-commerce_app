import 'package:e_commerce/controller/auth/login_controller.dart';
import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdata_controller.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/forgotpassword.dart';
import 'package:e_commerce/view/widget/dialogs/auth/forgotpassworddialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  ForgotPasswordData forgotPasswordData = ForgotPasswordData(Get.find());
  StatusRequests statusRequests = StatusRequests.none;

  emailExist() async {
    if (formState.currentState!.validate()) {
      statusRequests = StatusRequests.loading;
      // Refresh UI and Display loading
      update();
      var response = await forgotPasswordData.getForgetPasswordData(email.text);
      statusRequests = handlingData(response);
      if (statusRequests == StatusRequests.success) {
        Get.offAllNamed(AppRoute.verifyCode,
            arguments: {"user_email": email.text});
      } else if (statusRequests == StatusRequests.failure) {
        emailNotExists();
      }
    }
    update();
  }

  goToSignup() {
    Get.offNamed(AppRoute.signUp);
    Get.delete<LoginController>();
  }

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
  }
}
