import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_hay/app/modules/Popular_CategoryList/views/popular_category_list_view.dart';
import 'package:get_hay/app/modules/Stock_CategoryList/views/stock_category_list_view.dart';

import '../controllers/all_catergory_list_controller.dart';

class AllCatergoryListView extends GetView<AllCatergoryListController> {
  final AllCatergoryListController con = AllCatergoryListController();

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowGlow();
        return;
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            PopularCategoryListView(),
            SizedBox(
              height: 3,
            ),
            StockCategoryListView(),
            SizedBox(
              height: 3,
            ),
            PopularCategoryListView(),
            SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }
}
