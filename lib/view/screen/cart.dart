import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/cart/cart_item.dart';
import 'package:e_commerce/view/widget/cart/pricing_item.dart';
import 'package:e_commerce/view/widget/cart/promo_code.dart';
import 'package:e_commerce/view/widget/custombutton.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        children: [
          ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return const CartItem();
            },
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            child: const PromoCode(
              promoCode: "SJ7SJ3",
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PricingItem(title: "Subtotal", value: "\$450"),
              SizedBox(height: 10),
              PricingItem(title: "Delivery Fee", value: "\$20"),
              SizedBox(height: 10),
              PricingItem(title: "Discount", value: "%20")
            ],
          ),
          const SizedBox(height: 10),
          Divider(
            color: AppColor.grey.shade300,
            thickness: 1,
          ),
          const SizedBox(height: 10),
          CustomButton(text: "Checkout for  \$450", onPressed: () {})
        ],
      ),
    );
  }
}
