import 'package:e_commerce/controller/itemdetails_controller.dart';
import 'package:e_commerce/core/constant/apilinks.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/translatedata.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ItemImages extends StatelessWidget {
  const ItemImages({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemDetailsController>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 4,
              child: PageView.builder(
                reverse: translateData(true, false),
                onPageChanged: (value) {
                  controller.onPageChange(value);
                },
                itemCount: controller.itemsModel.images!.length,
                itemBuilder: (context, index) => Column(children: [
                  ExtendedImage.network(
                    "${ApiLinks.root}${controller.itemsModel.images![index].image}",
                    height: 170,
                    cache: true,
                  ),
                ]),
              ),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      controller.itemsModel.images!.length,
                      (index) => Opacity(
                            opacity:
                                (controller.currentPage == index) ? 1 : 0.5,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width:
                                  (controller.currentPage == index) ? 30 : 12,
                              height: 12,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                          ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
