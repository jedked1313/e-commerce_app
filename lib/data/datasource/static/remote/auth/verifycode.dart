import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apilinks.dart';

class VerifyCodeData {
  VerifyCodeData(this.crud);
  Crud crud;

  postData(String email,String verifyCode) async {
    var response = await crud.postData(ApiLinks.verifyCode, {
      "user_email": email,
      "user_verifycode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
