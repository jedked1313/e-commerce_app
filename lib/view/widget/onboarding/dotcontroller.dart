import 'package:e_commerce/controller/onboarding_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/data/datasource/static/onboardinglist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBoardingList.length,
              (index) => GetBuilder<OnboardingController>(
                  builder: (controller) => Opacity(
                        opacity: (controller.currentPage == index) ? 1 : 0.5,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 15,
                          height: 15,
                          margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      )))
        ],
      ),
    );
  }
}
