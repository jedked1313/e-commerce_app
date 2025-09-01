import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/class/httpmethods.dart';
import 'package:e_commerce/core/constant/apilinks.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:get/get.dart';

class CartData {
  CartData(this.crud);
  Crud crud;
  MyServices myServices = Get.find();


  getCartData() async {
    var response = await crud.requestData(
        ApiLinks.cart,
        {
          "user_id": myServices.sharedPreferences.getString("user_id"),
        },
        HttpMethods.post);
    return response.fold((l) => l, (r) => r);
  }

  addToCart(String itemId) async {
    var response = await crud.requestData(
        ApiLinks.addToCart,
        {
          "user_id": myServices.sharedPreferences.getString("user_id"),
          "item_id": itemId,
        },
        HttpMethods.post);
    return response.fold((l) => l, (r) => r);
  }

  increaseItemAmount(String itemId) async {
    var response = await crud.requestData(
        ApiLinks.increaseAmount,
        {
          "user_id": myServices.sharedPreferences.getString("user_id"),
          "item_id": itemId,
        },
        HttpMethods.post);
    return response.fold((l) => l, (r) => r);
  }

  decreaseItemAmount(String itemId) async {
    var response = await crud.requestData(
        ApiLinks.decreaseAmount,
        {
          "user_id": myServices.sharedPreferences.getString("user_id"),
          "item_id": itemId.toString(),
        },
        HttpMethods.post);
    return response.fold((l) => l, (r) => r);
  }

  removeItemFromCart(String itemId) async {
    var response = await crud.requestData(
        ApiLinks.removeFromCart,
        {
          "user_id": myServices.sharedPreferences.getString("user_id"),
          "item_id": itemId.toString(),
        },
        HttpMethods.delete);
    return response.fold((l) => l, (r) => r);
  }
}
