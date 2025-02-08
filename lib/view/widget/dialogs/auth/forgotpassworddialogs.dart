import 'package:e_commerce/view/widget/dialogs/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future emailNotExists() {
  return Get.dialog(CustomDialog(
      icon: Icons.warning_rounded,
      iconColor: Colors.yellow,
      title: "warning".tr,
      content: "email_doesn't".tr,
      buttonTitle: "ok".tr,
      onConfirm: () {
        Get.back();
      }));
}
