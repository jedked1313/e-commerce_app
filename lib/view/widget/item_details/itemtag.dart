import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class ItemTag extends StatelessWidget {
  const ItemTag({super.key, required this.icon, required this.widget});
  final Widget icon;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColor.ligthGrey, width: 2)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          icon,
          widget,
        ],
      ),
    );
  }
}
