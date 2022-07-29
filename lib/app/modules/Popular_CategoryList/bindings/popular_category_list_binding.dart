import 'package:get/get.dart';

import '../controllers/popular_category_list_controller.dart';

class PopularCategoryListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PopularCategoryListController>(
      () => PopularCategoryListController(),
    );
  }
}
