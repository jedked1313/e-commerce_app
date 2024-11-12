import 'package:e_commerce/controller/onboarding_controller.dart';
import 'package:e_commerce/data/datasource/static/static.dart';
import 'package:e_commerce/view/widget/onboarding/custombutton.dart';
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
                      ? CustomOnBoardingButton(onPressed: controller.next)
                      : const CustomDotControllerOnBoarding());
            },
          )
        ],
      ),
    );
  }
}
