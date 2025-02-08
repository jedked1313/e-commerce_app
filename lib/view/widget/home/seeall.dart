import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w900)),
        TextButton.icon(
          iconAlignment: IconAlignment.end,
          onPressed: onPressed,
          icon: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: AppColor.ligthGrey,
                borderRadius: BorderRadius.circular(25)),
            child: const Icon(
              CupertinoIcons.forward,
              size: 18,
              color: AppColor.black,
            ),
          ),
          label: Text(
            "seeall".tr,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold, color: AppColor.grey),
          ),
        )
      ],
    );
  }
}
