import 'package:e_commerce/controller/favorites_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/data/model/favoritesmodel.dart';
import 'package:e_commerce/data/model/itemsmodel.dart';
import 'package:e_commerce/view/widget/favorites/favoriteitem.dart';
import 'package:e_commerce/view/widget/requestwidgets/handlingdataicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorites extends GetView<FavoritesController> {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritesController());
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text("favorites".tr),
      ),
      body: GetBuilder<FavoritesController>(
        builder: (controller) => HandlingDataIcons(
          tryAgain: () => controller.getFavorites(),
          statusRequests: controller.statusRequests,
          defaultWidget: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            height: Get.height,
            child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: controller.favorites.length,
                itemBuilder: (context, index) {
                  return FavoriteItem(
                    index: index,
                    favoritesModel:
                        FavoritesModel.fromJson(controller.favorites[index]),
                    itemsModel:
                        ItemsModel.fromJson(controller.favorites[index]),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
