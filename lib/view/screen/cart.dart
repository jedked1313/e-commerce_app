import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/cart/cart_item.dart';
import 'package:e_commerce/view/widget/cart/pricing_item.dart';
import 'package:e_commerce/view/widget/cart/promo_code.dart';
import 'package:e_commerce/view/widget/custombutton.dart';
import 'package:e_commerce/view/widget/requestwidgets/handlingdataicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: Text("cart".tr),
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<CartController>(
        builder: (controller) => HandlingDataIcons(
          statusRequests: controller.statusRequests,
          tryAgain: () => controller.getCartData(),
          defaultWidget: Container(
            color: Colors.white,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              children: [
                ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CartItem(
                        cartModel:
                            controller.cartItems[index], index: index);
                  },
                ),
                const PromoCode(
                  promoCode: "S3JMA7",
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const PricingItem(title: "Delivery Fee", value: "\$20"),
                    const SizedBox(height: 10),
                    const PricingItem(title: "Discount", value: "%20"),
                    const SizedBox(height: 10),
                    PricingItem(
                        title: "Total",
                        value:
                            "\$${controller.calculateTotalPrice().toString()}"),
                  ],
                ),
                const SizedBox(height: 10),
                Divider(
                  color: AppColor.grey.shade300,
                  thickness: 1,
                ),
                const SizedBox(height: 10),
                CustomButton(
                    text:
                        "Checkout for  \$${controller.calculateTotalPrice().toString()}",
                    onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
