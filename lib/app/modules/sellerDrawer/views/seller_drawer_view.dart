import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_hay/app/modules/CreateCategory/views/create_category_view.dart';
import 'package:get_hay/app/modules/CreateSpecies/views/create_species_view.dart';
import 'package:get_hay/app/modules/home/views/home_view.dart';
import 'package:get_hay/app/modules/my_productions_cut/views/my_production_cut_create_view.dart';
import 'package:get_hay/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/seller_drawer_controller.dart';

class SellerDrawerView extends GetView<SellerDrawerController> {
  final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.7,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(60), bottomRight: Radius.circular(60))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 36),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'In Seller Mode',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
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
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 0),
                                    spreadRadius: 2,
                                    blurRadius: 2)
                              ],
                              color: Colors.white,
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )
                          : Text(
                              profileController.profile.userName,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ListTile(
                leading: Icon(
                  Icons.bookmark_border_outlined,
                  size: 20,
                  color: Colors.white,
                ),
                title: Text(
                  'Enter Buyer Mode',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Get.offAll(() => HomeView());
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.category,
                  size: 20,
                  color: Colors.white,
                ),
                title: Text(
                  ' Category',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Get.to(() => CreateCategoryView());
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.category,
                  size: 20,
                  color: Colors.white,
                ),
                title: Text(
                  ' Species',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Get.to(() => CreateSpeciesView());
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.category,
                  size: 20,
                  color: Colors.white,
                ),
                title: Text(
                  ' My Production Cut',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Get.to(() => MyProductionCutCreateView());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget sellerDrawerListText(value, argument, context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        Get.to(() => argument);
      },
      child: SizedBox(
        height: 30,
        child: Text(
          value,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

Widget sellerDrawerListIcon(value) {
  return InkWell(
    child: Icon(
      value,
      color: Colors.white,
      size: 24,
    ),
  );
}
