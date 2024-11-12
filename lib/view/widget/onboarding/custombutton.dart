import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOnBoardingButton extends StatelessWidget {
  const CustomOnBoardingButton({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 1.5,
      padding: const EdgeInsets.all(10),
      child: TextButton(
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14))),
            backgroundColor:
                const WidgetStatePropertyAll(AppColor.primaryColor)),
        onPressed: onPressed,
        child: Text(
          "continue".tr,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColor.white),
        ),
      ),
    );
  }
}
