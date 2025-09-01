import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/class/httpmethods.dart';
import 'package:e_commerce/core/constant/apilinks.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:get/get.dart';

class AddressData {
  AddressData(this.crud);
  Crud crud;
  MyServices myServices = Get.find();

  getAddressData() async {
    var response = await crud.requestData(
      ApiLinks.address,
      {},
      HttpMethods.post,
    );
    return response.fold((l) => l, (r) => r);
  }

  newAddressData(
    String? addressName,
    String city,
    String neighborhood,
    String street,
    String? building,
    String? apartment,
    String contactPhone,
    String? latitude,
    String? longitude,
    String? postalCode,
  ) async {
    var response = await crud.requestData(ApiLinks.newAddress, {
      "address_name": addressName,
      "city": city,
      "neighborhood": neighborhood,
      "street": street,
      "building": building,
      "apartment": apartment,
      "contact_phone": contactPhone,
      "latitude": latitude,
      "longitude": longitude,
      "postal_code": postalCode,
    }, HttpMethods.post);
    return response.fold((l) => l, (r) => r);
  }

  updateAddressData(
    String? addressId,
    String? addressName,
    String city,
    String neighborhood,
    String street,
    String? building,
    String? apartment,
    String contactPhone,
    String? latitude,
    String? longitude,
    String? postalCode,
  ) async {
    var response = await crud
        .requestData("${ApiLinks.updateAddress}/$addressId", {
          "address_name": addressName,
          "city": city,
          "neighborhood": neighborhood,
          "street": street,
          "building": building,
          "apartment": apartment,
          "contact_phone": contactPhone,
          "latitude": latitude,
          "longitude": longitude,
          "postal_code": postalCode,
        }, HttpMethods.put);
    return response.fold((l) => l, (r) => r);
  }

  // View location details on fields before update it
  showAddressData(String? addressId) async {
    var response = await crud.requestData(
      "${ApiLinks.showAddress}/$addressId",
      {},
      HttpMethods.post,
    );
    return response.fold((l) => l, (r) => r);
  }

  removeAddressData(String addresId) async {
    var response = await crud.requestData(
      "${ApiLinks.deleteAddress}/$addresId",
      {},
      HttpMethods.delete,
    );
    return response.fold((l) => l, (r) => r);
  }
}
