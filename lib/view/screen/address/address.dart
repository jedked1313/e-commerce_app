import 'package:e_commerce/controller/address/address_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/view/widget/address/addressitem.dart';
import 'package:e_commerce/view/widget/address/newaddressbutton.dart';
import 'package:e_commerce/view/widget/requestwidgets/handlingdataicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressController());
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(title: Text("Addresses"), backgroundColor: AppColor.white),
      body: GetBuilder<AddressController>(
        builder: (controller) => HandlingDataIcons(
          tryAgain: controller.tryAgain,
          defaultWidget: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 24),
            child: ListView(
              children: [
                NewAddressButton(),
                SizedBox(height: 10),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: controller.addressItems.length,
                  itemBuilder: (context, index) =>
                      AddressItem(addressModel: controller.addressItems[index]),
                ),
              ],
            ),
          ),
          statusRequests: controller.statusRequests,
        ),
      ),
    );
  }
}
