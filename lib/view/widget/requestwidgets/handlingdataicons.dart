import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/view/widget/requestwidgets/internetfailure.dart';
import 'package:e_commerce/view/widget/requestwidgets/loading.dart';
import 'package:e_commerce/view/widget/requestwidgets/nodata.dart';
import 'package:e_commerce/view/widget/requestwidgets/serverfailure.dart';
import 'package:flutter/material.dart';

class HandlingDataIcons extends StatelessWidget {
  const HandlingDataIcons({
    super.key,
    required this.statusRequests,
    required this.defaultWidget,
    this.isAuthRequest = false,
    this.tryAgain,
  });

  final StatusRequests statusRequests;
  final Widget defaultWidget;
  final bool isAuthRequest;
  final void Function()? tryAgain;

  @override
  Widget build(BuildContext context) {
    // Display icons according to connection status.
    switch (statusRequests) {
      case StatusRequests.loading:
        return const Loading();

      case StatusRequests.internetFailure:
        return InternetFailure(tryAgain: tryAgain);

      case StatusRequests.serverFailure:
        return ServerFailure(tryAgain: tryAgain);

      case StatusRequests.failure:
        // Only show NoData widget if it's not an Auth Request
        if (!isAuthRequest) {
          return NoData(tryAgain: tryAgain);
        }
        // fallthrough to default widget when failure is related to an auth request
        break;

      default:
        return defaultWidget; // Default widget when no status match
    }

    return defaultWidget; // Return default widget as fallback
  }
}
