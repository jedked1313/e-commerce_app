import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

failureSnackbar(String title, String text) {
  return Get.snackbar(
    title,
    text,
    backgroundColor: Colors.redAccent.withValues(alpha: 0.1),
    icon: const Icon(CupertinoIcons.xmark_circle, color: Colors.red),
    colorText: Colors.red,
  );
}
