import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/core/constant/apilinks.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/data/model/cartmodel.dart';
import 'package:e_commerce/view/widget/customiconbutton.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  const CartItem({required this.cartModel, super.key, required this.index});
  final CartModel cartModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find<CartController>();
    return Container(
      padding: const EdgeInsets.all(5),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColor.ligthGrey, width: 1),
          ),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Card(
                    elevation: 0,
                    color: AppColor.grey.shade200,
                    child: ExtendedImage.network(
                      "${ApiLinks.root}${cartModel.items?.singleImage?.image}",
                      cache: true,
                      height: Get.height * 0.15,
                    ))),
            const SizedBox(width: 10),
            Expanded(
                flex: 2,
                child: SizedBox(
                  height: Get.height * 0.15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(cartModel.items!.name ?? "No Name"),
                          CustomIconButton(
                            onPressed: () =>
                                controller.removeItemFromCart(index),
                            icon: const Icon(Icons.cancel_outlined),
                            padding: 0,
                            color: AppColor.white,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$${cartModel.items!.price.toString()}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              CustomIconButton(
                                onPressed: () {
                                  controller.decreaseQuantity(index);
                                },
                                icon: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColor.grey, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Icon(Icons.remove)),
                                padding: 0,
                                color: AppColor.white,
                              ),
                              const SizedBox(width: 10),
                              GetBuilder<CartController>(
                                builder: (controller) => Text(
                                  cartModel.quantity.toString(),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              const SizedBox(width: 10),
                              CustomIconButton(
                                onPressed: () {
                                  controller.increaseQuantity(
                                    index,
                                  );
                                },
                                icon: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.primaryColor,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Icon(
                                    Icons.add,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                                padding: 0,
                                color: AppColor.white,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
