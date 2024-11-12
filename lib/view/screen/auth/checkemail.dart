import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/controller/auth/checkemail_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/view/widget/auth/custemtitleauth.dart';
import 'package:e_commerce/view/widget/auth/customdivider.dart';
import 'package:e_commerce/view/widget/custombutton.dart';
import 'package:e_commerce/view/widget/customoutlinebutton.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    CheckEmailController controller = Get.put(CheckEmailController());
    return Scaffold(
      body: Center(
        child: Form(
          key: controller.formState,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            children: [
              CustomTitleAuth(
                  title: "verify_email".tr, body: "please_enter_digits".tr),
              OtpTextField(
                autoFocus: true,
                textStyle: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: AppColor.primaryColor),
                fieldWidth: 50,
                numberOfFields: 6,
                borderColor: AppColor.primaryColor,
                onSubmit: (String verificationCode) {
                  Get.toNamed(AppRoute.success,
                      arguments: "success_account".tr);
                },
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: CustomButton(
                    onPress: () {
                      controller.checkEmail();
                      // Get.toNamed(AppRoute.success,
                      //     arguments: "Your email was verified successfully");
                    },
                    text: "submit".tr),
              ),
              CustomDivider(text: "back_to_login".tr),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
