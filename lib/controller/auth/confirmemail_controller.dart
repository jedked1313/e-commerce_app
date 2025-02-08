import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdata_controller.dart';
import 'package:e_commerce/core/functions/storeuserinfo.dart';
import 'package:e_commerce/data/datasource/static/remote/auth/confirmemail.dart';
import 'package:e_commerce/view/widget/dialogs/auth/wrongcodedialog.dart';
import 'package:get/get.dart';

class ConfirmEmailController extends GetxController {
  ConfirmEmailData confirmEmailData = ConfirmEmailData(Get.find());
  StatusRequests statusRequests = StatusRequests.none;
  String? email;

  confirmEmail(args) async {
    statusRequests = StatusRequests.loading;
    // Refresh UI and Display loading
    update();
    var response =
        await confirmEmailData.getConfirmEmailData(email!, args['verifycode']);
    statusRequests = handlingData(response);
    if (StatusRequests.success == statusRequests) {
      // Save user info on local storage
      storeUserInfo(response);
      // Redirect to Home
      Get.toNamed(AppRoute.success, arguments: args);
    } else if (statusRequests == StatusRequests.failure) {
      wrongCodeDialog();
    }
    update();
  }

  sendCodeAgain(){
    
  }

  goToLogin(){
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onInit() {
    email = Get.arguments['user_email'];
    super.onInit();
  }
}
