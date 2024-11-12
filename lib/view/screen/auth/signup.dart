import 'package:e_commerce/core/functions/validinput.dart';
import 'package:e_commerce/view/widget/customfloatingbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:e_commerce/view/widget/custombutton.dart';
import 'package:e_commerce/view/widget/auth/rememberme.dart';
import 'package:e_commerce/view/widget/auth/customdivider.dart';
import 'package:e_commerce/view/widget/auth/custemtitleauth.dart';
import 'package:e_commerce/view/widget/auth/custominputfield.dart';
import 'package:e_commerce/view/widget/auth/customtextsigning.dart';
import 'package:e_commerce/view/widget/auth/socialmediabutton.dart';
import 'package:e_commerce/controller/auth/signup_controller.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController controller = Get.put(SignupController());
    return Scaffold(
      floatingActionButton: const CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      body: SafeArea(
        child: Form(
          key: controller.formState,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            children: [
              CustomTitleAuth(
                  title: "let_get_start".tr, body: "signup_and_we".tr),
              CustomInputField(
                valid: (value) {
                  return validInput(value!, 5, 20, "email");
                },
                icon: Icons.email_rounded,
                hint: "enter_email".tr,
                label: "email".tr,
                controller: controller.email,
              ),
              CustomInputField(
                valid: (value) {
                  return validInput(value!, 5, 20, "username");
                },
                icon: Icons.person_outline_rounded,
                hint: "enter_username".tr,
                label: "username".tr,
                controller: controller.username,
              ),
              GetBuilder<SignupController>(
                  builder: (controller) => CustomInputField(
                        valid: (value) {
                          return validInput(value!, 5, 20, "password");
                        },
                        icon: Icons.lock_outline_rounded,
                        hint: "enter_password".tr,
                        label: "password".tr,
                        controller: controller.password,
                        obscureText: controller.obscureText,
                        onTapShow: () {
                          controller.showPassword();
                        },
                      )),
              GetBuilder<SignupController>(
                  builder: (controller) => CustomInputField(
                        valid: (value) {
                          return validInput(value!, 5, 20, "password");
                        },
                        icon: Icons.lock_outline_rounded,
                        hint: "confirm_your_password".tr,
                        label: "confirm_password".tr,
                        controller: controller.confirmPassword,
                        obscureText: controller.obscureText,
                        onTapShow: () {
                          controller.showPassword();
                        },
                      )),
              RememberMe(onChecked: () {}),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                child: CustomButton(
                  onPress: () {
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
                  SocialMediaButton(image: AppImageAsset.apple, onPress: () {}),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              CustomTextSigning(
                  titleOne: "already_have".tr,
                  titleTwo: "login".tr,
                  onTap: () {
                    Get.offNamed(AppRoute.login);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
