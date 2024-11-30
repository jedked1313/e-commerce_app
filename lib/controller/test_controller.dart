import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/functions/handlingdata_controller.dart';
import 'package:e_commerce/data/datasource/static/remote/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];

  late StatusRequests statusRequests;
  getDataController() async {
    statusRequests = StatusRequests.loading;
    var response = await testData.getDataCrud();
    statusRequests = handlingData(response);
    if (statusRequests == StatusRequests.success) {
      data.addAll(response);
    }
    update();
  }

  @override
  void onInit() {
    getDataController();
    super.onInit();
  }
}
