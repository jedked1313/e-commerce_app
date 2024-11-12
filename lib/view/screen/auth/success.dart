import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/view/widget/custombutton.dart';
import 'package:e_commerce/view/widget/auth/custemtitleauth.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Get.arguments;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColor.primaryColor.withOpacity(0.2)),
              child: Icon(
                Icons.check_rounded,
                color: AppColor.primaryColor,
                size: Get.width / 2,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: CustomTitleAuth(
                  title: "success".tr, body: text ?? "the_operation".tr),
            ),
            SizedBox(
              width: Get.width / 1.5,
              child: CustomButton(
                  onPress: () {
                    Get.offAllNamed(AppRoute.login);
                  },
                  text: "continue".tr),
            ),
          ],
        ),
      ),
    );
  }
}
