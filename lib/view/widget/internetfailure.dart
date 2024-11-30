import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InternetFailure extends StatelessWidget {
  const InternetFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LottieBuilder.asset(
      AppImageAsset.noInternet,
      renderCache: RenderCache.drawingCommands,
    ));
  }
}
