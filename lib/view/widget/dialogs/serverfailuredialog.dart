import 'package:e_commerce/view/widget/dialogs/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

serverFailureDialog() {
  Get.dialog(CustomDialog(
      icon: Icons.not_interested_outlined,
      iconColor: Colors.red,
      title: "server_failure".tr,
      content: "we're_sorry".tr,
      buttonTitle: "ok".tr,
      onConfirm: () {
        Get.back();
      }));
}
