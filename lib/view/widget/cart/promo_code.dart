import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/auth/custominputfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromoCode extends StatelessWidget {
  PromoCode({super.key});
  final TextEditingController coupon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Promo Code", style: Theme.of(context).textTheme.titleMedium),
          controller.discount != 0.0
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Row(
                    spacing: 5,
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: AppColor.primaryColor,
                      ),
                      Text(
                        controller.coupon.text,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(color: AppColor.primaryColor),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: CustomInputField(
                    bottomMargin: 0,
                    controller: controller.coupon,
                    valid: (value) => null,
                    onFieldSubmitted: (val) {
                      controller.checkCoupon(controller.coupon.text);
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
