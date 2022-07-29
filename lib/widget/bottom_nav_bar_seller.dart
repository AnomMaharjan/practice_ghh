import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_hay/app/modules/seller_dashboard/controllers/seller_dashboard_controller.dart';
import 'package:get_hay/app/routes/app_pages.dart';

class BottomNavBarV2 extends StatelessWidget {
  final SellerDashboardController con = Get.put(SellerDashboardController());
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
            painter: BNBCustomPainterSeller(),
          ),
          Center(
            heightFactor: 0.9,
            child: FloatingActionButton(
                backgroundColor: Colors.red[800],
                child: Icon(Icons.add),
                elevation: 0.1,
                onPressed: () {
                  Get.toNamed(Routes.ADD_PRODUCT_SELLER);
                }),
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
                    icon: Icon(
                      Icons.home,
                      color: con.currentIndex.value == 0
                          ? Colors.red
                          : Colors.grey.shade400,
                    ),
                    onPressed: () {
                      print("Press bhaira cha");
                      con.setBottomBarIndex(0);
                      print(con.currentIndex);
                    },
                    splashColor: Colors.white,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.house_siding,
                        color: con.currentIndex.value == 1
                            ? Colors.red[800]
                            : Colors.grey.shade400,
                      ),
                      onPressed: () {
                        con.setBottomBarIndex(1);
                        print(con.currentIndex);
                      }),
                  Container(
                    width: size.width * 0.20,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.favorite_outline,
                        color: con.currentIndex.value == 2
                            ? Colors.red[800]
                            : Colors.grey.shade400,
                      ),
                      onPressed: () {
                        con.setBottomBarIndex(2);

                        print(con.currentIndex);
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.person,
                        color: con.currentIndex.value == 3
                            ? Colors.red[800]
                            : Colors.grey.shade400,
                      ),
                      onPressed: () {
                        con.setBottomBarIndex(3);
                        print(con.currentIndex);
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainterSeller extends CustomPainter {
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
