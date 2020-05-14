import 'package:flutter/material.dart';

class LoginBackground extends CustomPainter{

  LoginBackground({@required this.isJoin});

  final bool isJoin;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()..color = isJoin?Colors.red:Colors.indigo;
    canvas.drawCircle(Offset(size.width*.5,size.height*.24), size.height*0.5, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}