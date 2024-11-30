import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdata_controller.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/signup.dart';
import 'package:e_commerce/view/widget/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  bool obscureText = true;
  StatusRequests? statusRequests;
  SignUpData signupData = SignUpData(Get.find());
  List data = [];

  showPassword() {
    obscureText = obscureText == true ? false : true;
    update();
  }

  signUp() async {
    if (formState.currentState!.validate()) {
      statusRequests = StatusRequests.loading;
      // Refresh UI and Display loading
      update();
      var response =
          await signupData.postData(username.text, email.text, password.text);
      statusRequests = handlingData(response);
      if (statusRequests == StatusRequests.success) {
        if (response['status'] == "success") {
          Get.dialog(CustomDialog(
            icon: Icons.check_rounded,
            title: "Success",
            content:
                "Your account has been created successfully, Please Confirm your email.",
            buttonTitle: "OK",
            onConfirm: () {
              Get.toNamed(AppRoute.confirmEmail,
                  arguments: {"user_email": email.text});
            },
          ));
        }
      } else {
        // Email is already registered
        Get.dialog(CustomDialog(
          icon: Icons.warning_rounded,
          iconColor: Colors.yellow,
          title: "Warning",
          content:
              "This Email is already Exists                              \n",
          buttonTitle: "OK",
          onConfirm: () {
            Get.back();
          },
        ));
        statusRequests == StatusRequests.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }
}
