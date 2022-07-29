import 'package:get/get.dart';

import '../controllers/stock_category_list_controller.dart';

class StockCategoryListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StockCategoryListController>(
      () => StockCategoryListController(),
    );
  }
}
