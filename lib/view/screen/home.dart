import 'package:e_commerce/controller/home_controller.dart';
import 'package:e_commerce/view/widget/requestwidgets/handlingdataicons.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:e_commerce/view/widget/home/homeitems.dart';
import 'package:e_commerce/view/widget/home/homecategories.dart';
import 'package:e_commerce/view/widget/home/seeall.dart';
import 'package:e_commerce/view/widget/auth/custominputfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(
        builder: (controller) => HandlingDataIcons(
              tryAgain: () => controller.getData(),
              statusRequests: controller.statusRequests,
              defaultWidget: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(18),
                            bottomRight: Radius.circular(18))),
                    child: Column(
                      children: [
                        CustomInputField(
                            textAlign: TextAlign.center,
                            icon: Icons.search,
                            hint: "search".tr,
                            controller: TextEditingController(),
                            valid: (val) {
                              return;
                            }),
                        Image.asset(
                          AppImageAsset.banner,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18))),
                    child: Column(
                      children: [
                        SeeAll(
                          title: "categories".tr,
                          onPressed: () {
                            controller.goToCategories();
                          },
                        ),
                        const HomeCategoriesList(),
                        SeeAll(
                          title: "hot".tr,
                          onPressed: () {
                            controller.goToDiscountedItems();
                          },
                        ),
                        const HomeGridView()
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
