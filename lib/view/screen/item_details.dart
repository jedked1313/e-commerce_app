import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/controller/itemdetails_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/priceafterdiscount.dart';
import 'package:e_commerce/core/functions/translatedata.dart';
import 'package:e_commerce/view/widget/custombutton.dart';
import 'package:e_commerce/view/widget/customiconbutton.dart';
import 'package:e_commerce/view/widget/item_details/item_images.dart';
import 'package:e_commerce/view/widget/item_details/itemoptions.dart';
import 'package:e_commerce/view/widget/item_details/itemtag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemDetailsController itemDetailsController = Get.put(
      ItemDetailsController(),
    );
    Get.lazyPut(
      () => CartController(),
    ); // Initiaize CartController after clicking add to cart
    return Scaffold(
      backgroundColor: AppColor.ligthGrey,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(15),
        child: CustomButton(
          text: "add_cart".tr,
          onPressed: () {
            Get.find<CartController>().addToCart(
              itemDetailsController.itemsModel.id.toString(),
            );
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  color: AppColor.white,
                  icon: Icon(CupertinoIcons.heart_solid, color: Colors.red),
                ),
                SizedBox(width: 10),
                CustomIconButton(
                  color: AppColor.white,
                  icon: Icon(Icons.ios_share_rounded, color: AppColor.black),
                ),
              ],
            ),
          ),
        ],
      ),
      body: GetBuilder<ItemDetailsController>(
        builder: (controller) => ListView(
          shrinkWrap: true,
          children: [
            const ItemImages(),
            Container(
              height: Get.height,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    child: Text(
                      "${translateData(controller.itemsModel.nameAr, controller.itemsModel.name)}",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemTag(
                        icon: const Icon(
                          Icons.star_rate_rounded,
                          color: Colors.greenAccent,
                        ),
                        widget: Row(
                          children: [
                            Text(
                              " 4.8 ",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              " 117 reviews",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                      ItemTag(
                        icon: const Icon(
                          CupertinoIcons.hand_thumbsup_fill,
                          color: AppColor.primaryColor,
                        ),
                        widget: Text(
                          " 94% ",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      ItemTag(
                        icon: const Icon(
                          CupertinoIcons.chat_bubble_text_fill,
                          color: AppColor.grey,
                        ),
                        widget: Text(
                          " 8 ",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  ItemOptions(list: controller.colorOptions),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding: EdgeInsets.only(
                      left: translateData(0.0, 15.0),
                      right: translateData(15.0, 0.0),
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.ligthGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "\$${priceAfterDiscount(controller.itemsModel.price, controller.itemsModel.discount)} ",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          " \$${controller.itemsModel.price}",
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.lineThrough,
                              ),
                        ),
                        const Spacer(),
                        CustomIconButton(
                          padding: 0,
                          icon: const Icon(
                            Icons.info_outline_rounded,
                            color: AppColor.grey,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${translateData(controller.itemsModel.descriptionAr, controller.itemsModel.description)}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
