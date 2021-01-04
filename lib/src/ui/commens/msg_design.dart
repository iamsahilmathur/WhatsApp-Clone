import 'package:flutter/material.dart';

class MsgDesign extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = new Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = 30;

    Path path = Path();

    path.lineTo(size.width * .02, size.height * .14);
    path.lineTo(size.width * .024, size.height * .7);

    var secondControlPoint = Offset(size.width * .03, size.height * .85);
    var secondEndPoint = Offset(size.width * .06, size.height * .9 );
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);


  //  path.quadraticBezierTo(secondControlPoint2.dx, secondControlPoint2.dy, secondEndPoint2.dx, secondEndPoint2.dy);

    path.lineTo(size.width , size.height * .9);


    path.lineTo(size.width, size.height * 0);


    /*var secondControlPoint = Offset(size.width * .2, size.height * .3);
        var secondEndPoint = Offset(size.width, size.height * .41 );
        path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

        var secondControlPoint2 = Offset(size.width * .87, size.height * .24);
        var secondEndPoint2 = Offset(size.width, size.height * .42 );
        path.quadraticBezierTo(secondControlPoint2.dx, secondControlPoint2.dy, secondEndPoint2.dx, secondEndPoint2.dy);*/

    /*var secondControlPoint3 = Offset(size.width , size.height * .3);
    var secondEndPoint3 = Offset(size.width, size.height * .48 );
    path.quadraticBezierTo(secondControlPoint3.dx, secondControlPoint3.dy, secondEndPoint3.dx, secondEndPoint3.dy);*/


    path.close();

    canvas.drawPath(path,paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }


}