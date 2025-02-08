import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/view/widget/dialogs/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future accountCreatedDialog(TextEditingController email) async {
  return Get.dialog(CustomDialog(
    icon: Icons.check_rounded,
    title: "success".tr,
    content: "account_created".tr,
    buttonTitle: "ok".tr,
    onConfirm: () {
      Get.toNamed(AppRoute.confirmEmail, arguments: {"user_email": email.text});
    },
  ));
}

Future emailExistsDialog() {
  return Get.dialog(CustomDialog(
    icon: Icons.warning_rounded,
    iconColor: Colors.yellow,
    title: "warning".tr,
    content: "email_exists".tr,
    buttonTitle: "ok".tr,
    onConfirm: () {
      Get.back();
    },
  ));
}
