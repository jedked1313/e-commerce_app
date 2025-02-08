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
        selectedFontSize: 18,
        unselectedFontSize: 14,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.grey,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_rounded),
            label: "home".tr,
          ),
          BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.cart), label: "cart".tr),
          BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.settings), label: "settings".tr),
          BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.profile_circled),
              label: "profile".tr)
        ],
      ),
    );
  }
}
