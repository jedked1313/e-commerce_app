import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apilinks.dart';

class SignUpData {
  SignUpData(this.crud);
  Crud crud;

  getSignupData(String username, String email, String password) async {
    var response = await crud.requestData(ApiLinks.signup, {
      "user_name": username,
      "user_email": email,
      "user_password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
