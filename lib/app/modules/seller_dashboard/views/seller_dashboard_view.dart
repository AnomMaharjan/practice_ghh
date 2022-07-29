import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_hay/app/modules/sellerDrawer/views/seller_drawer_view.dart';
import 'package:get_hay/app/modules/seller_home/views/seller_home_view.dart';
import 'package:get_hay/app/routes/app_pages.dart';
import '../controllers/seller_dashboard_controller.dart';

class SellerDashboardView extends GetView<SellerDashboardController> {
  final SellerDashboardController con = Get.put(SellerDashboardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          drawer: SellerDrawerView(),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Add new product',
            backgroundColor: Colors.red,
            onPressed: () => Get.toNamed(Routes.ADD_PRODUCT_SELLER),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          body: SellerHomeView()),
    );
  }
}
