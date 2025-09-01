import 'package:e_commerce/data/datasource/static/remote/auth/sendcodeagain.dart';
import 'package:e_commerce/view/widget/dialogs/auth/verifycodeexpired.dart';
import 'package:e_commerce/view/widget/dialogs/auth/wrongcodedialog.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/class/resendandcheckcode.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/verifycode.dart';

class VerifyCodeController extends GetxController {
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  SendCodeAgainData sendCodeAgainData = SendCodeAgainData(Get.find());
  StatusRequests statusRequests = StatusRequests.none;
  String? email;

  verifyCode(args) async {
    statusRequests = StatusRequests.loading;
    // Refresh UI and Display loading
    update();
    var response =
        await verifyCodeData.getVerifyCodeData(email!, args['verifycode']);
    statusRequests = handlingData(response);
    if (statusRequests == StatusRequests.success) {
      // Check if the verification code has expired
      if (ResendAndCheckCode.isCodeExpired(response)) {
        verifyCodeExpiredDialog();
      } else {
        // Proceed to reset password page if the code is valid
        Get.toNamed(AppRoute.resetPassword, arguments: args);
      }
      // Display dialog if the entered code is incorrect
    } else if (statusRequests == StatusRequests.failure) {
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

  tryAgain() {
    Get.offAll(AppRoute.login);
  }

  @override
  void onInit() {
    email = Get.arguments['user_email'];
    super.onInit();
    return;
  }
}
