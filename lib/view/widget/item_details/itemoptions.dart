import 'package:e_commerce/controller/itemdetails_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/translatedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemOptions extends StatelessWidget {
  const ItemOptions({super.key, required this.list});
  final List list;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemDetailsController>(
      builder: (controller) => SingleChildScrollView(
        child: Row(children: [
          ...List.generate(
              list.length,
              (index) => InkWell(
                    onTap: () {
                      controller.onChangeOption(index);
                    },
                    child: Container(
                      margin: translateData(
                          const EdgeInsets.only(left: 10, top: 10, bottom: 5),
                          const EdgeInsets.only(right: 10, top: 10, bottom: 5)),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: controller.selectedOption == index
                              ? AppColor.primaryColor
                              : AppColor.white,
                          border: Border.all(
                              color: AppColor.primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        "${list[index]['name']}",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: controller.selectedOption == index
                                    ? AppColor.white
                                    : AppColor.primaryColor),
                      ),
                    ),
                  ))
        ]),
      ),
    );
  }
}
