import 'package:e_commerce/controller/categories_controller.dart';
import 'package:e_commerce/view/widget/requestwidgets/handlingdataicons.dart';
import 'package:e_commerce/data/model/categoriesmodel.dart';
import 'package:e_commerce/view/widget/categories/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends GetView {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "categories".tr,
        ),
      ),
      body: GetBuilder<CategoriesController>(
          builder: (controller) => HandlingDataIcons(
                tryAgain: () => controller.getData(),
                statusRequests: controller.statusRequests,
                defaultWidget: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: Get.height,
                  child: ListView.builder(
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      return Category(
                        index: index,
                        categoriesModel: CategoriesModel.fromJson(
                            controller.categories[index]),
                      );
                    },
                  ),
                ),
              )),
    );
  }
}
