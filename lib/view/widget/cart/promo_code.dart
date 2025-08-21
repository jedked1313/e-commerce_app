import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class PromoCode extends StatelessWidget {
  const PromoCode({super.key, required this.promoCode});
  final String promoCode;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            promoCode,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColor.primaryColor,
                ),
          ),
          Row(
            children: [
              Text("  Promo Code  ",
                  style: Theme.of(context).textTheme.titleMedium),
              const Icon(Icons.check_circle_outline,
                  color: AppColor.primaryColor),
            ],
          ),
        ],
      ),
    );
  }
}
