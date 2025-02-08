import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdata_controller.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/datasource/static/remote/home_data.dart';
import 'package:e_commerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeData homeData = HomeData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequests statusRequests;
  List categories = [];
  List items = [];

  initialData() {
    getData();
  }

  // Display all categories
  goToCategories() {
    Get.toNamed(AppRoute.categories);
  }

  // Go to items screen with passing id and name of selected category
  goToItems(List categories, int selectedCategory, String categoryId,
      String categoryName) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "categoryId": categoryId,
      "categoryName": categoryName,
      "selectedCategory": selectedCategory
    });
  }

  // Go to items screen without passing selected category (Display categories list only)
  goToDiscountedItems() {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
    });
  }

  // Go to item details screen
  goToItemDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.itemDetails, arguments: {"itemsModel": itemsModel});
  }

  getData() async {
    statusRequests = StatusRequests.loading;
    // Refresh UI and Display loading
    update();
    var response = await homeData.getHomeData();
    statusRequests = handlingData(response);
    if (StatusRequests.success == statusRequests) {
      categories.addAll(response['data']['categories']);
      items.addAll(response['data']['items']);
    }
    update();
  }

  logout() {
    myServices.sharedPreferences.clear();
    myServices.sharedPreferences.setInt("step", 1);
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onInit() {
    super.onInit();
    initialData();
  }
}
