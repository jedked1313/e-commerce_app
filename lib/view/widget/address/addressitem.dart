import 'package:e_commerce/controller/address/address_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/data/model/addressmodel.dart';
import 'package:e_commerce/view/widget/customiconbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({super.key, required this.addressModel});
  final AddressModel addressModel;

  @override
  Widget build(BuildContext context) {
    AddressController controller = Get.put(AddressController());
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primaryColor, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                CupertinoIcons.location_solid,
                color: AppColor.primaryColor,
                size: 35,
              ),
              Text(
                addressModel.addressName ?? "",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Spacer(),
              CustomIconButton(
                color: AppColor.white,
                icon: Icon(CupertinoIcons.trash, color: Colors.redAccent),
                onPressed: () =>
                    controller.deleteAddress(addressModel.id.toString()),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "City: ${addressModel.city}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "neighborhood: ${addressModel.neighborhood}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Street: ${addressModel.street}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Phone Number: +${addressModel.contactPhone}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              CustomIconButton(
                color: AppColor.primaryColor,
                padding: 8,
                icon: Icon(CupertinoIcons.pencil, color: AppColor.white),
                onPressed: () =>
                    controller.goToUpdateAddress(addressModel.id.toString()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
