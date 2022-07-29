import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_hay/api/api_auth_provider.dart';
import 'package:get_hay/base%20model/base_model.dart';
import 'package:get_hay/constants/enum.dart';

class AddToCartController extends BaseController {
  final ApiAuthProvider _apiAuthProvider = ApiAuthProvider();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void addToCart(int quantity, int id) async {
    setState(ViewState.Busy);
    bool success =  await _apiAuthProvider.addToCart(quantity, id);
    if(success) {   Fluttertoast.showToast(
        msg: 'Successfully added to cart!',
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.white,
        backgroundColor: Colors.red[400],
        gravity: ToastGravity.TOP);
    setState(ViewState.Retrieved);
  }}

  @override
  void onClose() {}
  void increment() => count.value++;
}
