import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdata.dart';
import 'package:e_commerce/data/datasource/static/remote/items_data.dart';
import 'package:e_commerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  late StatusRequests statusRequests;
  List categories = [];
  List items = [];
  int? selectedCategory;
  late String categoryId;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void initializeData() {
    final args = Get.arguments ?? {};
    _loadItemsFromArgs(args, withSelectedCategory: true);
  }

  // Shared logic for category/search/discounted handling
  void _loadItemsFromArgs(Map<String, dynamic> args,
      {bool withSelectedCategory = false}) {
    final categoryId = args['categoryId'];
    final query = args['query'];

    if (categoryId != null) {
      // Load items based on category
      // if (withSelectedCategory) {
        categories = args['categories'];
        selectedCategory = args['selectedCategory'];
        this.categoryId = categoryId;
      // }
      getItemsCategory(categoryId);
    } else if (query != null) {
      // Load items based on search query
      searchForItems(query);
    } else {
      getDiscountedItems(); // Load discounted items by default
    }
  }

  searchForItems(String? query) async {
    statusRequests = StatusRequests.loading;
    // Refresh UI and Display loading
    update();
    var response = await itemsData.searchResult(query);
    statusRequests = handlingData(response);
    if (StatusRequests.success == StatusRequests.success) {
      items.clear();
      items.addAll(response["data"]);
      update();
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

  // Determine app bar title based on passed arguments
  String getAppBarTitle(Map<String, dynamic> args) {
    if (args['categoryName'] != null) {
      return args['categoryName'];
    }
    if (args['title'] != null) {
      return args['title'];
    }
    return "hot_sales".tr;
  }

  // Retry loading items based on initial arguments passed (on failure case)
  tryAgain(args) {
    _loadItemsFromArgs(args, withSelectedCategory: false);
  }
}
