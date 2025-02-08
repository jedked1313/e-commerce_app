import 'package:e_commerce/controller/favorites_controller.dart';
import 'package:e_commerce/core/constant/apilinks.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/translatedata.dart';
import 'package:e_commerce/data/model/favoritesmodel.dart';
import 'package:e_commerce/data/model/itemsmodel.dart';
import 'package:e_commerce/view/widget/customiconbutton.dart';
import 'package:e_commerce/view/widget/dialogs/favoritesdialogs.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteItem extends GetView<FavoritesController> {
  const FavoriteItem(
      {super.key,
      required this.favoritesModel,
      required this.index,
      required this.itemsModel});
  final FavoritesModel favoritesModel;
  final ItemsModel itemsModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goToItemDetails(itemsModel);
      },
      child: Container(
        height: 150,
        padding: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: AppColor.ligthGrey,
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(2, 3))
            ],
            border: Border.all(color: AppColor.grey, width: 1.5),
            borderRadius: BorderRadius.circular(14),
            color: AppColor.white),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      topLeft: Radius.circular(12)),
                  color: AppColor.primaryColor.withValues(alpha: 0.5)),
              child: ExtendedImage.network(
                "${ApiLinks.root}${favoritesModel.images!.first.image}",
                cache: true,
                fit: BoxFit.contain,
                height: 150,
                width: 120,
              )),
          Padding(
            padding: translateData(const EdgeInsets.only(right: 12, bottom: 5),
                const EdgeInsets.only(left: 12, bottom: 5)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 160,
                    child: Text(
                      translateData(favoritesModel.nameAr, favoritesModel.name),
                      style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Text(
                      translateData(favoritesModel.descriptionAr,
                          favoritesModel.description),
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColor.grey)),
                    child: Text(
                      "\$${favoritesModel.price}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  )
                ]),
          ),
          const Spacer(),
          CustomIconButton(
            color: AppColor.white,
            onPressed: () {
              confirmRemoveFavoriteDialog(favoritesModel.id);
            },
            icon: const Icon(color: Colors.red, CupertinoIcons.delete),
          ),
        ]),
      ),
    );
  }
}
