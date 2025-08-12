import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/functions/handlingdata_controller.dart';
import 'package:e_commerce/view/widget/dialogs/auth/verifycodedialog.dart';

class ResendAndCheckCode {
  // Send verification code again
  static resendCode(
      {required statusRequests,
      required String? email,
      required var sendCodeAgainData}) async {
    statusRequests = StatusRequests.loading;
    var response = await sendCodeAgainData.getCodeAgainData(email);
    statusRequests = handlingData(response);
    if (StatusRequests.success == statusRequests) {
      sentCodeDialog();
    } else if (statusRequests == StatusRequests.failure) {
      codeSentRecentlyDialog();
    }
  }

  // Check if verification code is expired
  static isCodeExpired(response) {
    return response['message'] ==
        "The verification code has expired. Please request a new one.";
  }
}
