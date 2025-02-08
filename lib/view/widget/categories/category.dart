import 'package:e_commerce/controller/categories_controller.dart';
import 'package:e_commerce/core/constant/apilinks.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/translatedata.dart';
import 'package:e_commerce/data/model/categoriesmodel.dart';
import 'package:e_commerce/view/widget/customiconbutton.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

class Category extends StatelessWidget {
  const Category({super.key, required this.categoriesModel, this.index});
  final CategoriesModel categoriesModel;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: Get.height / 3.5,
      decoration: BoxDecoration(
        color: AppColor.generateColor(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: ExtendedImage.network(
              "${ApiLinks.root}${categoriesModel.image}",
              cache: true,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              blendMode: BlendMode.srcATop,
              filter: ImageFilter.blur(
                sigmaY: 5,
                sigmaX: 5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 80,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${translateData(categoriesModel.nameAr, categoriesModel.name)}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                        width: 100,
                        child: GetBuilder<CategoriesController>(
                          builder: (controller) => CustomIconButton(
                            color: AppColor.white,
                            onPressed: () {
                              controller.goToItems(
                                  translateData(categoriesModel.nameAr!,
                                      categoriesModel.name!),
                                  index!,
                                  categoriesModel.id.toString());
                            },
                            icon: const Icon(Icons.arrow_forward_ios_rounded,
                                size: 28),
                          ),
                        ))
                  ])),
        ],
      ),
    );
  }
}
