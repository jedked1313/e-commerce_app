import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/class/httpmethods.dart';
import 'package:e_commerce/core/constant/apilinks.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:get/get.dart';

class CartData {
  CartData(this.crud);
  Crud crud;
  MyServices myServices = Get.find();

  // Get user cart items
  getCartData() async {
    var response = await crud.requestData(ApiLinks.cart, {
      "user_id": myServices.sharedPreferences.getString("user_id"),
    }, HttpMethods.post);
    return response.fold((l) => l, (r) => r);
  }

  // Add item to user cart
  addToCart(String itemId) async {
    var response = await crud.requestData(ApiLinks.addToCart, {
      "user_id": myServices.sharedPreferences.getString("user_id"),
      "item_id": itemId,
    }, HttpMethods.post);
    return response.fold((l) => l, (r) => r);
  }

  // Increase quantity of item on cart
  increaseItemAmount(String itemId) async {
    var response = await crud.requestData(ApiLinks.increaseAmount, {
      "user_id": myServices.sharedPreferences.getString("user_id"),
      "item_id": itemId,
    }, HttpMethods.post);
    return response.fold((l) => l, (r) => r);
  }

  // Decrease quantity of item on cart
  decreaseItemAmount(String itemId) async {
    var response = await crud.requestData(ApiLinks.decreaseAmount, {
      "user_id": myServices.sharedPreferences.getString("user_id"),
      "item_id": itemId.toString(),
    }, HttpMethods.post);
    return response.fold((l) => l, (r) => r);
  }

  // Check if used coupon is vaild
  checkCouponData(String coupon) async {
    var response = await crud.requestData(ApiLinks.checkCoupon, {
      "name": coupon,
    }, HttpMethods.post);
    return response.fold((l) => l, (r) => r);
  }

  // Remove item from user cart
  removeItemFromCart(String itemId) async {
    var response = await crud.requestData(ApiLinks.removeFromCart, {
      "user_id": myServices.sharedPreferences.getString("user_id"),
      "item_id": itemId.toString(),
    }, HttpMethods.delete);
    return response.fold((l) => l, (r) => r);
  }
}
