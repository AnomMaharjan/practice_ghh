import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_hay/constants/enum.dart';

import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  final CategoriesController categoriesController =
      Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Obx(() => controller.state == ViewState.Busy
                ? _buildLoadingWidget()
                : _buildSuccessWidget())));
  }

  Widget _buildSuccessWidget() {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children:
            List.generate(categoriesController.categories.length, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: Offset(0, 0),
                    blurRadius: 4,
                    spreadRadius: 1)
              ],
            ),
            child: Row(
              children: [
                Row(
                  children: [
                    Text(
                      'Name: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      categoriesController.categories[index].name,
                      style: TextStyle(
                          color: Colors.red[400],
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )
                  ],
                ),
                // SizedBox(width: 30),
                // gap(8, 0),
                // Row(
                //   children: [
                //     Text(
                //       'Id: ',
                //       style: TextStyle(fontSize: 16),
                //     ),
                //     Text(
                //       categoriesController.categories[index].id
                //           .toString(),
                //       style: TextStyle(
                //           color: Colors.red[400],
                //           fontWeight: FontWeight.w600,
                //           fontSize: 18),
                //     )
                //   ],
                // ),
              ],
            ),
          );
        }),
      ),
    ));
  }

  Widget _buildLoadingWidget() {
    return SpinKitCircle(
      color: Colors.red,
    );
  }
}
