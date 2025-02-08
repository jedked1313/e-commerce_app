import 'package:e_commerce/controller/favorites_controller.dart';
import 'package:e_commerce/controller/home_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/customiconbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends GetView<FavoritesController> {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController()); // must be Deleted
    return AppBar(
      backgroundColor: AppColor.white,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "delivery".tr,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColor.grey),
          ),
          Text(
            "address".tr,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
      leadingWidth: 85,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: CustomIconButton(
          color: AppColor.ligthGrey,
          icon: const Icon(
            CupertinoIcons.heart_fill,
            color: Colors.red,
          ),
          onPressed: () {
            controller.goToUserFavorites();
          },
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: CustomIconButton(
              onPressed: () {
                homeController.logout();
              },
              icon: const Icon(
                CupertinoIcons.bell,
                color: AppColor.black,
              )),
        )
      ],
    );
  }
}
