import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:e_commerce/view/widget/dialogs/customdialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future confirmLogoutDialog() {
  return Get.dialog(CustomDialog(
      icon: CupertinoIcons.question,
      iconColor: Colors.red,
      buttonColor: Colors.red,
      title: "Confirm",
      content: "Are you sure you want to Logout ?",
      buttonTitle: "Yes",
      onConfirm: () {
        myServices.sharedPreferences.clear();
        myServices.sharedPreferences.setInt("step", 1);
        Get.offAllNamed(AppRoute.login);
      },
      onCancel: () {
        Get.back();
      }));
}
