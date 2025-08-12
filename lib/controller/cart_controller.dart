import 'package:e_commerce/core/class/statusrequests.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  late StatusRequests statusRequests;
  List favorites = [];
  changeAmount(int index, double amount) {
    // Logic to change the amount of the cart item at the given index
    // This could involve updating a list of cart items in the controller
    
    update();
  }
}
