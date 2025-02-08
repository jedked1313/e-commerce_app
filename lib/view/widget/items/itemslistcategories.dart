import 'package:e_commerce/controller/items_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/translatedata.dart';
import 'package:e_commerce/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsCategoriesList extends StatelessWidget {
  const ItemsCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 50,
      child: GetBuilder<ItemsController>(
        builder: (controller) => ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            width: 15,
          ),
          shrinkWrap: true,
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GetBuilder<ItemsController>(
              builder: (controller) => ItemCategory(
                  index: index,
                  categoriesModel:
                      CategoriesModel.fromJson(controller.categories[index])),
            );
          },
        ),
      ),
    );
  }
}

class ItemCategory extends GetView<ItemsController> {
  const ItemCategory(
      {super.key, required this.categoriesModel, required this.index});
  final CategoriesModel categoriesModel;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCategory(index, categoriesModel.id);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: controller.selectedCategory == index
                ? AppColor.primaryColor
                : AppColor.white,
            border: Border.all(color: AppColor.primaryColor, width: 2),
            borderRadius: BorderRadius.circular(12)),
        child: Text(
          "${translateData(categoriesModel.nameAr, categoriesModel.name)}",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: controller.selectedCategory == index
                  ? AppColor.white
                  : AppColor.primaryColor),
        ),
      ),
    );
  }
}
