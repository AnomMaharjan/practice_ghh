import 'package:get/get.dart';

import '../controllers/all_catergory_list_controller.dart';

class AllCatergoryListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllCatergoryListController>(
      () => AllCatergoryListController(),
    );
  }
}
