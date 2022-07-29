import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_hay/app/modules/Category_Item_List/views/category_item_list_view.dart';
import 'package:get_hay/app/modules/Drawer/views/drawer_view.dart';
import 'package:get_hay/app/modules/Wishlist/views/wishlist_view.dart';
import 'package:get_hay/app/modules/home/controllers/home_controller.dart';
import 'package:get_hay/app/modules/orderPage/views/order_page_view.dart';
import 'package:get_hay/app/modules/profile/views/profile_view.dart';
import 'package:get_hay/widget/bottom_nav_bar.dart';

class HomeView extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus.unfocus();
          print(screenWidth.toString());
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerView(),
        // endDrawer: FilterView(),
        appBar: AppBar(
          brightness: Brightness.light,
          title: Obx(
            () => Text(
              homeController.appBarTitle.value,
              style: TextStyle(color: Colors.red),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.red),
          // actions: [
          //   IconButton(
          //     padding: EdgeInsets.only(),
          //     alignment: Alignment.center,
          //     icon: Icon(
          //       Icons.sort,
          //       color: Colors.red[400],
          //       size: 24,
          //     ),
          //     onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
          //   ),
          // ],
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (data) {
              switch (data.currentIndex.value) {
                case 3:
                  return ProfileView();
                case 2:
                  return OrderPageView();
                case 1:
                  return WishlistView();
                default:
                  return CategoryItemListView();
              }
            }),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
