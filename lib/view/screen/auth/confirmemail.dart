import 'package:e_commerce/view/widget/auth/customtext.dart';
import 'package:e_commerce/view/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/controller/auth/confirmemail_controller.dart';
import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/view/widget/auth/custemtitleauth.dart';
import 'package:e_commerce/view/widget/auth/customdivider.dart';
import 'package:e_commerce/view/widget/customoutlinebutton.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class ConfirmEmail extends StatelessWidget {
  const ConfirmEmail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ConfirmEmailController());
    return Scaffold(
      body: GetBuilder<ConfirmEmailController>(
        builder: (controller) => Center(
          child: controller.statusRequests == StatusRequests.loading
              ? const Loading()
              : ListView(
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  children: [
                    CustomTitleAuth(
                        title: "confirm_email".tr,
                        body:
                            "${"please_enter_digits".tr} ${controller.email}"),
                    OtpTextField(
                      autoFocus: true,
                      textStyle: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: AppColor.primaryColor),
                      fieldWidth: 50,
                      numberOfFields: 5,
                      borderColor: AppColor.primaryColor,
                      onSubmit: (String verifyCode) {
                        controller.confirmEmail({
                          "success_text": "success_account".tr,
                          "verifycode": verifyCode,
                          "from_confirm": 1, // Used to redirect user to Home
                        });
                      },
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: CustomOutlineButton(
                        onPress: () {
                          Get.offAllNamed(AppRoute.login);
                        },
                        text: "login".tr,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
