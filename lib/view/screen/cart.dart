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
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: GetBuilder<CartController>(
          builder: (controller) => CustomButton(
            horizontalPadding: 50,
            text: "Checkout for  \$${controller.totalPrice}",
            onPressed: () {},
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(title: Text("cart".tr), backgroundColor: Colors.white),
      body: GetBuilder<CartController>(
        builder: (controller) => HandlingDataIcons(
          statusRequests: controller.statusRequests,
          tryAgain: () => controller.getCartData(),
          defaultWidget: Container(
            color: Colors.white,
            child: ListView(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 100),
              children: [
                ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CartItem(
                      cartModel: controller.cartItems[index],
                      index: index,
                    );
                  },
                ),
                PromoCode(),
                Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PricingItem(
                      title: "Delivery Fee",
                      value: "\$${controller.shippingFees}",
                    ),
                    PricingItem(
                      title: "Discount",
                      value: "%${controller.discount}",
                    ),
                    PricingItem(
                      title: "Subtotal",
                      value: "\$${controller.beforeDiscountPrice}",
                    ),
                    PricingItem(
                      title: "Total",
                      value: "\$${controller.totalPrice}",
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Divider(color: AppColor.grey.shade300, thickness: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
