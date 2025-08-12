import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class PromoCode extends StatelessWidget {
  const PromoCode({super.key, required this.promoCode});
  final String promoCode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(promoCode, style: Theme.of(context).textTheme.titleMedium),
        Row(
          children: [
            Text(
              "Promo Code ",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColor.primaryColor,
                  ),
            ),
            const Icon(Icons.check_circle_outline,
                color: AppColor.primaryColor),
          ],
        ),
      ],
    );
  }
}
