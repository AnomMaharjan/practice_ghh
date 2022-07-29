import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_hay/app/modules/CartPage/controllers/cart_page_controller.dart';
import 'package:get_hay/app/routes/app_pages.dart';

Widget deleteIcon(value, int id, int index) {
  final CartPageController cartPageController = Get.put(CartPageController());

  return IconButton(
      splashRadius: 1,
      constraints: BoxConstraints(),
      padding: EdgeInsets.only(left: 130),
      icon: Icon(
        Icons.delete,
        size: 20,
        color: Colors.red[400],
      ),
      onPressed: () {
        print(value);
        cartPageController.deleteCartList(id, index);
      });
}

Widget shopIcon(value) {
  return IconButton(
      splashRadius: 2,
      constraints: BoxConstraints(),
      padding: EdgeInsets.only(left: 20, bottom: 0),
      icon: Icon(
        Icons.shop,
        size: 20,
        color: Colors.red,
      ),
      onPressed: () {
        print(value);
      });
}

Widget imageContainer(value, argumentvalue) {
  return Stack(
    alignment: Alignment.center,
    children: [
      InkWell(
        onTap: () {
          value = {"from": 0, "data": argumentvalue};
          Get.toNamed(Routes.PRODUCT_DETAILS, arguments: value);
        },
        child: SizedBox(
          width: 70,
          height: 74,
          child: ClipRRect(
            child: ClipOval(
              child: value == null
                  ? Image.asset(
                      "assest/a.png",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      value,
                      height: 72,
                      width: 72,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget imageContainerRec(value, argumentvalue) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        height: 160.0,
        width: 120.0,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
      InkWell(
        onTap: () {
          value = {"from": 1, "data": argumentvalue};
          Get.toNamed(
            Routes.PRODUCT_DETAILS,
            arguments: value,
          );
        },
        child: Image.network(
          value,
          height: 130,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    ],
  );
}
