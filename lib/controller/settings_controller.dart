import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/view/widget/dialogs/confirmlogoutdialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  List settingsList = [
    {
      "name": "language".tr,
      "icon": CupertinoIcons.flag,
      "ontap": () => Get.toNamed(AppRoute.language),
    },
    {
      "name": "Dark Mode",
      "icon": CupertinoIcons.moon,
      "ontap": () => {},
    },
    {
      "name": "Rate App",
      "icon": CupertinoIcons.star,
      "ontap": () => {},
    },
    {
      "name": "Share App",
      "icon": CupertinoIcons.share,
      "ontap": () => {},
    },
    {
      "name": "Privacy Policy",
      "icon": CupertinoIcons.lock,
      "ontap": () => {},
    },
    {
      "name": "Terms and Conditions",
      "icon": CupertinoIcons.doc,
      "ontap": () => {},
    },
    {
      "name": "About",
      "icon": CupertinoIcons.info,
      "ontap": () {},
    },
    {
      "name": "Contact",
      "icon": CupertinoIcons.mail,
      "ontap": () {},
    },
    {
      "name": "Logout",
      "icon": Icons.logout_rounded,
      "ontap": () => confirmLogoutDialog(),
    }
  ];
}
