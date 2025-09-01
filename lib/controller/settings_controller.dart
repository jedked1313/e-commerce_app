import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/data/model/settingsmodel.dart';
import 'package:e_commerce/view/widget/dialogs/confirmlogoutdialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  bool isDarkMode = false;

  void toggleDarkMode(bool state) {
    isDarkMode = state;
    update();

    // optional: apply app-wide theme
    // Get.changeThemeMode(state ? ThemeMode.dark : ThemeMode.light);
  }

  List<SettingsModel> get settingsList => [
    SettingsModel(
      title: "language".tr,
      leadingIcon: const Icon(CupertinoIcons.flag, size: 30),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => Get.toNamed(AppRoute.language),
    ),
    SettingsModel(
      title: "dark_mode".tr,
      leadingIcon: const Icon(CupertinoIcons.moon, size: 30),
    ),
    SettingsModel(
      title: "contact".tr,
      leadingIcon: const Icon(CupertinoIcons.mail, size: 30),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () {},
    ),
    SettingsModel(
      title: "rate_app".tr,
      leadingIcon: const Icon(CupertinoIcons.star, size: 30),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () {},
    ),
    SettingsModel(
      title: "share_app".tr,
      leadingIcon: const Icon(CupertinoIcons.share, size: 30),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () {},
    ),
    SettingsModel(
      title: "privacy_policy".tr,
      leadingIcon: const Icon(CupertinoIcons.lock, size: 30),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () {},
    ),
    SettingsModel(
      title: "terms_conditions".tr,
      leadingIcon: const Icon(CupertinoIcons.doc, size: 30),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () {},
    ),
    SettingsModel(
      title: "about".tr,
      leadingIcon: const Icon(CupertinoIcons.info, size: 30),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () {},
    ),
    SettingsModel(
      title: "logout".tr,
      leadingIcon: const Icon(Icons.logout_rounded, size: 30),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => confirmLogoutDialog(),
    ),
  ];
}
