import 'package:e_commerce/core/class/resendandcheckcode.dart';
import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdata_controller.dart';
import 'package:e_commerce/core/functions/storeuserinfo.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/confirmemail.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/sendcodeagain.dart';
import 'package:e_commerce/view/widget/dialogs/auth/verifycodeexpired.dart';
import 'package:e_commerce/view/widget/dialogs/auth/wrongcodedialog.dart';
import 'package:get/get.dart';

class ConfirmEmailController extends GetxController {
  ConfirmEmailData confirmEmailData = ConfirmEmailData(Get.find());
  SendCodeAgainData sendCodeAgainData = SendCodeAgainData(Get.find());
  StatusRequests statusRequests = StatusRequests.none;
  String? email;

  confirmEmail(args) async {
    statusRequests = StatusRequests.loading;
    // Refresh UI and Display loading
    update();
    var response =
        await confirmEmailData.getConfirmEmailData(email!, args['verifycode']);
    statusRequests = handlingData(response);
    if (statusRequests == StatusRequests.success) {
      // Check if the verification code has expired
      if (ResendAndCheckCode.isCodeExpired(response)) {
        verifyCodeExpiredDialog();
      } else {
        // If the user enters correct data
        storeUserInfo(response); // Save user info to local storage
        // Redirect to the success page
        Get.toNamed(AppRoute.success, arguments: args);
      }
    } else if (statusRequests == StatusRequests.failure) {
      // If verification code is wrong
      wrongCodeDialog();
    }
    update();
  }

  resendCode() async {
    ResendAndCheckCode.resendCode(
        statusRequests: statusRequests,
        email: email,
        sendCodeAgainData: sendCodeAgainData);
  }

  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onInit() {
    email = Get.arguments['user_email'];
    super.onInit();
  }
}
