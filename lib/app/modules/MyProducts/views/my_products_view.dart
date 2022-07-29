import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:get_hay/app/modules/update_product_page/views/update_product_seller_view.dart';

import 'package:get_hay/constants/enum.dart';
import 'package:get_hay/widget/widdgetpage.dart';

import '../controllers/my_products_controller.dart';

class MyProductsView extends GetView<MyProductsController> {
  final MyProductsController orderPageController =
      Get.put(MyProductsController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Obx(() => controller.state == ViewState.Busy
                ? _buildLoadingWidget()
                : _buildSuccessWidget(context))));
  }

  Widget _buildLoadingWidget() {
    return SpinKitCircle(color: Colors.red);
  }

  Widget _buildSuccessWidget(context) {
    return orderPageController.myProducts.length == 0
        ? Center(
            child: Text(
              'No Products',
              style: TextStyle(fontSize: 20),
            ),
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                gap(12, 0),
                Expanded(
                  child: ListView(
                    children: List.generate(
                        orderPageController.myProducts.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 0.0),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  offset: Offset(0, 0),
                                  blurRadius: 7,
                                  spreadRadius: 1)
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: imageContainerRec(
                                      orderPageController
                                          .myProducts[index].image
                                          .toString(),
                                      orderPageController.myProducts[index],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 24.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          gap(10, 0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Text(
                                                  orderPageController
                                                      .myProducts[index].name,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.red[400],
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: IconButton(
                                                  padding: EdgeInsets.zero,
                                                  constraints: BoxConstraints(),
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                'Are you sure, you want to delete this product?'),
                                                            actions: <Widget>[
                                                              FlatButton(
                                                                  child: Text(
                                                                      'Yes'),
                                                                  onPressed:
                                                                      () {
                                                                    orderPageController.deleteMyProduct(orderPageController
                                                                        .myProducts[
                                                                            index]
                                                                        .id);
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop(
                                                                            false);
                                                                  }),
                                                              FlatButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop(
                                                                            false);
                                                                  },
                                                                  child: Text(
                                                                      'No'))
                                                            ],
                                                          );
                                                        });
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                    size: 26,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          gap(6, 0),
                                          Row(
                                            children: [
                                              Text(
                                                'In Stock:',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Obx(
                                                () => orderPageController
                                                            .myProducts[index]
                                                            .inStock ==
                                                        true
                                                    ? Text(
                                                        "Yes",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.green,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )
                                                    : Text(
                                                        "No",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Delivery Charge:',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                orderPageController
                                                    .myProducts[index]
                                                    .deliveryCharge
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w300),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                          gap(6, 8),
                                          Row(
                                            children: [
                                              Text(
                                                'Quantity:',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                orderPageController
                                                    .myProducts[index].quantity
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                          gap(6, 0),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: MaterialButton(
                                                    color: Colors.redAccent,
                                                    height: 30,
                                                    onPressed: () {
                                                      Get.to(
                                                          () =>
                                                              UpdateProductView(
                                                                id: orderPageController
                                                                    .myProducts[
                                                                        index]
                                                                    .id,
                                                              ),
                                                          arguments:
                                                              orderPageController
                                                                      .myProducts[
                                                                  index]);
                                                    },
                                                    child: Text(
                                                      "Update",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12),
                                                    )),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          );
  }
}

Widget gap(double hvalue, double wvalue) {
  return SizedBox(
    height: hvalue,
    width: wvalue,
  );
}
