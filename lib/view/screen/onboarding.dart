import 'package:e_commerce/controller/onboarding_controller.dart';
import 'package:e_commerce/data/datasource/static/onboardinglist.dart';
import 'package:e_commerce/view/widget/custombutton.dart';
import 'package:e_commerce/view/widget/onboarding/customslider.dart';
import 'package:e_commerce/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            flex: 9,
            child: CustomOnBoardingSlider(),
          ),
          GetBuilder<OnboardingController>(
            builder: (controller) {
              return Expanded(
                  flex: 1,
                  child: (controller.currentPage == onBoardingList.length - 1)
                      ? Container(
                          width: Get.width / 1.5,
                          padding: const EdgeInsets.all(10),
                          child: CustomButton(
                              text: "continue".tr, onPressed: controller.next))
                      : const CustomDotControllerOnBoarding());
            },
          )
        ],
      ),
    );
  }
}
