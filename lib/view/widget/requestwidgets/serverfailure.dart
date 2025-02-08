import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:e_commerce/view/widget/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class ServerFailure extends StatelessWidget {
  const ServerFailure({super.key, this.tryAgain});
  final void Function()? tryAgain;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          height: Get.width / 1.4,
          AppImageAsset.serverFailure,
          renderCache: RenderCache.drawingCommands,
        ),
        const SizedBox(
          height: 5,
        ),
        Text("${"server_failure".tr} !",
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
            text: "try_again".tr,
            onPressed: tryAgain)
      ],
    ));
  }
}
