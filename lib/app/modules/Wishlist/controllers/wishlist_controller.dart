import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_hay/api/api_auth_provider.dart';
import 'package:get_hay/app/modules/home/controllers/home_controller.dart';
import 'package:get_hay/base%20model/base_model.dart';
import 'package:get_hay/constants/enum.dart';
import 'package:get_hay/models/wishlist.dart';

class WishlistController extends BaseController {
  final HomeController homeController = Get.put(HomeController());
  final apiAuthProvider = ApiAuthProvider();

  var ids = List<int>().obs;
  final count = 0.obs;
  var added = false.obs;
  bool deleted = false;
  var favorite = false.obs;
  List<WishlistProduct> wishListProduct =
      List<WishlistProduct>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    fetchProductsWishList();
  }

  void fetchProductsWishList() async {
    setState(ViewState.Busy);
    print('chalyo ');
    wishListProduct = await apiAuthProvider.getWishListProducts();
    print("wishlist$wishListProduct");
    setState(ViewState.Retrieved);
  }

  populateWishListId() {
    for (var i = 0; i < wishListProduct.length; i++) {
      ids.add(wishListProduct[i].product.id.round());
      print("length of ids   ${ids.length}");
    }
  }

  addToWishList(int id) async {
    added.value = await apiAuthProvider.addToWishList(id);
    if (added.value) {
      homeController.fetchProducts();
      fetchProductsWishList();
      Fluttertoast.showToast(
          msg: 'Product added to Wish list!',
          backgroundColor: Colors.red[400],
          gravity: ToastGravity.TOP,
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white);
      return true;
    } else {
      return false;
    }
  }

  deleteWishList(int id) async {
    deleted = await apiAuthProvider.deleteWishList(id);
    if (deleted) {
      print("deleted products $deleted");
      wishListProduct.removeWhere((item) => item.id == id);
      homeController.fetchProducts();
      update();
      fetchProductsWishList();
      return true;
    } else {
      return false;
    }
  }

  void addToCart(int quantity, int id) async {
    setState(ViewState.Busy);
    await apiAuthProvider.addToCart(1, id);
    Fluttertoast.showToast(
        msg: 'Product successfully added to cart!',
        textColor: Colors.white,
        backgroundColor: Colors.red[400],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP);
    setState(ViewState.Retrieved);
  }

  Future<void> refresh() async {
    fetchProductsWishList();
    setState(ViewState.Retrieved);
  }

//wishlist controller

}
