import 'package:get/get.dart';

import '../controllers/my_productions_cut_controller.dart';

class MyProductionsCutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyProductionsCutController>(
      () => MyProductionsCutController(),
    );
  }
}
