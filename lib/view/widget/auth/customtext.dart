import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.titleOne,
      required this.titleTwo,
      required this.onTap});
  final String titleOne;
  final String titleTwo;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titleOne,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            titleTwo,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColor.primaryColor, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
