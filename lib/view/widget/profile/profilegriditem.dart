import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileGridItem extends StatelessWidget {
  const ProfileGridItem(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap});
  final String title;
  final String image;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.ligthGrey, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              height: 50,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }
}
