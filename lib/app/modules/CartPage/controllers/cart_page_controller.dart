import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_hay/api/api_auth_provider.dart';
import 'package:get_hay/app/modules/CartPage/controllers/addToCart_controller.dart';
import 'package:get_hay/base%20model/base_model.dart';
import 'package:get_hay/constants/enum.dart';
import 'package:get_hay/models/cart_model.dart';
import 'package:get_hay/models/shipping_address_model.dart';

class CartPageController extends BaseController {
  final TextEditingController quantityController = TextEditingController();
  final AddToCartController addToCartController = AddToCartController();
  var cartList = CartList().obs;
  var myProducts = List<CartList>().obs;
  var products = List().obs;
  var shippingAddress = List<ShippingAddress>().obs;
  final apiAuthProvider = ApiAuthProvider();
  var count = List<int>().obs;
  var deliveryTotalList = List<int>().obs;
  var priceTotalList = List<int>().obs;
  var deliveryTotal = 0.obs;
  var priceTotal = 0.obs;
  var finalTotal = 0.obs;
  var totalPrices = 0.obs;
  var quantity = 1.obs;
  List<TextEditingController> controllers = [];

  final TextEditingController newShippingAddress = TextEditingController();
  bool isOrderPlaced = false;
  ShippingAddress shippingAddressResponse;
  bool isDeleted = false;
  var a = 2.obs;

  @override
  void onInit() {
    super.onInit();
    print("khai ta khai");
    fetchCartList();
    getShippingAddress();
  }

  populateDeliveryTotalList() {
    for (var i = 0; i < products.length; i++) {
      deliveryTotalList.add(products[i].product.deliveryCharge.round());
      print("length of delivery   ${deliveryTotalList.length}");
    }
  }

  populateCount() {
    for (var i = 0; i < products.length; i++) {
      count.add(products[i].quantity);
    }
  }

  updatePrice() {
    finalTotal.value = 0;
    for (var i = 0; i < products.length; i++) {
      finalTotal = finalTotal + priceTotalList[i] + deliveryTotalList[i];
    }
  }

  populateController() {
    for (var i = 0; i < products.length; i++) {
      controllers.add(TextEditingController());
    }
  }

  populatePriceTotalList() {
    print("yo challa ta khai?");
    for (var i = 0; i < products.length; i++) {
      priceTotalList.add(products[i].product.offerPrice.round() * count[i]);
      print("length of delivery   ${deliveryTotalList.length}");
    }
  }

  deliverCharge() {
    for (var i = 0; i < deliveryTotalList.length; i++) {
      deliveryTotal = deliveryTotal + deliveryTotalList[i];
      print("Delivery total $deliveryTotal");
    }
  }

  priceCharge() {
    for (var i = 0; i < priceTotalList.length; i++) {
      priceTotal = priceTotal + priceTotalList[i];
      print("Price total $priceTotal");
    }
    finalTotal = priceTotal + deliveryTotal.value;
  }

  @override
  void onReady() {
    super.onReady();
  }

  void fetchCartList() async {
    setState(ViewState.Busy);
    cartList.value = await apiAuthProvider.getCartListProducts();
    products.assignAll(cartList.value.products);
    populateCount();
    populateDeliveryTotalList();
    populatePriceTotalList();
    deliverCharge();
    priceCharge();
    populateController();
    setState(ViewState.Retrieved);
  }

  void getShippingAddress() async {
    shippingAddress.value = await apiAuthProvider.getShippingAddress();
    print("shipping address length ${shippingAddress.length}");
  }

  void deleteCartList(int id, int index) async {
    isDeleted = await apiAuthProvider.deleteCartItem(id);
    if (isDeleted) {
      products.removeWhere((item) => item.product.id == id);

      deliverChargeAfterDelete(index);
      priceChargeAfterDelete(index);
      count.removeAt(index);
      priceTotalList.removeAt(index);
      deliveryTotalList.removeAt(index);
      Fluttertoast.showToast(
          msg: 'Successfully deleted from cart!',
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white,
          backgroundColor: Colors.red[400],
          gravity: ToastGravity.TOP);
    }
  }

  priceChargeAfterDelete(int index) {
    finalTotal = finalTotal - priceTotalList[index] - deliveryTotalList[index];
  }

  deliverChargeAfterDelete(int index) {
    deliveryTotal = deliveryTotal - deliveryTotalList[index];
  }

  Future<ShippingAddress> addNewShippingAddress(Map address) async {
    setState(ViewState.Busy);
    shippingAddressResponse =
        await apiAuthProvider.addNewShippingAddress(address);
    print("Shipping address ${shippingAddressResponse.address}");
    setState(ViewState.Retrieved);
    return shippingAddressResponse;
  }

  void addShippingButtonPress() {
    Map shippingAddressBody = {
      "address": newShippingAddress.text.trim(),
    };

    addNewShippingAddress(shippingAddressBody).then((ShippingAddress value) {
      print(shippingAddressResponse.address);
      if (shippingAddressResponse.address != null) {
        shippingAddress.add(shippingAddressResponse);
        print("codes");
        Get.back();
        Fluttertoast.showToast(
            msg: 'Successfully added address!',
            backgroundColor: Colors.red[400],
            textColor: Colors.white,
            gravity: ToastGravity.TOP,
            toastLength: Toast.LENGTH_SHORT);
      }
    });
  }

  Future placeOrder(Map shippingAddressPk, context) async {
    setState(ViewState.Busy);
    isOrderPlaced = await apiAuthProvider.placeOrder(shippingAddressPk);
    if (isOrderPlaced) {
      print(isOrderPlaced);
      Navigator.pop(context);
      Get.back();
      Fluttertoast.showToast(
          msg: 'Order placed successfully. Check order page to see your orders',
          backgroundColor: Colors.red[400],
          gravity: ToastGravity.TOP,
          textColor: Colors.white);
      // Get.snackbar(
      //     "Order placed successfully", "Check order page to see your orders");
    }

    setState(ViewState.Retrieved);
  }

  @override
  void onClose() {}

  void addToCart(int quantity, int id) async {
    await apiAuthProvider.addToCart(quantity, id);
  }

  void increment(int index, int productId) {
    count[index] = count[index] + 1;
    finalTotal.value =
        finalTotal.value + products[index].product.offerPrice.round();
    print("adding count ${count[index]}");
    addToCart(count[index], productId);
  }

  void decrement(int index, int productId) {
    count[index] = count[index] - 1;
    finalTotal.value =
        finalTotal.value - products[index].product.offerPrice.round();
    print("subtracting count ${count[index]}");
    print(finalTotal);
    addToCart(count[index], productId);
  }
}
