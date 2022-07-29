import 'package:get/get.dart';

import 'package:get_hay/app/modules/Category_Item_List/controllers/category_item_list_controller.dart';

class CategoryItemListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryItemListController>(
      () => CategoryItemListController(),
    );
  }
}
