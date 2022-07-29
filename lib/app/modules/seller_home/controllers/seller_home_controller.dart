import 'package:get/get.dart';
import 'package:get_hay/base%20model/base_model.dart';

class SellerHomeController extends BaseController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
