import 'package:flutter/cupertino.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);
    var firstEndPoint = new Offset(size.width/2, size.height-45);
    var firstControlPoint = new Offset(20.0, size.height-45);


    path.quadraticBezierTo(firstControlPoint.dx , firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    var secondEndPoint = new Offset(size.width, size.height-70);
    var secondControlPoint = new Offset(size.width-20, size.height-45);

    path.quadraticBezierTo(secondControlPoint.dx , secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    
    path.lineTo(size.width, size.height -65);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
