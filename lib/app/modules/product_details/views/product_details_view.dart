import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_hay/app/modules/CartPage/controllers/addToCart_controller.dart';
import 'package:get_hay/app/modules/profile/controllers/profile_controller.dart';
import 'package:get_hay/constants/enum.dart';
import 'package:get_hay/widget/wave_clipper.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  final ProductDetailsController productDetailsController =
      Get.put(ProductDetailsController());
  final AddToCartController addToCartController =
      Get.put(AddToCartController());
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Obx(() => controller.state == ViewState.Busy
                ? _buildLoadingWidget()
                : _buildSuccessWidget())));
  }

  Widget _buildLoadingWidget() {
    return SpinKitCircle(color: Colors.red);
  }

  Widget _buildSuccessWidget() {
    return Stack(
      children: [
        SizedBox(
          height: Get.size.height,
          child: ListView(children: [
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: Get.size.height / 3,
                child: Image.network(
                  productDetailsController.imageUrl,
                  scale: 1.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Text(
                        productDetailsController.name.toUpperCase(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          productDetailsController.offerPrice >
                                  productDetailsController.sellingPrice
                              ? Text(
                                  '\$${productDetailsController.sellingPrice.toString()}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                  ),
                                )
                              : Text(
                                  '\$${productDetailsController.offerPrice.toString()}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                  ),
                                ),
                          SizedBox(
                            width: 10,
                          ),
                          productDetailsController.sellingPrice ==
                                      productDetailsController.offerPrice ||
                                  productDetailsController.offerPrice >
                                      productDetailsController.sellingPrice
                              ? Container()
                              : Text(
                                  productDetailsController.sellingPrice
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red.withOpacity(0.4),
                                      decoration: TextDecoration.lineThrough),
                                ),
                          SizedBox(
                            width: 10,
                          ),
                          productDetailsController.sellingPrice !=
                                      productDetailsController.offerPrice ||
                                  productDetailsController.sellingPrice ==
                                      productDetailsController.offerPrice
                              ? Container()
                              : Text(
                                  ' ${productDetailsController.sellingPrice - productDetailsController.offerPrice}',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.red),
                                ),
                        ],
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: Get.height / 2.5,
                child: DefaultTabController(
                  length: 4,
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      TabBar(
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.red[400],
                        labelColor: Colors.red[400],
                        tabs: [
                          Tab(
                            child: Text(
                              'INFO',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'FEATURES',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'STORY',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'REVIEW',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: Get.height,
                        child: TabBarView(
                          children: [
                            Text(
                              productDetailsController.description,
                              style: TextStyle(fontSize: 14),
                            ),
                            ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Wrap(
                                    spacing: 42,
                                    children: [
                                      Text(
                                        "Quantity: ",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        productDetailsController.quantity
                                            .toString(),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                                Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Wrap(
                                      spacing: 44,
                                      children: [
                                        Text(
                                          "In Stock: ",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          productDetailsController.inStock
                                              ? "Yes"
                                              : "No",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: productDetailsController
                                                      .inStock
                                                  ? Colors.green
                                                  : Colors.red),
                                        ),
                                      ],
                                    )),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Wrap(
                                    spacing: 20,
                                    children: [
                                      Text(
                                        "Will deliver: ",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        productDetailsController.willDeliver
                                            ? "Yes"
                                            : "No",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: productDetailsController
                                                  .willDeliver
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Wrap(
                                    spacing: 82,
                                    children: [
                                      Text(
                                        "Unit: ",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        productDetailsController.unit,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Species: ",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text(
                                        productDetailsController.species,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(''),
                            Text(''),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            productDetailsController.from == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        elevation: 0,
                        minWidth: 30,
                        height: 40,
                        color: Colors.grey[200],
                        child: Text(
                          '-',
                          style: TextStyle(fontSize: 30),
                        ),
                        onPressed: () {
                          if (productDetailsController.count <= 1) {
                          } else {
                            productDetailsController.decrement();
                          }
                        },
                      ),
                      GetBuilder<ProductDetailsController>(
                          builder: (controller) {
                        return Container(
                          height: 45,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0))),
                          child: Center(
                            child: TextFormField(
                              onChanged: (values) {
                                productDetailsController.count.value =
                                    int.parse(values);
                              },
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              controller: productDetailsController
                                  .quantityController
                                ..text =
                                    productDetailsController.count.toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        );
                      }),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        elevation: 0,
                        minWidth: 30,
                        height: 40,
                        color: Colors.grey[200],
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 30),
                        ),
                        onPressed: () {
                          productDetailsController.increment();
                        },
                      ),
                      MaterialButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        color: Colors.red,
                        child: productDetailsController.state == ViewState.Busy
                            ? CircularProgressIndicator()
                            : Text(
                                'Contact Seller'.toUpperCase(),
                                style: TextStyle(color: Colors.white),
                              ),
                        onPressed: () {
                          productDetailsController.launchCaller();
                        },
                      )
                    ],
                  )
                : SizedBox()
          ]),
        ),
        Positioned(
          child: MaterialButton(
            padding: EdgeInsets.all(4),
            shape: CircleBorder(),
            color: Colors.white,
            minWidth: 30,
            onPressed: () => Get.back(),
            child: Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.red[800],
            ),
          ),
          top: 14,
          left: 14,
        ),
        // productDetailsController.from == 0
        //     ? Positioned(
        //         child: MaterialButton(
        //           padding: EdgeInsets.all(4),
        //           shape: CircleBorder(),
        //           color: Colors.white,
        //           minWidth: 30,
        //           onPressed: () {
        //             Get.toNamed(Routes.CART_PAGE);
        //           },
        //           child: Icon(
        //             Icons.shopping_cart_outlined,
        //             size: 20,
        //             color: Colors.red[800],
        //           ),
        //         ),
        //         top: 14,
        //         right: 10,
        //       )
        //     : SizedBox()
      ],
    );
  }
}


                      // MaterialButton(
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(0)),
                      //   color: Colors.red,
                      //   child: productDetailsController.state == ViewState.Busy
                      //       ? CircularProgressIndicator()
                      //       : Text(
                      //           'ADD TO CART',
                      //           style: TextStyle(color: Colors.white),
                      //         ),
                      //   onPressed: () {
                      //     addToCartController.addToCart(
                      //         int.parse(productDetailsController
                      //             .quantityController.text),
                      //         productDetailsController.id);
                      //     print('Product id:  ${productDetailsController.id}');
                      //   },
                      // )