import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdata_controller.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/confirmemail.dart';
import 'package:e_commerce/view/widget/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmEmailController extends GetxController {
  ConfirmEmailData confirmEmailData = ConfirmEmailData(Get.find());
  StatusRequests? statusRequests;
  String? email;
  MyServices myServices = Get.find();

  confirmEmail(args) async {
    statusRequests = StatusRequests.loading;
    // Refresh UI and Display loading
    update();
    var response = await confirmEmailData.postData(email!, args['verifycode']);
    statusRequests = handlingData(response);
    if (StatusRequests.success == statusRequests) {
      if (response['status'] == "success") {
        // Save user info on local storage
        myServices.sharedPreferences
            .setString("user_id", response['user_data']['user_id']);
        myServices.sharedPreferences
            .setString("user_email", response['user_data']['user_email']);
        myServices.sharedPreferences
            .setString("user_name", response['user_data']['user_name']);
        myServices.sharedPreferences.setString("token", response['token']);
        myServices.sharedPreferences.setInt("step", 2);
        // Redirect to Home
        Get.toNamed(AppRoute.success, arguments: args);
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
  }
}
