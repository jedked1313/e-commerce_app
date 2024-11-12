import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.style, required this.text, required this.onPress});
  final String text;
  final ButtonStyle? style;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14))),
            padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 20)),
            backgroundColor:
                const WidgetStatePropertyAll(AppColor.primaryColor)),
        onPressed: onPress,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w700, color: AppColor.white),
        ));
  }
}