import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/class/httpmethods.dart';
import 'package:e_commerce/core/constant/apilinks.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:get/get.dart';

class ItemsData {
  ItemsData(this.crud);
  Crud crud;
  MyServices myServices = Get.find();

  getItemsData(String id) async {
    var response = await crud.requestData(
        "${ApiLinks.categoryItems}/$id",
        {"user_id": myServices.sharedPreferences.getString("user_id")},
        HttpMethods.post);
    return response.fold((l) => l, (r) => r);
  }

  discountedItems() async {
    var response = await crud.requestData(
        "${ApiLinks.items}?user_id=${myServices.sharedPreferences.getString("user_id")}",
        {},
        HttpMethods.get);
    return response.fold((l) => l, (r) => r);
  }

  searchResult(String? query) async {
    var response = await crud.requestData(
        ApiLinks.itemsSearch, {"query": query}, HttpMethods.post);
    return response.fold((l) => l, (r) => r);
  }
}
