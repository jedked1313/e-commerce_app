import 'package:e_commerce/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LottieBuilder.asset(
      AppImageAsset.noData,
      renderCache: RenderCache.drawingCommands,
    ));
  }
}
