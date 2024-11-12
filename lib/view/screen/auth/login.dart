import 'package:e_commerce/view/widget/customfloatingbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/validinput.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:e_commerce/controller/auth/login_controller.dart';
import 'package:e_commerce/view/widget/auth/custemtitleauth.dart';
import 'package:e_commerce/view/widget/auth/custominputfield.dart';
import 'package:e_commerce/view/widget/auth/customtextsigning.dart';
import 'package:e_commerce/view/widget/auth/socialmediabutton.dart';
import 'package:e_commerce/view/widget/auth/customdivider.dart';
import 'package:e_commerce/view/widget/auth/rememberme.dart';
import 'package:e_commerce/view/widget/custombutton.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: const CustomFloatingButton(),
      body: Form(
        key: controller.formState,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          children: [
            CustomTitleAuth(title: "welcome".tr, body: "please_enter".tr),
            CustomInputField(
              valid: (value) {
                return validInput(value!, 5, 20, "email");
              },
              icon: Icons.person_outline_rounded,
              hint: "enter_email".tr,
              label: "email".tr,
              controller: controller.email,
            ),
            GetBuilder<LoginController>(
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
              ),
            ),
            InkWell(
              child: Text(
                "forget_password".tr,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.end,
              ),
              onTap: () {
                Get.toNamed(AppRoute.forgotPassword);
              },
            ),
            RememberMe(onChecked: () {}),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CustomButton(
                onPress: () {
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
                SocialMediaButton(image: AppImageAsset.google, onPress: () {}),
                SocialMediaButton(image: AppImageAsset.apple, onPress: () {}),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            CustomTextSigning(
                titleOne: "dont_have".tr,
                titleTwo: "sign_up".tr,
                onTap: () {
                  Get.offNamed(AppRoute.signUp);
                }),
            const SizedBox(
              height: 22,
            ),
          ],
        ),
      ),
    );
  }
}