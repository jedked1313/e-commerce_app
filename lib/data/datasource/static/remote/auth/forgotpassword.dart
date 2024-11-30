import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apilinks.dart';

class ForgotPasswordData {
  ForgotPasswordData(this.crud);
  Crud crud;

  postData(String email) async {
    var response = await crud.postData(ApiLinks.forgotPassword, {
      "user_email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
