import 'package:e_commerce/view/screen/home.dart';
import 'package:e_commerce/view/screen/notifications.dart';
import 'package:e_commerce/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootScreenController extends GetxController {
  int currentScreen = 0;

  List<Widget> screens = [
    const Home(),
    const Notifications(),
    const Center(child: Text("Profile")),
    const Settings(),
  ];

  changeScreen(int index) {
    currentScreen = index;
    update();
  }
}
