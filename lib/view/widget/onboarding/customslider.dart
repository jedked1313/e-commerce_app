import 'package:e_commerce/controller/onboarding_controller.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOnBoardingSlider extends GetView<OnboardingController> {
  const CustomOnBoardingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return PageView.builder(
        reverse: myServices.sharedPreferences.getString("langcode") == "ar"
            ? true
            : false,
        onPageChanged: (value) {
          controller.onPageChange(value);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Stack(
                  alignment: onBoardingList[i].style!["alignment"],
                  children: [
                    SizedBox(
                      height: Get.height / 2.9,
                      width: Get.width,
                      child: Image.asset(
                        fit: BoxFit.fill,
                        onBoardingList[i].wave!,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      margin:
                          myServices.sharedPreferences.getString("langcode") ==
                                  "ar"
                              ? const EdgeInsets.only(right: 20, top: 115)
                              : const EdgeInsets.only(left: 20, top: 115),
                      width: Get.width / 1.7,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "onboarding_heading".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color:
                                          onBoardingList[i].style!["color-1"]),
                            ),
                            Divider(
                              height: 20,
                              color: onBoardingList[i].style!["color-1"],
                            ),
                            Text(
                              "onboarding_subtitle".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color:
                                          onBoardingList[i].style!["color-2"]),
                            )
                          ]),
                    ),
                  ],
                ),
                Image.asset(
                  onBoardingList[i].image!,
                  width: 400,
                  height: 300,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  onBoardingList[i].title!,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    onBoardingList[i].body!,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ));
  }
}
