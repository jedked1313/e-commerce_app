import 'package:e_commerce/controller/auth/resetpassword_controller.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/validinput.dart';
import 'package:e_commerce/view/widget/auth/custemtitleauth.dart';
import 'package:e_commerce/view/widget/auth/custominputfield.dart';
import 'package:e_commerce/view/widget/auth/customdivider.dart';
import 'package:e_commerce/view/widget/custombutton.dart';
import 'package:e_commerce/view/widget/customoutlinebutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordController controller = Get.put(ResetPasswordController());
    return Scaffold(
      body: Center(
        child: Form(
          key: controller.formState,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            children: [
              CustomTitleAuth(title: "set_new_password".tr, body: "must_be".tr),
              GetBuilder<ResetPasswordController>(
                  builder: (controller) => CustomInputField(
                        valid: (value) {
                          return validInput(value!, 5, 20, "password");
                        },
                        icon: Icons.lock_outline_rounded,
                        hint: "at_least".tr,
                        label: "new_password".tr,
                        controller: controller.password,
                        obscureText: controller.obscureText,
                        onTapShow: () {
                          controller.showPassword();
                        },
                      )),
              GetBuilder<ResetPasswordController>(
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
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                child: CustomButton(
                  onPress: () {
                    controller.resetPassword();
                  },
                  text: "submit".tr,
                ),
              ),
              CustomDivider(text: "back_to_login".tr),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                child: CustomOutlineButton(
                    text: "login".tr,
                    onPress: () {
                      Get.offAllNamed(AppRoute.login);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}