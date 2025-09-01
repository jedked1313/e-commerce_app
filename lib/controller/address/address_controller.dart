import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasource/static/remote/address_data.dart';
import 'package:e_commerce/data/model/addressmodel.dart';
import 'package:e_commerce/view/screen/address/addressdetails.dart';
import 'package:e_commerce/view/widget/dialogs/customdialog.dart';
import 'package:e_commerce/view/widget/dialogs/nointernetdialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  late StatusRequests statusRequests;
  AddressData addressData = AddressData(Get.find());
  var addressItems = <AddressModel>[];

  @override
  void onInit() {
    // Initialize the cart data when the controller is created
    getUserAddress();
    super.onInit();
  }

  getUserAddress() async {
    statusRequests = StatusRequests.loading;
    // Refresh UI and Display loading
    update();
    var response = await addressData.getAddressData();
    statusRequests = handlingData(response);
    if (StatusRequests.success == statusRequests) {
      addressItems.addAll(
        (response['data'] as List)
            .map((e) => AddressModel.fromJson(e))
            .toList(),
      );
    } else {
      noInternetDialog();
      statusRequests == StatusRequests.failure;
    }
    update();
  }

  deleteAddress(String addressId) {
    Get.dialog(
      CustomDialog(
        icon: CupertinoIcons.question,
        title: "Delete Address",
        content: "Are you sure you want to delete this address ?",
        buttonTitle: "Yes",
        onCancel: () => Get.back(),
        onConfirm: () async {
          await addressData.removeAddressData(addressId);
          addressItems.removeWhere(
            (element) => element.id.toString() == addressId,
          );
          update();
          Get.back();
        },
      ),
    );
  }

  goToCreateAddress() {
    Get.to(() => AddressDetails());
  }

  goToUpdateAddress(String? addressId) {
    Get.to(() => AddressDetails(), arguments: {"address_id": addressId});
  }

  tryAgain() {
    getUserAddress();
  }
}
