import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_hay/app/modules/Popular_CategoryList/views/popular_category_list_view.dart';
import 'package:get_hay/app/modules/Stock_CategoryList/views/stock_category_list_view.dart';
import 'package:get_hay/app/modules/home/controllers/home_controller.dart';
import 'package:get_hay/app/modules/search_page/views/search_page_view.dart';

import '../controllers/category_item_list_controller.dart';

class CategoryItemListView extends GetView<CategoryItemListController> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10),
          child: Column(
            children: [
              inputSearch(),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    homeController.categories.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          homeController.updateCategoryIndex(index);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 6),
                              child: Text(
                                homeController.categories[index],
                                style: TextStyle(
                                    color: homeController.categoryIndex == index
                                        ? Colors.red
                                        : Colors.black45),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 18),
                              height: 2,
                              width: 15,
                              color: homeController.categoryIndex == index
                                  ? Colors.red
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                child: GetBuilder<HomeController>(
                  builder: (_) {
                    switch (_.categoryIndex) {
                      case 1:
                        return StockCategoryListView();
                      case 2:
                        return PopularCategoryListView();
                      case 3:
                        return StockCategoryListView();
                      case 4:
                        return PopularCategoryListView();
                      case 5:
                        return StockCategoryListView();
                      default:
                        return Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            PopularCategoryListView(),
                            SizedBox(
                              height: 20,
                            ),
                            StockCategoryListView(),
                          ],
                        );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

inputSearch() {
  return Row(
    children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 20, top: 4),
          margin: EdgeInsets.only(left: 18, right: 18, top: 0, bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(38),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: Offset(-1, 4),
                blurRadius: 3,
                spreadRadius: 1,
              )
            ],
          ),
          child: TextFormField(
            onTap: () {
              Get.to(() => SearchPageView());
            },
            autofocus: false,
            readOnly: true,
            maxLines: 1,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.lightBlueAccent,
              suffixIcon: Icon(
                Icons.search,
                color: Colors.red,
              ),
              hintText: 'Search',
            ),
          ),
        ),
      ),
    ],
  );
}
