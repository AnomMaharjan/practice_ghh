import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_hay/app/modules/home/controllers/home_controller.dart';
import 'package:get_hay/app/modules/orderPage/controllers/order_page_controller.dart';

class BottomNavBar extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final OrderPageController orderPageController = Get.put(
    OrderPageController(),
  );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 65,
      child: Stack(
        // ignore: deprecated_member_use
        // overflow: Overflow.visible,
        children: [
          CustomPaint(
            size: Size(size.width, 80),
            painter: BNBCustomPainter(),
          ),
          Center(
            heightFactor: 0.9,
            child: FloatingActionButton(
              backgroundColor: Colors.red[800],
              child: Icon(Icons.shopping_basket),
              elevation: 0.1,
              onPressed: () {
                // Get.toNamed(Routes.CART_PAGE);
              },
            ),
          ),
          Obx(
            /// [Observer] listens for state changes
            () => Container(
              width: size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    splashRadius: 5,
                    icon: Icon(
                      Icons.home,
                      color: homeController.currentIndex.value == 0
                          ? Colors.red
                          : Colors.grey.shade400,
                    ),
                    onPressed: () {
                      homeController.setBottomBarIndex(0, 'Home');
                      print("Press bhaira cha");
                      print(homeController.currentIndex.value);
                    },
                    splashColor: Colors.white,
                  ),
                  IconButton(
                    splashRadius: 3,
                    icon: Icon(
                      Icons.favorite,
                      color: homeController.currentIndex.value == 1
                          ? Colors.red
                          : Colors.grey.shade400,
                    ),
                    onPressed: () {
                      homeController.setBottomBarIndex(1, 'Wish List');
                      print(homeController.currentIndex.value);
                    },
                  ),
                  Container(
                    width: size.width * 0.20,
                  ),
                  IconButton(
                    splashRadius: 3,
                    icon: Icon(
                      Icons.bookmark,
                      color: homeController.currentIndex.value == 2
                          ? Colors.red
                          : Colors.grey.shade400,
                    ),
                    onPressed: () {
                      homeController.setBottomBarIndex(2, 'Order List');
                      print(homeController.currentIndex.value);
                    },
                  ),
                  IconButton(
                    splashRadius: 3,
                    icon: Icon(
                      Icons.person,
                      color: homeController.currentIndex.value == 3
                          ? Colors.red
                          : Colors.grey.shade400,
                    ),
                    onPressed: () {
                      homeController.setBottomBarIndex(3, 'Profile');
                      print(homeController.currentIndex.value);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 30);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
