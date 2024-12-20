import 'package:e_commerce/view/widget/custombutton.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void exitAlert(context) {
  Get.defaultDialog(
      title: "Exit",
      middleText: "Are you sure you want to close app ?",
      actions: [
        CustomButton(
            text: "Yes",
            onPressed: () {
              SystemNavigator.pop();
            }),
        CustomButton(
            text: "Cancel",
            onPressed: () {
              Get.back();
            }),
      ]);
}
