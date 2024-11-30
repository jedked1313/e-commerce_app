import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/functions/handlingdata_controller.dart';
import 'package:e_commerce/view/widget/customdialog.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/verifycode.dart';

class VerifyCodeController extends GetxController {
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  StatusRequests? statusRequests;
  String? email;

  verifyCode(args) async {
    statusRequests = StatusRequests.loading;
      // Refresh UI and Display loading
    update();
    var response = await verifyCodeData.postData(email!, args['verifycode']);
    statusRequests = handlingData(response);
    if (StatusRequests.success == statusRequests) {
      if (response['status'] == "success") {
        Get.toNamed(AppRoute.resetPassword, arguments: args);
      }
    } else {
      Get.dialog(CustomDialog(
          icon: Icons.warning_rounded,
          iconColor: Colors.yellow,
          title: "Warning",
          content: "Wrong verify Code !!",
          buttonTitle: "OK",
          onConfirm: () {
            Get.back();
          }));
      statusRequests == StatusRequests.failure;
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['user_email'];
    super.onInit();
    return;
  }
}
