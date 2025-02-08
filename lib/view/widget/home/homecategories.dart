import 'package:e_commerce/controller/home_controller.dart';
import 'package:e_commerce/core/constant/apilinks.dart';
import 'package:e_commerce/core/functions/translatedata.dart';
import 'package:e_commerce/data/model/categoriesmodel.dart';
import 'package:e_commerce/view/widget/customiconbutton.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 150,
      child: GetBuilder<HomeController>(
        builder: (controller) => ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            width: 15,
          ),
          shrinkWrap: true,
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return HomeCategory(
                index: index,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]));
          },
        ),
      ),
    );
  }
}

class HomeCategory extends GetView<HomeController> {
  const HomeCategory(
      {super.key, required this.categoriesModel, required this.index});
  final CategoriesModel categoriesModel;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomIconButton(
              onPressed: () {
                controller.goToItems(
                    controller.categories,
                    index!,
                    categoriesModel.id.toString(),
                    translateData(
                        categoriesModel.nameAr!, categoriesModel.name!));
              },
              padding: 10,
              icon: ExtendedImage.network(
                "${ApiLinks.root}${categoriesModel.image}",
                cache: true,
                height: 100,
                width: 100,
              )),
          Text(
            "${translateData(categoriesModel.nameAr, categoriesModel.name)}",
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
