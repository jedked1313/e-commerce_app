import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColor.white,
      onPressed: () {
        Get.toNamed(AppRoute.language);
      },
      child: const Icon(
        Icons.outlined_flag_rounded,
        size: 50,
        color: AppColor.primaryColor,
      ),
    );
  }
}
