import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apilinks.dart';

class ForgotPasswordData {
  ForgotPasswordData(this.crud);
  Crud crud;

  getForgetPasswordData(String email) async {
    var response = await crud.requestData(ApiLinks.forgotPassword, {
      "user_email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
