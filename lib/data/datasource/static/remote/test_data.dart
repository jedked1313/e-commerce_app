import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apilinks.dart';

class TestData {
  TestData(this.crud);
  Crud crud;

  getDataCrud() async {
    var response = await crud.postData(ApiLinks.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
