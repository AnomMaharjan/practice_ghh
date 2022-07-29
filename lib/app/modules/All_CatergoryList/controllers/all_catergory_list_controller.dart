import 'package:get/get.dart';

class AllCatergoryListController extends GetxController {
  final pressed = true.obs;
  final count = 0.obs;

  var isOffline = false.obs;

  List<String> hayItems = [
    'Timothy Hay',
    'Timothy Hay',
    'Tisothy Hay',
    'Timothy Hay',
    'Timothy Hay',
    'Timothy Hay',
    'Tithy Hay',
    'Timothy Hay'
  ];

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

  changeIcon(index) {
    if (count.value == 0) {
      count.value = 1;
    } else {
      count.value = 0;
    }
  }
}
