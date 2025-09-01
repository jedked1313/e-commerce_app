import 'package:e_commerce/controller/address/address_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class NewAddressButton extends GetView<AddressController> {
  const NewAddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.goToCreateAddress(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: AppColor.ligthGrey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Add Address",
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(color: AppColor.primaryColor),
            ),
            SizedBox(width: 12),
            Icon(
              Icons.add_circle_outline,
              size: 30,
              color: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
