import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:e_commerce/core/constant/routes.dart';
import 'package:e_commerce/core/functions/handlingdata_controller.dart';
import 'package:e_commerce/data/datasource/static/remote/favorite_data.dart';
import 'package:e_commerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  FavoritesData favoriteData = FavoritesData(Get.find());
  late StatusRequests statusRequests;
  List favorites = []; // Used for favorites screen
  Map isFavorite = {}; // Used for Home and items screen

  getFavorites() async {
    statusRequests = StatusRequests.loading;
    // Refresh UI and Display loading
    update();
    var response = await favoriteData.getFavoritesData();
    statusRequests = handlingData(response);
    if (StatusRequests.success == statusRequests) {
      favorites.addAll(response['data']);
    }
    update();
  }

  goToUserFavorites() {
    favorites.clear(); // Avoid duplication of items
    getFavorites();
    Get.toNamed(AppRoute.favorites);
  }

  addOrRemoveFavorite(itemId) {
    // Remove item from favorites screen
    favorites.removeWhere((item) => item['id'] == itemId);
    // Remove from database
    setFavorite(itemId, 0);
    update();
    Get.back();
  }

  // Add or remove item from favorites
  setFavorite(itemId, val) async {
    isFavorite[itemId] = val; // Add or remove from view
    await favoriteData
        .addOrRemoveFavoriteData(itemId); // Add or remove from database
    update();
  }

  // Go to item details screen
  goToItemDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.itemDetails, arguments: {"itemsModel": itemsModel});
  }

  @override
  void onClose() {
    super.onClose();
    favorites.clear();
  }
}
