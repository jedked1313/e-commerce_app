import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/view/widget/customdialog.dart';
import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/functions/checkinternet.dart';

class Crud {
  // Fetch data from api.
  Future<Either<StatusRequests, Map>> postData(String url, Map data) async {
    // Return Map(Right) if the data is fetched successfully, otherwise return StatusRequests(Left).

    try {
      if (await checkInternet()) {
        // Internet connection has been completed and data has been retrieved successfully.
        var response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          // In case of failure (Bad Request 400)
          return const Left(StatusRequests.failure);
        }
      } else {
        // If there is no internet connection.
        Get.dialog(CustomDialog(
            icon: Icons.signal_wifi_statusbar_connected_no_internet_4_rounded,
            iconColor: Colors.red,
            title: "No Internet",
            content: "Check your Intenet Connection And Try Again !",
            buttonTitle: "OK",
            onConfirm: () {
              Get.back();
            }));
        return const Left(StatusRequests.internetFailure);
      }
    } on SocketException catch (_) {
      // In case of server Exception
      Get.dialog(CustomDialog(
          icon: Icons.not_interested_outlined,
          iconColor: Colors.red,
          title: "Server Failure",
          content:
              "We're sorry, The server has encountered an internel error and was unable to complate your request. Please contact the app administrator.",
          buttonTitle: "OK",
          onConfirm: () {
            Get.back();
          }));
      return const Left(StatusRequests.serverFailure);
    }
  }
}
