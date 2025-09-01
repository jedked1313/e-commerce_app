import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasource/static/remote/categories_data.dart';
import 'package:e_commerce/data/datasource/static/remote/items_data.dart';
import 'package:e_commerce/view/widget/dialogs/nointernetdialog.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());
  ItemsData itemsData = ItemsData(Get.find());
  late StatusRequests statusRequests;
  List categories = [];
  List categoryItems = [];

  intianlData() {
    getData();
  }

  goToItems(String categoryName, int selectedCategory, String categoryId) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "categoryId": categoryId,
      "categoryName": categoryName,
      "selectedCategory": selectedCategory,
    });
  }

  // Get Items that belongs to specific category
  getCategoryItems(String id) async {
    statusRequests = StatusRequests.loading;
    // Refresh UI and Display loading
    update();
    var response = await itemsData.getItemsData(id);
    statusRequests = handlingData(response);
    if (StatusRequests.success == statusRequests) {
      categoryItems.addAll(response['data']);
    }
    update();
  }

  // Get all categories
  getData() async {
    statusRequests = StatusRequests.loading;
    // Refresh UI and Display loading
    update();
    var response = await categoriesData.getCategoriesData();
    statusRequests = handlingData(response);
    if (StatusRequests.success == statusRequests) {
      categories.addAll(response['data']);
    } else {
      noInternetDialog();
      statusRequests == StatusRequests.failure;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    intianlData();
  }
}
