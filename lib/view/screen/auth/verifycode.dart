import 'package:e_commerce/view/widget/requestwidgets/handlingdataicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:e_commerce/controller/auth/verifycode_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/view/widget/auth/custemtitleauth.dart';
import 'package:e_commerce/view/widget/auth/customdivider.dart';
import 'package:e_commerce/view/widget/auth/customtext.dart';
import 'package:e_commerce/view/widget/customoutlinebutton.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeController());
    return Scaffold(
      body: GetBuilder<VerifyCodeController>(
        builder: (controller) => Center(
          child: HandlingDataIcons(
            isAuthRequest: true,
            statusRequests: controller.statusRequests,
            defaultWidget: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              children: [
                CustomTitleAuth(
                    title: "check_email".tr,
                    body:
                        "${"we_sent".tr} ${controller.email} ${"we_sent".tr}"),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: OtpTextField(
                    autoFocus: true,
                    textStyle: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: AppColor.primaryColor),
                    fieldWidth: 50,
                    numberOfFields: 5,
                    borderColor: AppColor.primaryColor,
                    onSubmit: (String verifyCode) {
                      controller.verifyCode({
                        "verifycode": verifyCode,
                        "user_email": controller.email,
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: CustomText(
                      titleOne: "didnt_receive".tr,
                      titleTwo: "send_again".tr,
                      onTap: () {}),
                ),
                CustomDivider(text: "back_to_login".tr),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: CustomOutlineButton(
                      onPress: () {
                        Get.offAllNamed(AppRoute.login);
                      },
                      text: "login".tr),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
