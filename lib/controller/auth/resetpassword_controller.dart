import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/resetpassword.dart';
import 'package:e_commerce/view/widget/dialogs/serverfailuredialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  late TextEditingController password;
  late TextEditingController confirmPassword;
  bool obscureText = true;
  StatusRequests statusRequests = StatusRequests.none;
  String? email;

  showPassword() {
    obscureText = obscureText == true ? false : true;
    update();
  }

  resetPassword() async {
    if (formState.currentState!.validate()) {
      statusRequests = StatusRequests.loading;
      // Refresh UI and Display loading
      update();
      var response =
          await resetPasswordData.getResetPasswordData(email!, password.text);
      statusRequests = handlingData(response);
      if (statusRequests == StatusRequests.success) {
        Get.offAllNamed(AppRoute.success,
            arguments: {"success_text": "success_reset_password".tr});
      } else if (statusRequests == StatusRequests.failure) {
        serverFailureDialog();
      }
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['user_email'];
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }
}
