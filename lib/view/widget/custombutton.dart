import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.style,
      this.buttonColor,
      required this.text,
      required this.onPressed,
      this.horizontalPadding});
  final String text;
  final ButtonStyle? style;
  final Color? buttonColor;
  final void Function()? onPressed;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14))),
            padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                vertical: 20, horizontal: horizontalPadding ?? 0)),
            backgroundColor:
                WidgetStatePropertyAll(buttonColor ?? AppColor.primaryColor)),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w700, color: AppColor.white),
        ));
  }
}
