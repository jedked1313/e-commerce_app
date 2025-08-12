import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/dialogs/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future sentCodeDialog() {
  return Get.dialog(CustomDialog(
      icon: Icons.check_rounded,
      iconColor: AppColor.primaryColor,
      title: "success".tr,
      content: "successfully send code",
      buttonTitle: "ok".tr,
      onConfirm: () {
        Get.back();
      }));
}

Future codeSentRecentlyDialog() {
  return Get.dialog(CustomDialog(
      icon: Icons.warning_rounded,
      iconColor: Colors.yellow,
      title: "warning".tr,
      content: "The verification code has already been sent to you.",
      buttonTitle: "ok".tr,
      onConfirm: () {
        Get.back();
      }));
}
