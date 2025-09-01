import 'package:e_commerce/core/class/httpmethods.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/view/widget/dialogs/nointernetdialog.dart';
import 'package:e_commerce/view/widget/dialogs/serverfailuredialog.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/functions/checkinternet.dart';

class Crud {
  MyServices myServices = Get.find();

  late Map<String, String> headers = {
    "Accept": "application/json",
    "Authorization":
        "Bearer ${myServices.sharedPreferences.getString("token")}",
  };

  // Fetch data from api.
  Future<Either<StatusRequests, Map>> requestData(
    String url,
    Map data, [
    HttpMethods? method,
  ]) async {
    // Return Map(Right) if the data is fetched successfully, otherwise return StatusRequests(Left).

    try {
      // Check Internet Connection
      if (await checkInternet()) {
        // Check http method, if there is no http method passed it will be POST
        http.Response response;
        if (method == HttpMethods.get) {
          response = await http.get(Uri.parse(url), headers: headers);
        } else if (method == HttpMethods.put) {
          response = await http.put(
            Uri.parse(url),
            body: data,
            headers: headers,
          );
        } else if (method == HttpMethods.delete) {
          response = await http.delete(
            Uri.parse(url),
            body: data,
            headers: headers,
          );
        } else {
          // Default is post
          response = await http.post(
            Uri.parse(url),
            body: data,
            headers: headers,
          );
        }
        // print(response.body); // For Testing benefits *__*
        if (response.statusCode == 200 || response.statusCode == 201) {
          // The data has been retrieved successfully.
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          // In case of failure (Bad Request 400)
          return const Left(StatusRequests.failure);
        }
      } else {
        // If there is no internet connection.
        noInternetDialog();
        return const Left(StatusRequests.internetFailure);
      }
    } on SocketException catch (_) {
      // In case of server Exception
      serverFailureDialog();
      return const Left(StatusRequests.serverFailure);
    }
  }
}
