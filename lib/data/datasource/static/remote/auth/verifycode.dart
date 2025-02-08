import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apilinks.dart';

class VerifyCodeData {
  VerifyCodeData(this.crud);
  Crud crud;

  getVerifyCodeData(String email,String verifyCode) async {
    var response = await crud.requestData(ApiLinks.verifyCode, {
      "user_email": email,
      "user_verifycode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
