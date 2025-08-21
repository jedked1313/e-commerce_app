import 'package:e_commerce/controller/favorites_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/translatedata.dart';
import 'package:e_commerce/data/model/itemsmodel.dart';
import 'package:e_commerce/view/widget/customiconbutton.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/controller/home_controller.dart';
import 'package:e_commerce/core/constant/apilinks.dart';
import 'package:get/get.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    FavoritesController favoritesController = Get.put(FavoritesController());
    return GetBuilder<HomeController>(
      builder: (controller) => GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 5,
              childAspectRatio: Get.width / (Get.height / 1.4),
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            favoritesController.isFavorite[controller.items[index]['id']] =
                controller.items[index]['isFavorite'];
            return HomeGridItems(
              itemsModel: ItemsModel.fromJson(controller.items[index]),
            );
          }),
    );
  }
}

class HomeGridItems extends GetView<HomeController> {
  const HomeGridItems({super.key, required this.itemsModel});
  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritesController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            controller.goToItemDetails(itemsModel);
          },
          child: Card(
            color: AppColor.ligthGrey,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ExtendedImage.network(
                    "${ApiLinks.root}${itemsModel.images!.first.image}",
                    cache: true,
                    fit: BoxFit.contain,
                    height: 150,
                    width: double.infinity,
                  ),
                ),
                GetBuilder<FavoritesController>(
                  builder: (controller) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomIconButton(
                      padding: 8,
                      color: AppColor.white,
                      onPressed: () {
                        if (controller.isFavorite[itemsModel.id] == 1) {
                          controller.setFavorite(itemsModel.id, 0);
                        } else {
                          controller.setFavorite(itemsModel.id, 1);
                        }
                      },
                      icon: controller.isFavorite[itemsModel.id] == 1
                          ? const Icon(
                              color: Colors.red, CupertinoIcons.heart_fill)
                          : const Icon(
                              color: AppColor.grey, CupertinoIcons.heart),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Text(
          "${translateData(itemsModel.nameAr, itemsModel.name)}",
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        RichText(
            text: TextSpan(
                text: "\$${itemsModel.price} ",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                text: " ${itemsModel.discount}\$",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.lineThrough),
              )
            ])),
      ],
    );
  }
}
