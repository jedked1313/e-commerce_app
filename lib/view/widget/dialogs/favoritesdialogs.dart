import 'package:e_commerce/view/widget/dialogs/customdialog.dart';
import 'package:e_commerce/controller/favorites_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future confirmRemoveFavoriteDialog(itemId) {
  return Get.dialog(CustomDialog(
      icon: CupertinoIcons.question,
      iconColor: Colors.red,
      title: "Confirm",
      content: "Are you sure you want to remove $itemId item form favorites ?",
      buttonTitle: "Yes",
      onConfirm: () {
        FavoritesController controller = Get.find<FavoritesController>();
        controller.addOrRemoveFavorite(itemId);
      },
      onCancel: () {
        Get.back();
      }));
}
