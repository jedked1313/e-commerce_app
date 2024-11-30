import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdata_controller.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/forgotpassword.dart';
import 'package:e_commerce/view/widget/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  ForgotPasswordData forgotPasswordData = ForgotPasswordData(Get.find());
  StatusRequests? statusRequests;

  emailExist() async {
    if (formState.currentState!.validate()) {
      statusRequests = StatusRequests.loading;
      // Refresh UI and Display loading
      update();
      var response = await forgotPasswordData.postData(email.text);
      statusRequests = handlingData(response);
      if (statusRequests == StatusRequests.success) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoute.verifyCode,
              arguments: {"user_email": email.text});
        }
      } else {
        Get.dialog(CustomDialog(
            icon: Icons.warning_rounded,
            iconColor: Colors.yellow,
            title: "Warning",
            content: "This Email doesn't exist !",
            buttonTitle: "OK",
            onConfirm: () {
              Get.back();
            }));
        statusRequests == StatusRequests.failure;
      }
    }
    update();
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
