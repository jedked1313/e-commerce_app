import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasource/static/remote/cart_data.dart';
import 'package:e_commerce/data/model/cartmodel.dart';
import 'package:e_commerce/view/widget/dialogs/customdialog.dart';
import 'package:e_commerce/view/widget/snackbars/failuresnackbar.dart';
import 'package:e_commerce/view/widget/snackbars/successfulsnackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  late StatusRequests statusRequests;
  CartData cartData = CartData(Get.find());
  var cartItems = <CartModel>[].obs;

  TextEditingController coupon = TextEditingController();
  int discount = 0;
  double beforeDiscountPrice = 0.0;
  double totalPrice = 0.0;
  double shippingFees = 20.0;

  @override
  void onInit() {
    getCartData();
    super.onInit();
  }

  // Get user cart items
  Future<void> getCartData() async {
    statusRequests = StatusRequests.loading;
    update();
    var response = await cartData.getCartData();
    statusRequests = handlingData(response);
    if (statusRequests == StatusRequests.success) {
      cartItems.assignAll(
        (response['data'] as List).map((e) => CartModel.fromJson(e)).toList(),
      );
      calculateTotal(); 
    }
    update();
  }

  // Add item to user cart
  Future<void> addToCart(String itemId) async {
    await cartData.addToCart(itemId);
    Get.snackbar(
      "Succeeded",
      "Item added to cart successfully",
      backgroundColor: AppColor.primaryColor.withValues(alpha: 0.1),
      icon: const Icon(
        CupertinoIcons.check_mark_circled,
        color: AppColor.primaryColor,
      ),
      colorText: AppColor.primaryColor,
    );
    calculateTotal();
  }

  /// Increase item quantity
  Future<void> increaseQuantity(int index) async {
    final item = cartItems[index];
    await cartData.increaseItemAmount(item.itemId.toString());
    cartItems[index].quantity = (cartItems[index].quantity ?? 0) + 1;
    calculateTotal();
  }

  /// Decrease item quantity
  Future<void> decreaseQuantity(int index) async {
    final item = cartItems[index];
    if ((item.quantity ?? 0) > 1) {
      await cartData.decreaseItemAmount(item.itemId.toString());
      cartItems[index].quantity = (cartItems[index].quantity ?? 0) - 1;
      calculateTotal();
    } else {
      Get.snackbar(
        "Wrong",
        "Quantity cannot be less than 1",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade50,
        icon: const Icon(CupertinoIcons.question_circle, color: Colors.red),
        colorText: Colors.red,
      );
    }
  }

  // Remove item from user cart
  void removeItemFromCart(int index) {
    final item = cartItems[index];
    Get.dialog(
      CustomDialog(
        icon: CupertinoIcons.question_circle,
        iconColor: Colors.red,
        title: 'Warning',
        content: 'Are you sure you want to remove this item from cart?',
        buttonTitle: 'Yes',
        onCancel: () => Get.back(),
        onConfirm: () async {
          Get.back();
          await cartData.removeItemFromCart(item.itemId.toString());
          cartItems.removeAt(index);
          Get.snackbar(
            "Succeeded",
            "Item removed from cart successfully",
            backgroundColor: AppColor.primaryColor.withValues(alpha: 0.1),
            icon: const Icon(
              CupertinoIcons.check_mark_circled,
              color: AppColor.primaryColor,
            ),
            colorText: AppColor.primaryColor,
          );
          calculateTotal();
        },
      ),
    );
  }

  // Validate the coupon
  Future<void> checkCoupon(String code) async {
    var response = await cartData.checkCouponData(code);
    statusRequests = handlingData(response);
    if (statusRequests == StatusRequests.success) {
      discount = response["data"]["discount"];
      successfulSnackbar("Success", "Coupon applied successfully.");
    } else {
      discount = 0;
      failureSnackbar("Failure", "This coupon is invalid.");
    }
    calculateTotal();
  }

  // Update totals (raw + discounted + shipping)
  void calculateTotal() {
    beforeDiscountPrice = cartItems.fold(
      0.0,
      (sum, item) => sum + ((item.items?.price ?? 0) * (item.quantity ?? 0)),
    );

    totalPrice = beforeDiscountPrice;
    if (discount > 0) {
      totalPrice -= beforeDiscountPrice * (discount / 100);
    }
    totalPrice += shippingFees;
    update(); 
  }
}
