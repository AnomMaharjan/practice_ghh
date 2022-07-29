import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_hay/api/api_auth_provider.dart';
import 'package:get_hay/base%20model/base_model.dart';
import 'package:get_hay/constants/enum.dart';
import 'package:get_hay/models/my_products_model.dart';

class MyProductsController extends BaseController {
  final apiAuthProvider = ApiAuthProvider();
  bool isDeleted = false;
  var myProducts = List<MyProducts>().obs;

  final count = 0.obs;

  @override
  void onInit() {
    fetchMyProducts();

    super.onInit();
  }

  void deleteMyProduct(int id) async {
    isDeleted = await apiAuthProvider.deleteProductItem(id);
    if (isDeleted) {
      myProducts.removeWhere((item) => item.id == id);
      Fluttertoast.showToast(
          msg: 'Product deleted successfully!',
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.red[400],
          backgroundColor: Colors.white,
          gravity: ToastGravity.TOP);
    }
  }

  void fetchMyProducts() async {
    setState(ViewState.Busy);
    // await apiAuthProvider.getMyProducts();
    myProducts.assignAll(await apiAuthProvider.getMyProducts());
    print(myProducts.length);
    setState(ViewState.Retrieved);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
