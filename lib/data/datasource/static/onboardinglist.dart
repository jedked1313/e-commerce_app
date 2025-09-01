import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/functions/translatedata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/model/onboardingmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

MyServices myServices = Get.find();

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      wave: AppImageAsset.onBoardingWaveOne,
      title: "purchase".tr,
      image: AppImageAsset.onBoardingImageOne,
      style: {
        "color-1": AppColor.white,
        "color-2": AppColor.white,
        "alignment": translateData(
            AlignmentDirectional.topEnd, AlignmentDirectional.topStart)
      },
      body: "lorem".tr),
  OnBoardingModel(
    wave: AppImageAsset.onBoardingWaveTwo,
    title: "track".tr,
    image: AppImageAsset.onBoardingImageTwo,
    style: {
      "color-1": AppColor.primaryColor,
      "color-2": Colors.black,
      "alignment": translateData(
          AlignmentDirectional.topEnd, AlignmentDirectional.topStart)
    },
    body: "lorem".tr,
  ),
  OnBoardingModel(
    wave: AppImageAsset.onBoardingWaveThree,
    title: "get_order".tr,
    image: AppImageAsset.onBoardingImageThree,
    style: {
      "color-1": AppColor.white,
      "color-2": AppColor.white,
      "alignment": translateData(
          AlignmentDirectional.topStart, AlignmentDirectional.topEnd)
    },
    body: "lorem".tr,
  ),
];
