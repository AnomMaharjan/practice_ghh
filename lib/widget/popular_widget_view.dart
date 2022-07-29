import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_hay/app/modules/MyProducts/views/my_products_view.dart';
import 'package:get_hay/app/modules/Wishlist/controllers/wishlist_controller.dart';
import 'package:get_hay/app/routes/app_pages.dart';
import 'package:get_hay/models/product.dart';
import 'package:get_hay/widget/widdgetpage.dart';

class PopularWidgetView extends GetView {
  final Product product;

  PopularWidgetView({this.product, IconButton favoriteIcon});

  final WishlistController wishListController = Get.put(WishlistController());
  var isAdded = false.obs;

  @override
  Widget build(BuildContext context) {
    isAdded.value = product.isAdded;
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.PRODUCT_DETAILS, arguments: {
          "from": 0,
          "data": product,
        });
      },
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            margin: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: Offset(0, 4),
                    blurRadius: 3,
                    spreadRadius: 1,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => isAdded.value == false || isAdded.value == null
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
                                    product.isAdded = true;
                                    isAdded.value = product.isAdded;
                                  }
                                },
                              ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
                gap(10, 0),
                imageContainer(product.image, product),
                gap(13, 0),
                Flexible(
                  flex: 2,
                  child: SizedBox(
                    width: 136,
                    child: Center(
                      child: Text(
                        product.name.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$${product.offerPrice.toString()}",
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        product.offerPrice >= product.sellingPrice
                            ? SizedBox()
                            : Text(
                                "\$${product.sellingPrice.toString()}",
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.4),
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 6,
          ),
        ],
      ),
    );
  }
}
