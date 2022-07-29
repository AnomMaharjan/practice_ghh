import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_hay/app/modules/home/controllers/home_controller.dart';
import 'package:get_hay/widget/popular_widget_view.dart';

import '../controllers/popular_category_list_controller.dart';

class PopularCategoryListView extends GetView<PopularCategoryListController> {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                // decoration: BoxDecoration(
                //     color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Popular",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                width: 20,
              ),
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
          height: 6,
        ),
        SizedBox(
            height: 200,
            child: Obx(
              () => homeController.productAvailable.value
                  ? ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(homeController.products.length,
                          (index) {
                        return PopularWidgetView(
                          product: homeController.products[index],
                        );
                      }))
                  : Center(
                      child: Container(
                      height: 60,
                      width: 60,
                      child: CircularProgressIndicator(),
                    )),
            )),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}
