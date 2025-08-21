import 'package:e_commerce/controller/rootscreen_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootScreenController>(
      builder: (controller) => BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: controller.currentScreen,
        onTap: (value) {
          controller.changeScreen(value);
        },
        iconSize: 30,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.grey,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.house_fill),
            label: "home".tr,
          ),
          BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.bell), label: "notifications".tr),
          BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.person), label: "profile".tr),
          BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.settings), label: "settings".tr),
        ],
      ),
    );
  }
}
