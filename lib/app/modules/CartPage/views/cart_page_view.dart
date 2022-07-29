import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_hay/app/modules/MyProducts/views/my_products_view.dart';
import 'package:get_hay/app/modules/home/controllers/home_controller.dart';
import 'package:get_hay/constants/enum.dart';

import 'package:get_hay/widget/widdgetpage.dart';

import '../controllers/cart_page_controller.dart';

class CartPageView extends GetView<CartPageController> {
  final CartPageController cartPageController = Get.put(CartPageController());
  final HomeController homeController = Get.put(HomeController());
  final _formKey = GlobalKey<FormState>();

  Widget inputShippingAddress() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 5,
            ),
          ],
        ),
        height: 40,
        width: Get.size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 100.0),
          child: TextFormField(
            controller: cartPageController.newShippingAddress,
            validator: (value) {
              if (value.isEmpty) {
                return 'Address cannot be empty';
              } else
                return null;
            },
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.lightBlueAccent,
              labelStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding addShippingAddressButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 50,
        width: Get.size.width,
        decoration: BoxDecoration(
          color: Colors.red[800],
          borderRadius: BorderRadius.circular(15),
        ),
        child: MaterialButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              cartPageController.addShippingButtonPress();
            }
          },
          child: Center(
            child: controller.state == ViewState.Busy
                ? CircularProgressIndicator()
                : Text(
                    'Add Address',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Enter your shipping address'),
              content: SizedBox(
                height: Get.height / 6,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      inputShippingAddress(),
                      addShippingAddressButton(context)
                    ],
                  ),
                ),
              ));
        });
  }

  Future<void> _proceedToCheckoutDialog(
      BuildContext context, String place, int id) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Place order to $place?'),
            content: Text('Are you sure you want place order to this place?'),
            actions: [
              MaterialButton(
                elevation: 0,
                child: Text("Yes"),
                onPressed: () {
                  Map shippingAddressPk = {"shipping": id};
                  cartPageController.placeOrder(shippingAddressPk, context);
                },
              ),
              MaterialButton(
                elevation: 0,
                child: Text("No"),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          );
        });
  }

  Future<void> _shippingAddressDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose your Shipping address'),
          content: SizedBox(
            height: Get.height / 3,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      cartPageController.shippingAddress.length, (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: MaterialButton(
                            minWidth: Get.width,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                cartPageController
                                    .shippingAddress[index].address
                                    .toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            onPressed: () {
                              Get.back();
                              _proceedToCheckoutDialog(
                                context,
                                cartPageController
                                    .shippingAddress[index].address
                                    .toString(),
                                cartPageController.shippingAddress[index].id,
                              );
                            },
                          ),
                        ),
                        Divider()
                      ],
                    );
                  })),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Add new Shipping address'),
              onPressed: () {
                Navigator.of(context).pop();
                _displayTextInputDialog(context);
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowGlow();
        return;
      },
      child: GestureDetector(
        onTap: () {
          final FocusScopeNode currentScope = FocusScope.of(context);
          if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
            FocusManager.instance.primaryFocus.unfocus();
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: new AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.red),
            elevation: 1,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.red),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              "CART PAGE",
              style: TextStyle(
                color: Colors.red[400],
                fontSize: 18,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: Offset(0, 0))
                      ],
                    ),
                    margin: EdgeInsets.only(
                        top: 20, bottom: 6, right: 20, left: 20),
                    height: 100,
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 80,
                          child: Image.asset(
                            "assest/a.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          'Place Advertisement Here',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  gap(14, 0),
                  Obx(
                    () => controller.state == ViewState.Busy ||
                            controller.products == null
                        ? Container(
                            height: 220,
                            width: 220,
                            child: Center(
                                child: Container(
                              height: 60,
                              width: 60,
                              child: SpinKitCircle(
                                color: Colors.red[400],
                              ),
                            )),
                          )
                        : (controller.products.length == 0
                            ? Container(
                                height: Get.height * 0.6,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.shopping_cart_outlined,
                                        size: 60,
                                        color: Colors.red[400],
                                      ),
                                      gap(15, 0),
                                      Text('Nothing in cart!',
                                          style: TextStyle(
                                              color: Colors.red[400],
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              )
                            : Column(
                                children: [
                                  Text(
                                    "Your Order",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.red[400],
                                        fontWeight: FontWeight.w600),
                                  ),
                                  gap(6, 0),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 6, top: 16, bottom: 10),
                                    height: 220,
                                    width: Get.width,
                                    child: Column(
                                        children: List.generate(1, (index) {
                                      return Container(
                                        height: 220,
                                        child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: List.generate(
                                                cartPageController
                                                    .products.length, (index2) {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                    right: 4,
                                                    top: 2,
                                                    bottom: 12,
                                                    left: 14),
                                                padding: EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.4),
                                                        offset: Offset(0, 0),
                                                        blurRadius: 3,
                                                        spreadRadius: 1,
                                                      )
                                                    ]),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    deleteIcon(
                                                        'delete button working',
                                                        cartPageController
                                                            .products[index2]
                                                            .product
                                                            .id,
                                                        index2),
                                                    imageContainer(
                                                        cartPageController
                                                            .products[index2]
                                                            .product
                                                            .image,
                                                        cartPageController
                                                            .products[index2]
                                                            .product),
                                                    gap(6, 0),
                                                    Text(
                                                      cartPageController
                                                          .products[index2]
                                                          .product
                                                          .name,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${cartPageController.products[index2].product.offerPrice.toString()}",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.red[400],
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        MaterialButton(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10,
                                                                    right: 10),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4)),
                                                            elevation: 0,
                                                            minWidth: 0,
                                                            height: 0,
                                                            color: Colors
                                                                .grey[100],
                                                            child: Text(
                                                              '-',
                                                              style: TextStyle(
                                                                  fontSize: 22),
                                                            ),
                                                            onPressed: () {
                                                              if (controller
                                                                          .count[
                                                                      index2] <=
                                                                  1) {
                                                              } else {
                                                                cartPageController.decrement(
                                                                    index2,
                                                                    cartPageController
                                                                        .products[
                                                                            index2]
                                                                        .product
                                                                        .id);
                                                              }
                                                            }),
                                                        Container(
                                                          height: 32,
                                                          width: 70,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .red[400],
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          4))),
                                                          alignment:
                                                              Alignment.center,
                                                          child: TextFormField(
                                                            onEditingComplete:
                                                                () {
                                                              cartPageController
                                                                          .count[
                                                                      index2] =
                                                                  int.parse(cartPageController
                                                                      .controllers[
                                                                          index2]
                                                                      .text);

                                                              cartPageController.addToCart(
                                                                  cartPageController
                                                                          .count[
                                                                      index2],
                                                                  cartPageController
                                                                      .products[
                                                                          index2]
                                                                      .product
                                                                      .id);
                                                              cartPageController
                                                                      .priceTotalList[
                                                                  index2] = cartPageController
                                                                      .products[
                                                                          index2]
                                                                      .product
                                                                      .offerPrice
                                                                      .round() *
                                                                  cartPageController
                                                                          .count[
                                                                      index2];
                                                              FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      FocusNode());
                                                              cartPageController
                                                                  .updatePrice();
                                                              print(
                                                                  'price: ${cartPageController.priceTotalList[index2]}');
                                                              print(
                                                                  'totalprice: ${cartPageController.finalTotal}');
                                                            },
                                                            decoration:
                                                                new InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              focusedBorder:
                                                                  InputBorder
                                                                      .none,
                                                              enabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              errorBorder:
                                                                  InputBorder
                                                                      .none,
                                                              disabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            textAlign: TextAlign
                                                                .center,
                                                            controller: cartPageController
                                                                    .controllers[
                                                                index2]
                                                              ..text =
                                                                  cartPageController
                                                                      .count[
                                                                          index2]
                                                                      .toString()
                                                              ..selection = TextSelection
                                                                  .fromPosition(TextPosition(
                                                                      offset: cartPageController
                                                                          .controllers[
                                                                              index2]
                                                                          .text
                                                                          .length)),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                        MaterialButton(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10,
                                                                    right: 10),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4)),
                                                            elevation: 0,
                                                            minWidth: 0,
                                                            height: 0,
                                                            color: Colors
                                                                .grey[100],
                                                            child: Text(
                                                              '+',
                                                              style: TextStyle(
                                                                  fontSize: 22),
                                                            ),
                                                            onPressed: () {
                                                              controller.increment(
                                                                  index2,
                                                                  cartPageController
                                                                      .products[
                                                                          index2]
                                                                      .product
                                                                      .id);
                                                              print(
                                                                  cartPageController
                                                                          .count[
                                                                      index2]);
                                                            }),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              );
                                            })),
                                      );
                                    })),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: 10, left: 20, right: 20),
                                    height: 172,
                                    width: 380,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          offset: Offset(0, 0),
                                          blurRadius: 2,
                                          spreadRadius: 1,
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20,
                                              left: 50,
                                              right: 50,
                                              bottom: 00),
                                          child: Container(
                                            height: Get.height / 11,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Delivery Charge:",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    Text("Total:",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                                Obx(
                                                  () => Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        "\$ ${cartPageController.deliveryTotal.value.toString()}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Obx(() => Text(
                                                            "\$ ${cartPageController.finalTotal.value.toString()}",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          )),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 18.0),
                                          child: MaterialButton(
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            onPressed: () {
                                              if (cartPageController
                                                      .products.length !=
                                                  0) {
                                                if (cartPageController
                                                        .shippingAddress
                                                        .length ==
                                                    0) {
                                                  _displayTextInputDialog(
                                                      context);
                                                } else {
                                                  _shippingAddressDialog(
                                                      context);
                                                }
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "No item in cart. Add Item to cart to checkout.",
                                                    backgroundColor:
                                                        Colors.red[400],
                                                    textColor: Colors.white,
                                                    gravity: ToastGravity.TOP,
                                                    toastLength:
                                                        Toast.LENGTH_SHORT);
                                              }
                                            },
                                            child: Text(
                                              "Proceed To Checkout",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            color: Colors.red[400],
                                            padding: EdgeInsets.only(
                                                left: 60,
                                                right: 60,
                                                top: 10,
                                                bottom: 10),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
