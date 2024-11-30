import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/localization/changelocale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageButton extends GetView<LocaleContoller> {
  const LanguageButton(
      {super.key,
      required this.title,
      required this.langCode,
      required this.image});
  final String title;
  final String image;
  final String langCode;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: AppColor.primaryColor,
      borderRadius: BorderRadius.circular(8),
      splashColor: AppColor.primaryColor,
      onTap: () {
        controller.changeLanguage(langCode);
        Get.back();
      },
      child: Container(
        padding: const EdgeInsets.all(7),
        height: Get.height / 5.5,
        width: Get.width / 2.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColor.primaryColor, width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  image,
                )),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ],
        ),
      ),
    );
  }
}
