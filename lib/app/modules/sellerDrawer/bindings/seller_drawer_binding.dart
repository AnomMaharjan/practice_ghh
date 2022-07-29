import 'package:get/get.dart';

import '../controllers/seller_drawer_controller.dart';

class SellerDrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SellerDrawerController>(
      () => SellerDrawerController(),
    );
  }
}
