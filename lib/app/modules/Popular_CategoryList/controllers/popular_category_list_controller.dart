import 'package:get/get.dart';

class PopularCategoryListController extends GetxController {
 
  final currentIndex = 0.obs;

  setIndex(index) {
    print(index);
    currentIndex.value = index;
    update();
  }

  final count = 0.obs;
  var isSelected = false.obs;

  Future<void> refresh() async{
    
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
