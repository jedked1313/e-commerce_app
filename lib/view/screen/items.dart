import 'package:e_commerce/controller/items_controller.dart';
import 'package:e_commerce/view/widget/requestwidgets/handlingdataicons.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/custominputfield.dart';
import 'package:e_commerce/view/widget/items/itemsgrid.dart';
import 'package:e_commerce/view/widget/items/itemslistcategories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends GetView<ItemsController> {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());
    return Scaffold(
      backgroundColor: AppColor.ligthGrey,
      appBar: AppBar(
        title: Text(controller.getAppBarTitle(Get.arguments ?? "")),
        surfaceTintColor: AppColor.white,
        backgroundColor: AppColor.white,
      ),
      body: GetBuilder<ItemsController>(
        builder: (controller) => HandlingDataIcons(
            tryAgain: () => controller.tryAgain(Get.arguments ?? {}),
            statusRequests: controller.statusRequests,
            defaultWidget: Column(children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18))),
                child: Column(
                  children: [
                    CustomInputField(
                        bottomMargin: 4,
                        textAlign: TextAlign.center,
                        icon: Icons.search,
                        hint: "search".tr,
                        controller: controller.searchController,
                        onFieldSubmitted: (String? query) {
                          controller.searchForItems(query);
                        },
                        valid: (val) {
                          return null;
                        }),
                    controller.categories.isEmpty
                        ? const SizedBox.shrink() // From discounted items
                        : const ItemsCategoriesList(), // From specific category items
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    height: Get.height,
                    margin: const EdgeInsets.only(top: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: const BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18))),
                    child: const ItemsGrid()),
              ),
            ])),
      ),
    );
  }
}
