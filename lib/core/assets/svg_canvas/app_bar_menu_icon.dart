

// import 'dart:ui' as ui;

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
import 'package:flutter/material.dart';

class AppBarMenuIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(1.15989, 6.53108);
    path_0.cubicTo(0.607796, 6.54557, 0.171631, 7.00489, 0.185691, 7.55699);
    path_0.cubicTo(0.199751, 8.1091, 0.658708, 8.54492, 1.2108, 8.53043);
    path_0.lineTo(17.2053, 8.11063);
    path_0.cubicTo(17.7574, 8.09614, 18.1936, 7.63682, 18.1795, 7.08471);
    path_0.cubicTo(18.1654, 6.53261, 17.7065, 6.09679, 17.1544, 6.11128);
    path_0.lineTo(1.15989, 6.53108);
    path_0.close();
    path_0.moveTo(0.340754, 13.6464);
    path_0.cubicTo(0.326695, 13.0943, 0.762859, 12.635, 1.31495, 12.6205);
    path_0.lineTo(13.3108, 12.3057);
    path_0.cubicTo(13.8629, 12.2912, 14.3219, 12.727, 14.3359, 13.2791);
    path_0.cubicTo(14.35, 13.8312, 13.9138, 14.2905, 13.3617, 14.305);
    path_0.lineTo(1.36587, 14.6199);
    path_0.cubicTo(0.813771, 14.6344, 0.354814, 14.1985, 0.340754, 13.6464);
    path_0.close();
    path_0.moveTo(0.0306279, 1.46755);
    path_0.cubicTo(0.0165683, 0.915445, 0.452733, 0.456128, 1.00483, 0.441637);
    path_0.lineTo(7.00276, 0.284211);
    path_0.cubicTo(7.55486, 0.269721, 8.01381, 0.705544, 8.02787, 1.25765);
    path_0.cubicTo(8.04193, 1.80976, 7.60577, 2.26907, 7.05367, 2.28356);
    path_0.lineTo(1.05574, 2.44099);
    path_0.cubicTo(0.503644, 2.45548, 0.0446875, 2.01966, 0.0306279, 1.46755);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffFEFEFE).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
