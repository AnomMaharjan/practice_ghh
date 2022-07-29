import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_hay/api/api_auth_provider.dart';
import 'package:get_hay/api/product.dart';
import 'package:get_hay/base%20model/base_model.dart';
import 'package:get_hay/config.dart';
import 'package:get_hay/mixins/location_access.dart';
import 'package:get_hay/models/product.dart';
import 'package:location/location.dart';

class SearchPageController extends BaseController with LocationAccessMixin {
  final _apiAuthProvider = ApiAuthProvider();
  final _productAPI = ProductAPI();
  var distanceValue = DISTANCE_DEFAULT.obs;
  var isVisible = false.obs;
  var sortBy = "".obs;
  final TextEditingController searchController = TextEditingController();
  List selectedCategoryList = [].obs;
  List categories = [].obs;
  List searchList = [].obs;
  var willDeliver = false.obs;
  RxBool pressedApply = false.obs;

  final List<Map> sortByOptions = [
    {
      "text": "Proximity",
      "value": "distance",
    },
    {
      "text": "Date posted",
      "value": "id",
    },
    {
      "text": "Price High to Low",
      "value": "-selling_price",
    },
    {
      "text": "Price Low to High",
      "value": "selling_price",
    },
  ];


  void applyFilter() async {
    LocationData locationData = await getLocation();
    print('Location Applying filter');
    _productAPI
        .filterProducts(
      searchText: searchController.text,
      distance: locationData == null ? null : distanceValue.value,
      ordering: sortBy.value,
      categories: List.from(selectedCategoryList),
      showDeliveryOnly: willDeliver.value,
      latitude: locationData == null ? null : locationData.latitude,
      longitude: locationData == null ? null : locationData.longitude,
    )
        .then(
      (List<Product> productList) {
        this.searchList.assignAll(productList);
        isVisible.value = false;
      },
    );
  }

  Future<void> fetchCategories() async {
    categories.assignAll(
      await _apiAuthProvider.getCategories(),
    );
  }

  void onCategoryTap({int category}) {
    print('Category $category tapped');
    if (isCategorySelected(category)) {
      selectedCategoryList.remove(category);
    } else {
      selectedCategoryList.add(category);
    }
  }

  void onSortByTap({String value}) {
    sortBy.value = value;
    print(" ${sortBy.value}");
  }

  bool isSorted(String value) {
    return sortBy.value == value;
  }

  bool isCategorySelected(int category) {
    return selectedCategoryList.contains(category);
  }

  final count = 0.obs;
  @override
  void onInit() {
    askCurrentLocation();
    fetchCategories();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
