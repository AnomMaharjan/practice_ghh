import 'package:get/get.dart';

import '../controllers/add_product_seller_controller.dart';

class AddProductSellerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProductSellerController>(
      () => AddProductSellerController(),
    );
  }
}
