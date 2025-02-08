import 'package:e_commerce/view/screen/home.dart';
import 'package:e_commerce/view/screen/language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootScreenController extends GetxController {
  int currentScreen = 0;

  List<Widget> screens = [
    const Home(),
    const Center(child: Text("Cart")),
    const Language(),
    const Center(child: Text("Profile")),
  ];

  changeScreen(int index) {
    currentScreen = index;
    update();
  }
}
