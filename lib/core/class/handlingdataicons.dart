import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/view/widget/internetfailure.dart';
import 'package:e_commerce/view/widget/loading.dart';
import 'package:e_commerce/view/widget/nodata.dart';
import 'package:e_commerce/view/widget/serverfailure.dart';
import 'package:flutter/material.dart';

class HandlingDataIcons extends StatelessWidget {
  const HandlingDataIcons({
    super.key,
    required this.statusRequests,
    required this.widget,
    this.isAuthRequest = false,
  });
  final StatusRequests statusRequests;
  final Widget widget;
  final bool isAuthRequest;

  @override
  Widget build(BuildContext context) {
    // Display icons according to coonnection status.
    if (statusRequests == StatusRequests.loading) {
      return const Loading();
    } else if (statusRequests == StatusRequests.internetFailure) {
      return const InternetFailure();
    } else if (statusRequests == StatusRequests.serverFailure) {
      return const ServerFailure();
    } else if (statusRequests == StatusRequests.failure && isAuthRequest == false) {
      // Do not display this widget if it's Auth Request(login, signup,reset password, etc)
      return const NoData();
    } else {
      return widget;
    }
  }
}
