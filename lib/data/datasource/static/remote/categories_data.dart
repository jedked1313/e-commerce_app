import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/class/httpmethods.dart';
import 'package:e_commerce/core/constant/apilinks.dart';

class CategoriesData {
  CategoriesData(this.crud);
  Crud crud;

  getCategoriesData() async {
    var response =
        await crud.requestData(ApiLinks.categories, {}, HttpMethods.get);
    return response.fold((l) => l, (r) => r);
  }
}
