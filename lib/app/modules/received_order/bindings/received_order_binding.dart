import 'package:get/get.dart';

import '../controllers/received_order_controller.dart';

class ReceivedOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReceivedOrderController>(
      () => ReceivedOrderController(),
    );
  }
}
