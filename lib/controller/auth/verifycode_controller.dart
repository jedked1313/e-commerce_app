import 'package:e_commerce/view/widget/dialogs/auth/wrongcodedialog.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/functions/handlingdata_controller.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/verifycode.dart';

class VerifyCodeController extends GetxController {
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  StatusRequests statusRequests = StatusRequests.none;
  String? email;

  verifyCode(args) async {
    statusRequests = StatusRequests.loading;
    // Refresh UI and Display loading
    update();
    var response =
        await verifyCodeData.getVerifyCodeData(email!, args['verifycode']);
    statusRequests = handlingData(response);
    if (StatusRequests.success == statusRequests) {
      Get.toNamed(AppRoute.resetPassword, arguments: args);
    } else if (statusRequests == StatusRequests.failure) {
      wrongCodeDialog();
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['user_email'];
    super.onInit();
    return;
  }
}
