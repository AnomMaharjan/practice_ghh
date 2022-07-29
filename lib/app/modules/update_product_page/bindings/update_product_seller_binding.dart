import 'package:get/get.dart';

import '../controllers/update_product_seller_controller.dart';

class UpdateProductSellerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateProductController>(
      () => UpdateProductController(),
    );
  }
}
