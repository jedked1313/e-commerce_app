import 'package:e_commerce/controller/rootscreen_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/customnavigationbar.dart';
import 'package:e_commerce/view/widget/home/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RootScreenController());
    return GetBuilder<RootScreenController>(
        builder: (controller) => Scaffold(
            backgroundColor: AppColor.ligthGrey,
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(
                    kBottomNavigationBarHeight + 5), // Add bottom space
                child: CustomAppBar()),
            body: controller.screens.elementAt(controller.currentScreen),
            bottomNavigationBar: const CustomNavigationBar()));
  }
}
