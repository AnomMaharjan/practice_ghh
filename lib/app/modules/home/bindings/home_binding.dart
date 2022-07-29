import 'package:get/get.dart';

import 'package:get_hay/app/modules/CartPage/controllers/addToCart_controller.dart';
import 'package:get_hay/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddToCartController>(
      () => AddToCartController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
