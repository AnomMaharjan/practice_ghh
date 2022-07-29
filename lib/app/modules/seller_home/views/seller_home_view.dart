import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_hay/app/modules/MyProducts/controllers/my_products_controller.dart';
import 'package:get_hay/app/modules/MyProducts/views/my_products_view.dart';
import 'package:get_hay/app/modules/profile/controllers/profile_controller.dart';
import 'package:get_hay/app/modules/received_order/views/received_order_view.dart';
import 'package:get_hay/widget/wave_clipper.dart';
import '../controllers/seller_home_controller.dart';

class SellerHomeView extends GetView<SellerHomeController> {
  final MyProductsController con = MyProductsController();
  final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowGlow();
        return;
      },
      child: Scaffold(
        body: Stack(children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: Get.height / 2.4,
              color: Colors.red,
            ),
          ),
          Container(
            height: Get.height * 0.25,
            padding: EdgeInsets.only(left: 40, right: 40, bottom: 30),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      profileController.profile == null
                          ? Text("User",
                              style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '${profileController.profile.firstName}',
                                  style: TextStyle(
                                      fontSize: 36,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 116,
                          width: 116,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: Offset(4, 2),
                                  spreadRadius: 2,
                                  blurRadius: 2)
                            ],
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(6),
                              bottomLeft: Radius.circular(6),
                            ),
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(6),
                              bottomLeft: Radius.circular(6),
                            ),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_960_720.jpg')),
                            color: Colors.white,
                          ),
                          // shape: BoxShape.circle),
                        ),
                        // ClipRRect(
                        //   child: Container(
                        //     child: ClipOval(
                        //       child: Image.network(
                        //         'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_960_720.jpg',
                        //         height: 100,
                        //         width: 100,
                        //         fit: BoxFit.cover,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 170),
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: TabBar(
                        unselectedLabelColor: Colors.white.withOpacity(0.7),
                        indicatorColor: Colors.white,
                        tabs: [
                          Tab(
                            child: Text(
                              'My Products',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Orders',
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ]),
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      MyProductsView(),
                      ReceivedOrderView(),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
