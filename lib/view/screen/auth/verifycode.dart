import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:e_commerce/controller/auth/verifycode_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/view/widget/auth/custemtitleauth.dart';
import 'package:e_commerce/view/widget/auth/customdivider.dart';
import 'package:e_commerce/view/widget/auth/customtextsigning.dart';
import 'package:e_commerce/view/widget/customoutlinebutton.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeController controller = Get.put(VerifyCodeController());
    return Scaffold(
      body: Center(
        child: Form(
          key: controller.formState,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            children: [
              CustomTitleAuth(title: "check_email".tr, body: "we_sent".tr),
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
                  Get.toNamed(AppRoute.resetPassword);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: CustomTextSigning(
                    titleOne: "didnt_receive".tr,
                    titleTwo: "send_again".tr,
                    onTap: () {}),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomDivider(text: "back_to_login".tr),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
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
    );
  }
}