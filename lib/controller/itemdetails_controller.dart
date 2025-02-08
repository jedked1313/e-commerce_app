import 'package:e_commerce/core/functions/translatedata.dart';
import 'package:e_commerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

class ItemDetailsController extends GetxController {
  late ItemsModel itemsModel;
  int currentPage = 0;
  int? selectedOption = 0;

  List spaceOptions = [
    {"name": "128GB"},
    {"name": "256GB"},
    {"name": "512GB"},
  ];
  List colorOptions = [
    {"name": translateData(" احمر ", " Red ")},
    {"name": translateData(" اسود ", "Black")},
    {"name": translateData(" ابيض ", "White")},
    {"name": translateData(" فضي ", " Gray ")},
  ];

  initianlData() {
    itemsModel = Get.arguments['itemsModel'];
  }

  onChangeOption(int val) {
    selectedOption = val;
    update();
  }

  onPageChange(int val) {
    currentPage = val;
    update();
  }

  @override
  void onInit() {
    initianlData();
    super.onInit();
  }
}
