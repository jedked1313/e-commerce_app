import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apilinks.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:get/get.dart';

class FavoritesData {
  FavoritesData(this.crud);
  Crud crud;
  MyServices myServices = Get.find();

  getFavoritesData() async {
    var response = await crud.requestData(ApiLinks.favorites, {
      "user_id": myServices.sharedPreferences.getString("user_id"),
    });
    return response.fold((l) => l, (r) => r);
  }

  addOrRemoveFavoriteData(itemId) async {
    var response = await crud.requestData(ApiLinks.addOrRemoveFavorite, {
      "user_id": myServices.sharedPreferences.getString("user_id"),
      "item_id": itemId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}
