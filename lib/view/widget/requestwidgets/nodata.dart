import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:e_commerce/view/widget/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class NoData extends StatelessWidget {
  const NoData({super.key, this.tryAgain});
  final void Function()? tryAgain;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          height: Get.width / 1.4,
          AppImageAsset.noData,
          renderCache: RenderCache.drawingCommands,
        ),
        const SizedBox(
          height: 5,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(text: "try_again".tr, onPressed: tryAgain)
      ],
    ));
  }
}
