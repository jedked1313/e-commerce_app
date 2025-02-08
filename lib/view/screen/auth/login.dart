import 'package:e_commerce/view/widget/auth/customfloatingbutton.dart';
import 'package:e_commerce/view/widget/requestwidgets/handlingdataicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/functions/validinput.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:e_commerce/controller/auth/login_controller.dart';
import 'package:e_commerce/view/widget/auth/custemtitleauth.dart';
import 'package:e_commerce/view/widget/auth/custominputfield.dart';
import 'package:e_commerce/view/widget/auth/customtext.dart';
import 'package:e_commerce/view/widget/auth/socialmediabutton.dart';
import 'package:e_commerce/view/widget/auth/customdivider.dart';
import 'package:e_commerce/view/widget/auth/rememberme.dart';
import 'package:e_commerce/view/widget/custombutton.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: const CustomFloatingButton(),
      body: GetBuilder<LoginController>(
        builder: (controller) => HandlingDataIcons(
          isAuthRequest: true,
          statusRequests: controller.statusRequests,
          defaultWidget: Form(
            key: controller.formState,
            child: ListView(
              padding: const EdgeInsets.only(
                left: 18,
                right: 18,
                top: 50,
              ),
              children: [
                CustomTitleAuth(title: "welcome".tr, body: "please_enter".tr),
                CustomInputField(
                  valid: (value) {
                    return validInput(value!, 5, 255, "email");
                  },
                  icon: Icons.person_outline_rounded,
                  hint: "enter_email".tr,
                  label: "email".tr,
                  controller: controller.email,
                ),
                GetBuilder<LoginController>(
                  builder: (controller) => CustomInputField(
                    valid: (value) {
                      return validInput(value!, 5, 128, "password");
                    },
                    icon: Icons.lock_outline_rounded,
                    hint: "enter_password".tr,
                    label: "password".tr,
                    controller: controller.password,
                    obscureText: controller.obscureText,
                    onTapShow: () {
                      controller.showPassword();
                    },
                  ),
                ),
                InkWell(
                  child: Text(
                    "forget_password".tr,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.end,
                  ),
                  onTap: () {
                    controller.goToForgotPassword();
                  },
                ),
                RememberMe(onChecked: () {}),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CustomButton(
                    onPressed: () {
                      controller.login();
                    },
                    text: "login".tr,
                  ),
                ),
                CustomDivider(text: "or".tr),
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
                    titleOne: "dont_have".tr,
                    titleTwo: "sign_up".tr,
                    onTap: () {
                      controller.goToSignUp();
                    }),
                const SizedBox(
                  height: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
