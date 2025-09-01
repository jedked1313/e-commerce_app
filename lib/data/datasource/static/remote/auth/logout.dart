import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apilinks.dart';

class LogoutData {
  LogoutData(this.crud);
  Crud crud;

  logoutData() async {
    var response = await crud.requestData(ApiLinks.logout, {});
    return response.fold((l) => l, (r) => r);
  }
}
