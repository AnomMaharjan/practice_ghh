import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellerDashboardController extends GetxController {
  final count = 0.obs;
  final currentIndex = 0.obs;
  
  final colorOne = Colors.red[800].obs;
  final colorTwo = Colors.grey.shade400.obs;

  setBottomBarIndex(index) {
    print(index);
    currentIndex.value = index;
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

}
