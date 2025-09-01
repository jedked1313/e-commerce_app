import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

successfulSnackbar(String title, String text) {
  return Get.snackbar(
    title,
    text,
    backgroundColor: AppColor.primaryColor.withValues(alpha: 0.1),
    icon: const Icon(
      CupertinoIcons.check_mark_circled,
      color: AppColor.primaryColor,
    ),
    colorText: AppColor.primaryColor,
  );
}
