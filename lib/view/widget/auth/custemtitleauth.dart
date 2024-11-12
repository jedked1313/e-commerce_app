import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTitleAuth extends StatelessWidget {
  const CustomTitleAuth({super.key, required this.title, required this.body});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.w900),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          body,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColor.grey),
        ),
        const SizedBox(
          height: 45,
        ),
      ],
    );
  }
}
