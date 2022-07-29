import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_hay/app/modules/profile/controllers/profile_controller.dart';
import 'package:get_hay/app/modules/seller_dashboard/views/seller_dashboard_view.dart';
import 'package:get_hay/app/routes/app_pages.dart';
import '../../../../injector/injector.dart';
import '../../../../storage/sharedprefences/shared_preferences_manager.dart';
import '../../login/views/login_view.dart';

class DrawerView extends GetView<DrawerController> {
  final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.7,
      height: Get.height,
      decoration: BoxDecoration(
          color: Colors.red[400],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(60), bottomRight: Radius.circular(60))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Welcome !',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 0),
                                  spreadRadius: 2,
                                  blurRadius: 2)
                            ],
                            shape: BoxShape.circle,
                          ),
                        ),
                        ClipRRect(
                          child: ClipOval(
                              child: Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.black.withOpacity(0.5),
                          )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    profileController.profile == null
                        ? Text(
                            'User',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        : Text(
                            profileController.profile.userName,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Column(children: [
              ListTile(
                leading: Icon(
                  Icons.bookmark_border_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  "Enter Seller Mode",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Get.to(() => SellerDashboardView());
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
                title: Text("Cart",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                onTap: () {
                  Navigator.of(context).pop();
                  Get.toNamed(Routes.CART_PAGE);
                },
              ),
              // ListTile(
              //   leading: Icon(
              //     Icons.person_outline,
              //     color: Colors.white,
              //   ),
              //   title: Text("Stripe Payment",
              //       style: TextStyle(
              //           color: Colors.white,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 16)),
              //   onTap: () {
              //     Navigator.of(context).pop();
              //     Get.toNamed(Routes.STRIPE_PAYMENT);
              //   },
              // ),
              ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                title: Text("Log Out",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text('Are you sure, you want to logout?'),
                          actions: <Widget>[
                            FlatButton(
                                child: Text('Yes'),
                                onPressed: () {
                                  locator<SharedPreferencesManager>()
                                      .clearKey('accessToken');
                                  locator<SharedPreferencesManager>()
                                      .clearAll();
                                  Get.offAll(() => LoginView());
                                }),
                            FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Text('No'))
                          ],
                        );
                      });
                },
              ),
            ])
          ]),
    );
  }
}
