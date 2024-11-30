import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apilinks.dart';

class ResetPasswordData {
  ResetPasswordData(this.crud);
  Crud crud;

  postData(String email, String password) async {
    var response = await crud.postData(ApiLinks.resetPassword, {
      "user_email": email,
      "user_password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
