import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_hay/app/routes/app_pages.dart';
import 'package:get_hay/constants/enum.dart';

import '../controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  final WishlistController wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Obx(() => wishlistController.state == ViewState.Busy
                ? _buildLoadingWidget()
                : _buildSuccessWidget())));
  }

  Widget _buildLoadingWidget() {
    return SpinKitCircle(color: Colors.red);
  }

  Widget _buildSuccessWidget() {
    return wishlistController.wishListProduct.length == 0
        ? Center(
            child: Text(
              'Nothing on your wishlist!',
              style: TextStyle(
                fontSize: 24,
                color: Colors.red[400],
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        : RefreshIndicator(
            onRefresh: () => wishlistController.refresh(),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 28.0, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Wish List',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  gap(12, 0),
                  ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: List.generate(
                        wishlistController.wishListProduct.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.PRODUCT_DETAILS, arguments: {
                            "from": 0,
                            "data": wishlistController
                                .wishListProduct[index].product,
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 0.0),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            padding: EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 16, top: 14),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: _imageHolder(
                                          wishlistController
                                              .wishListProduct[index]
                                              .product
                                              .image,
                                        )),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 24.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    wishlistController
                                                        .wishListProduct[index]
                                                        .product
                                                        .name,
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
                                                      icon: Icon(
                                                        Icons.delete,
                                                        color: Colors.red[400],
                                                        size: 28,
                                                      ),
                                                      onPressed: () {
                                                        wishlistController
                                                            .deleteWishList(
                                                                wishlistController
                                                                    .wishListProduct[
                                                                        index]
                                                                    .product
                                                                    .id);
                                                      }),
                                                )
                                              ],
                                            ),
                                            gap(8, 0),
                                            Text(
                                              wishlistController
                                                  .wishListProduct[index]
                                                  .product
                                                  .description,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.w300),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              wishlistController
                                                  .wishListProduct[index]
                                                  .product
                                                  .category
                                                  .name,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w300),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            gap(6, 8),
                                            Text(
                                              '\$${wishlistController.wishListProduct[index].product.offerPrice}',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            gap(16, 0),
                                            // _addToCartBttn(
                                            //     'Add to cart',
                                            //     wishlistController
                                            //         .wishListProduct[index]
                                            //         .product
                                            //         .id),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
  }

  Widget _imageHolder(String imagelink) {
    return Container(
      height: 160.0,
      width: 140.0,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(8),
        image: imagelink != null
            ? DecorationImage(
                image: NetworkImage(imagelink),
                fit: BoxFit.fill,
              )
            : DecorationImage(
                image: AssetImage('assest/a.jpg'),
                fit: BoxFit.fill,
              ),
      ),
    );
  }

  Widget _addToCartBttn(String bttnText, int id) {
    return FlatButton(
      color: Colors.red[400],
      onPressed: () {
        wishlistController.addToCart(1, id);
        print('This is id: $id');
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Text(
        bttnText,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget gap(double hvalue, double wvalue) {
    return SizedBox(
      height: hvalue,
      width: wvalue,
    );
  }
}
