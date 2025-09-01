import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/data/datasource/static/onboardinglist.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/logout.dart';
import 'package:e_commerce/view/widget/dialogs/customdialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future confirmLogoutDialog() {
  return Get.dialog(
    CustomDialog(
      icon: CupertinoIcons.question,
      iconColor: Colors.red,
      buttonColor: Colors.red,
      title: "Confirm",
      content: "Are you sure you want to Logout ?",
      buttonTitle: "Yes",
      onConfirm: () {
        try {
          LogoutData logoutData = LogoutData(Get.find());
          logoutData.logoutData();
          myServices.sharedPreferences.clear();
          myServices.sharedPreferences.setInt("step", 1);
          Get.offAllNamed(AppRoute.login);
        } catch (e) {
          Get.snackbar(
            "Error",
            "Somthing wrong on logout, please check internet connection and try again",
            backgroundColor: Colors.redAccent,
          );
        }
      },
      onCancel: () {
        Get.back();
      },
    ),
  );
}
