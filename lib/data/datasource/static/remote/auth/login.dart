import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apilinks.dart';

class LoginData {
  LoginData(this.crud);
  Crud crud;

  getLoginData(String email, String password) async {
    var response = await crud.requestData(ApiLinks.login, {
      "user_email": email,
      "user_password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
