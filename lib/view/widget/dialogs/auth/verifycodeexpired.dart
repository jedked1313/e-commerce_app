import 'package:e_commerce/view/widget/dialogs/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future verifyCodeExpiredDialog() {
  return Get.dialog(CustomDialog(
      icon: Icons.not_interested_rounded,
      iconColor: Colors.red,
      title: "warning".tr,
      content: "This verification code has expired. Please request a new one.",
      buttonTitle: "ok".tr,
      onConfirm: () {
        Get.back();
      }));
}
