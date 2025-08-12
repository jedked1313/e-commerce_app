import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apilinks.dart';

class SendCodeAgainData {
  SendCodeAgainData(this.crud);
  Crud crud;

  getCodeAgainData(String email) async {
    var response = await crud.requestData(ApiLinks.sendCodeAgain, {
      "user_email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
