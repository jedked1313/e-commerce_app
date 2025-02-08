import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdata_controller.dart';
import 'package:e_commerce/data/datasource/static/remote/items_data.dart';
import 'package:e_commerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

class ItemsController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  late StatusRequests statusRequests;
  List categories = [];
  List items = [];
  int? selectedCategory;
  late String categoryId;

  intianlData() {
    // If there is selected category (from categories screen or home categories list)
    if (Get.arguments['categoryId'] != null) {
      categories = Get.arguments['categories'];
      selectedCategory = Get.arguments['selectedCategory'];
      categoryId = Get.arguments['categoryId'];
      getItemsCategory(categoryId);
    } else {
      // If there is no selected category (from discounted items)
      getDiscountedItems();
    }
  }

  // On change selected category
  changeCategory(val, categoryValue) {
    selectedCategory = val;
    items.clear();
    getItemsCategory(categoryValue.toString());
    update();
  }

  // Get Discounted items data
  getDiscountedItems() async {
    statusRequests = StatusRequests.loading;
    // Refresh UI and Display loading
    update();
    var response = await itemsData.discountedItems();
    statusRequests = handlingData(response);
    if (StatusRequests.success == statusRequests) {
      items.addAll(response['data']);
    }
    update();
  }

  // Get items data that belong to a specific category
  getItemsCategory(String categoryId) async {
    statusRequests = StatusRequests.loading;
    // Refresh UI and Display loading
    update();
    var response = await itemsData.getItemsData(categoryId);
    statusRequests = handlingData(response);
    if (StatusRequests.success == statusRequests) {
      if (response['status'] == "success") {
        items.addAll(response['data']);
      }
    }
    update();
  }

  // Go to item details screen
  goToItemDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.itemDetails, arguments: {"itemsModel": itemsModel});
  }

  @override
  void onInit() {
    super.onInit();
    intianlData();
  }
}
