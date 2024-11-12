import 'package:e_commerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/functions/validinput.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:e_commerce/view/widget/custombutton.dart';
import 'package:e_commerce/view/widget/auth/customdivider.dart';
import 'package:e_commerce/view/widget/customoutlinebutton.dart';
import 'package:e_commerce/view/widget/auth/custemtitleauth.dart';
import 'package:e_commerce/view/widget/auth/custominputfield.dart';
import 'package:e_commerce/view/widget/auth/socialmediabutton.dart';
import 'package:e_commerce/controller/auth/forgotpassword_controller.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordController controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        children: [
          CustomTitleAuth(title: "forget".tr, body: "no_worries".tr),
          Form(
            key: controller.formState,
            child: CustomInputField(
              valid: (value) {
                return validInput(value!, 5, 20, "email");
              },
              icon: Icons.person_outline_rounded,
              hint: "enter_email".tr,
              label: "email".tr,
              controller: controller.email,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            child: CustomButton(
              onPress: () {
                controller.checkCode();
              },
              text: "submit".tr,
            ),
          ),
          CustomDivider(text: "or".tr),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialMediaButton(image: AppImageAsset.facebook, onPress: () {}),
              SocialMediaButton(image: AppImageAsset.google, onPress: () {}),
              SocialMediaButton(image: AppImageAsset.apple, onPress: () {}),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              textAlign: TextAlign.center,
              "dont_have".tr,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: CustomOutlineButton(
              onPress: () {
                Get.toNamed(AppRoute.signUp);
              },
              text: "sign_up".tr,
            ),
          ),
        ],
      ),
    );
  }
}
