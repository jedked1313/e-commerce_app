import 'package:e_commerce/view/widget/requestwidgets/handlingdataicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/functions/validinput.dart';
import 'package:e_commerce/view/widget/auth/customfloatingbutton.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:e_commerce/view/widget/custombutton.dart';
import 'package:e_commerce/view/widget/auth/rememberme.dart';
import 'package:e_commerce/view/widget/auth/customdivider.dart';
import 'package:e_commerce/view/widget/auth/custemtitleauth.dart';
import 'package:e_commerce/view/widget/auth/custominputfield.dart';
import 'package:e_commerce/view/widget/auth/customtext.dart';
import 'package:e_commerce/view/widget/auth/socialmediabutton.dart';
import 'package:e_commerce/controller/auth/signup_controller.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return Scaffold(
      floatingActionButton: const CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      body: SafeArea(
        child: GetBuilder<SignupController>(
          builder: (controller) => HandlingDataIcons(
            isAuthRequest: true,
            statusRequests: controller.statusRequests,
            defaultWidget: Form(
              key: controller.formState,
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
                children: [
                  CustomTitleAuth(
                      title: "let_get_start".tr, body: "signup_and_we".tr),
                  CustomInputField(
                    valid: (value) {
                      return validInput(value!, 5, 255, "email");
                    },
                    icon: Icons.email_rounded,
                    hint: "enter_email".tr,
                    label: "email".tr,
                    controller: controller.email,
                  ),
                  CustomInputField(
                    valid: (value) {
                      return validInput(value!, 5, 30, "username");
                    },
                    icon: Icons.person_outline_rounded,
                    hint: "enter_username".tr,
                    label: "username".tr,
                    controller: controller.username,
                  ),
                  CustomInputField(
                    valid: (value) {
                      return validInput(value!, 5, 128, "password");
                    },
                    canCopyPaste: false,
                    icon: Icons.lock_outline_rounded,
                    hint: "enter_password".tr,
                    label: "password".tr,
                    controller: controller.password,
                    obscureText: controller.obscureText,
                    onTapShow: () {
                      controller.showPassword();
                    },
                  ),
                  CustomInputField(
                    valid: (value) {
                      if (value != controller.password.text) {
                        return "password_not_match".tr;
                      }
                      return validInput(value!, 5, 50, "password");
                    },
                    canCopyPaste: false,
                    icon: Icons.lock_outline_rounded,
                    hint: "confirm_your_password".tr,
                    label: "confirm_password".tr,
                    controller: controller.confirmPassword,
                    obscureText: controller.obscureText,
                    onTapShow: () {
                      controller.showPassword();
                    },
                  ),
                  RememberMe(onChecked: () {}),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                    child: CustomButton(
                      onPressed: () {
                        controller.signUp();
                      },
                      text: "sign_up".tr,
                    ),
                  ),
                  CustomDivider(
                    text: "or".tr,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaButton(
                          image: AppImageAsset.facebook, onPress: () {}),
                      SocialMediaButton(
                          image: AppImageAsset.google, onPress: () {}),
                      SocialMediaButton(
                          image: AppImageAsset.apple, onPress: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  CustomText(
                      titleOne: "already_have".tr,
                      titleTwo: "login".tr,
                      onTap: () {
                        Get.offNamed(AppRoute.login);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
