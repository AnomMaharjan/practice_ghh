import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_hay/api/api_auth_provider.dart';
import 'package:get_hay/api/product.dart';
import 'package:get_hay/app/modules/map_picker/views/map_picker_view.dart';
import 'package:get_hay/models/profile.dart';

class HomeController extends GetxController {
  List categories = [
    "All",
    "Stock",
    "Popular",
    "Trending",
    "Entertaintment",
    "Old",
  ];
  int categoryIndex = 0;
  var pressed = false;

  var isSelected = false.obs;
  var appBarTitle = 'Home'.obs;

  final currentIndex = 0.obs;
  final colorOne = Colors.red[800].obs;
  final colorTwo = Colors.grey.shade400.obs;

  final count = 0.obs;
  final productAPI = ProductAPI();

  RxList products = [].obs;
  var productAvailable = false.obs;

  RxList wishListIcon = [].obs;

  final ApiAuthProvider _apiAuthProvider = ApiAuthProvider();

  Future<void> checkIfLocationIsSet() async {
    print("Checking Location");
    Profile profile = await _apiAuthProvider.getProfile();
    if (profile.latitude == 0 && profile.longitude == 0)
      Get.off(() => MapPickerView(), arguments: {"from": "login"});
  }

  updateCategoryIndex(int index) {
    categoryIndex = index;

    update();
  }

  setBottomBarIndex(index, title) {
    print(index);
    print(title);
    currentIndex.value = index;
    appBarTitle.value = title;
    update();
  }

  @override
  void onInit() {
    checkIfLocationIsSet();
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() {
    this.productAPI.getProducts().then((products) {
      print(products);
      this.products.assignAll(products);
      productAvailable.value = products != null;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
