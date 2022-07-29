import 'package:get/get.dart';

enum Species { alfalfa, nativegrasses, clover, oat, straw }

class FilterController extends GetxController {
  final count = 0.obs;
  String dropdownValue = "0-500";

  changeDropdownValue(value) {
    dropdownValue = value;
    update();
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

  Species species = Species.alfalfa;
}
