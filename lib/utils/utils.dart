import 'package:get/get.dart';

showSnackBarMessage(title, message) {
  return Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM);
}
