import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_hay/app/modules/Wishlist/controllers/wishlist_controller.dart';
import 'package:get_hay/app/routes/app_pages.dart';
import 'package:get_hay/models/product.dart';

class StockWidgetView extends GetView {
  final Product product;

  StockWidgetView({this.product});

  final WishlistController wishListController = Get.put(WishlistController());
  var isAdded = false.obs;

  @override
  Widget build(BuildContext context) {
    isAdded.value = product.isAdded;
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.PRODUCT_DETAILS,
          arguments: {"from": 0, "data": product},
        );
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24, left: 16, right: 16),
          width: Get.width * 0.92,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                imageContainerRect(product.image, product),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 16,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent.shade100,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                'In Stock',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.green[600],
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                            Obx(() => isAdded.value == false ||
                                    isAdded.value == null
                                ? IconButton(
                                    splashRadius: 3,
                                    constraints: BoxConstraints(),
                                    padding: EdgeInsets.all(0),
                                    icon: Icon(
                                      Icons.favorite_border,
                                      size: 18,
                                      color: Colors.red,
                                    ),
                                    onPressed: () async {
                                      print("product id${product.id}");
                                      bool success = await wishListController
                                          .addToWishList(product.id);
                                      if (success) {
                                        product.isAdded = true;
                                        isAdded.value = product.isAdded;
                                      }
                                    },
                                  )
                                : IconButton(
                                    splashRadius: 3,
                                    constraints: BoxConstraints(),
                                    padding: EdgeInsets.all(0),
                                    icon: Icon(
                                      Icons.favorite,
                                      size: 18,
                                      color: Colors.red,
                                    ),
                                    onPressed: () async {
                                      print("product id${product.id}");
                                      bool success = await wishListController
                                          .deleteWishList(product.id);
                                      if (success) {
                                        product.isAdded = false;
                                        isAdded.value = product.isAdded;
                                      }
                                    },
                                  )),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          product.name.toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 78,
                        ),
                        Row(
                          children: [
                            Text(
                              "\$${product.offerPrice.toString()}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            product.offerPrice >= product.sellingPrice
                                ? SizedBox()
                                : Text(
                                    "\$${product.sellingPrice.toString()}",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black.withOpacity(0.4),
                                        decoration: TextDecoration.lineThrough),
                                  ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

Widget imageContainerRect(value, argumentvalue) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          value = {"from": 0, "data": argumentvalue};
          Get.toNamed(
            Routes.PRODUCT_DETAILS,
            arguments: value,
          );
        },
        child: Container(
          height: 160.0,
          width: 120.0,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: NetworkImage(value), fit: BoxFit.cover)),
        ),
      ),
    ],
  );
}
