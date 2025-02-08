import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/view/widget/dialogs/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

confirmationEmailDialog(String email) {
  Get.dialog(CustomDialog(
      icon: Icons.email_rounded,
      iconColor: AppColor.primaryColor,
      title: "confirm_email".tr,
      content: "please_confirm".tr,
      buttonTitle: "ok".tr,
      onConfirm: () {
        Get.toNamed(AppRoute.confirmEmail,
            arguments: {"user_email": email});
      }));
}

incorrectEmailDialog() {
  Get.dialog(CustomDialog(
      icon: Icons.warning_rounded,
      iconColor: Colors.yellow,
      title: "warning".tr,
      content: "incorrect_email".tr,
      buttonTitle: "ok".tr,
      onConfirm: () {
        Get.back();
      }));
}
