import 'package:get/get.dart';

validInput(String value, min, max, type) {
  if (value.isEmpty) {
    return "cant_be_empty".tr;
  }

  if (type == "username") {
    if (!GetUtils.isUsername(value)) {
      return "invalid_username".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "invalid_email".tr;
    }
  }

  if (value.length < min) {
    return "${"cant_be_less".tr} $min ${"characters".tr}";
  }

  if (value.length > max) {
    return "${"cant_be_larger".tr} $max ${"characters".tr}";
  }
}
