import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_hay/app/modules/Wishlist/controllers/wishlist_controller.dart';
import 'package:get_hay/app/modules/home/controllers/home_controller.dart';
import 'package:get_hay/app/routes/app_pages.dart';
import 'package:get_hay/models/product.dart';
import 'package:get_hay/widget/stock_widget.dart';
import '../controllers/stock_category_list_controller.dart';

class StockCategoryListView extends GetView<StockCategoryListController> {
  final HomeController homeController = Get.put(HomeController());
  final StockCategoryListController stockController =
      Get.put(StockCategoryListController());
  final WishlistController wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  // decoration: BoxDecoration(
                  //     color: Colors.redAccent.shade200,
                  //     borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Stock",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                // SizedBox(
                //   width: 20,
                // ),
                // Flexible(
                //   flex: 1,
                //   child: Container(
                //     padding: const EdgeInsets.only(right: 18.0),
                //     width: Get.width,
                //     child: Divider(
                //       thickness: 0.2,
                //       color: Colors.red,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Obx(
            () => homeController.productAvailable.value
                ? Column(
                    children:
                        List.generate(homeController.products.length, (index) {
                      Product product = homeController.products[index];
                      return StockWidgetView(
                        product: product,
                      );
                    }),
                  )
                : Center(
                    child: Container(
                    height: 60,
                    width: 60,
                    child: CircularProgressIndicator(),
                  )),
          ),
        ],
      ),
    );
  }
}

Widget imageContainerRec(value, argumentvalue) {
  return Stack(alignment: Alignment.center, children: [
    InkWell(
        onTap: () {
          value = {"from": 0, "data": argumentvalue};
          Get.toNamed(
            Routes.PRODUCT_DETAILS,
            arguments: value,
          );
        },
        child: Container(
          height: 100.0,
          width: 120.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                value,
              ),
            ),
          ),
        ))
  ]);
}
