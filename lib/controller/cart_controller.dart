import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasource/static/remote/cart_data.dart';
import 'package:e_commerce/data/model/cartmodel.dart';
import 'package:e_commerce/view/widget/dialogs/customdialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  late StatusRequests statusRequests;
  CartData cartData = CartData(Get.find());
  var cartItems = <CartModel>[].obs;

  @override
  void onInit() {
    // Initialize the cart data when the controller is created
    getCartData();
    super.onInit();
  }

  getCartData() async {
    statusRequests = StatusRequests.loading;
    // refresh UI and display loading
    update();
    var response = await cartData.getCartData();
    statusRequests = handlingData(response);
    if (StatusRequests.success == statusRequests) {
      cartItems.addAll(
        (response['data'] as List).map((e) => CartModel.fromJson(e)).toList(),
      );
    }
    update();
  }

  addToCart(String itemId) async {
    await cartData.addToCart(itemId);
    Get.snackbar("Successeded", "Item addded to cart successfully",
        backgroundColor: AppColor.primaryColor.withValues(alpha: 0.1),
        icon: const Icon(
          CupertinoIcons.check_mark_circled,
          color: AppColor.primaryColor,
        ),
        colorText: AppColor.primaryColor);
  }

  // Increase Item Quantity on Cart
  void increaseQuantity(int index) async {
    final item = cartItems[index];
    await cartData.increaseItemAmount(item.itemId.toString());
    cartItems[index].quantity = (cartItems[index].quantity ?? 0) + 1;
    update();
  }

  // Decrease Item Quantity on Cart
  void decreaseQuantity(int index) async {
    final item = cartItems[index];
    if ((item.quantity ?? 0) > 1) {
      await cartData.decreaseItemAmount(item.itemId.toString());
      cartItems[index].quantity = (cartItems[index].quantity ?? 0) - 1;
      update();
    } else {
      Get.snackbar("Wrong", "Quantity cannot be less than 1",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade50,
          icon: const Icon(
            CupertinoIcons.question_circle,
            color: Colors.red,
          ),
          colorText: Colors.red);
    }
  }

  void removeItemFromCart(int index) {
    final item = cartItems[index];

    Get.dialog(CustomDialog(
      icon: CupertinoIcons.question_circle,
      iconColor: Colors.red,
      title: 'Warning',
      content: 'Are you sure you want remove this item from cart ?',
      buttonTitle: 'Yes',
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back();
        await cartData.removeItemFromCart(item.itemId.toString());
        cartItems.removeAt(index); // remove directly by index

        Get.snackbar("Succeeded", "Item removed from cart successfully",
            backgroundColor: AppColor.primaryColor.withValues(alpha: 0.1),
            icon: const Icon(
              CupertinoIcons.check_mark_circled,
              color: AppColor.primaryColor,
            ),
            colorText: AppColor.primaryColor);
        update();
      },
    ));
  }

  double calculateTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      total += (item.items?.price ?? 0) * (item.quantity ?? 0);
    }
    return total;
  }
}
