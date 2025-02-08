import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      this.onPressed,
      this.color,
      required this.icon,
      this.padding});
  final void Function()? onPressed;
  final Color? color;
  final Widget icon;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.all(padding ?? 12),
        iconSize: 30,
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(color ?? AppColor.ligthGrey)),
        icon: icon);
  }
}
