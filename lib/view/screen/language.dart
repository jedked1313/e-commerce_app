import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:e_commerce/view/widget/language/languagebutton.dart';
import 'package:get/get_utils/get_utils.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("language".tr)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "choose_lang".tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: AppColor.primaryColor),
            ),
            const SizedBox(
              height: 22,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LanguageButton(
                    title: "English",
                    langCode: "en",
                    image: AppImageAsset.engilsh),
                SizedBox(
                  width: 15,
                ),
                LanguageButton(
                  title: "العربية",
                  langCode: "ar",
                  image: AppImageAsset.arabic,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
