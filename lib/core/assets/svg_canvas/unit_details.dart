// import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(19, 20),
//     painter: RPSCustomPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File
class UnitDetailsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(5.74997, 20);
    path_0.lineTo(4.25003, 18.875);
    path_0.lineTo(4.25003, 14.75);
    path_0.lineTo(2.74997, 14.75);
    path_0.cubicTo(2.32177, 14.75, 1.96473, 14.607, 1.67885, 14.3211);
    path_0.cubicTo(1.39297, 14.0352, 1.25003, 13.6782, 1.25003, 13.25);
    path_0.lineTo(1.25003, 5.24995);
    path_0.lineTo(1, 5.24995);
    path_0.cubicTo(0.7875, 5.24995, 0.609383, 5.17805, 0.46565, 5.03425);
    path_0.cubicTo(0.321883, 4.89043, 0.25, 4.71223, 0.25, 4.49965);
    path_0.cubicTo(0.25, 4.28705, 0.321867, 4.10896, 0.4656, 3.96538);
    path_0.cubicTo(0.60935, 3.82179, 0.787475, 3.75, 0.999975, 3.75);
    path_0.lineTo(4.25, 3.75);
    path_0.lineTo(4.25, 1.74995);
    path_0.lineTo(3.5, 1.74995);
    path_0.cubicTo(3.2875, 1.74995, 3.10938, 1.67805, 2.96565, 1.53425);
    path_0.cubicTo(2.8219, 1.39043, 2.75003, 1.21223, 2.75003, 0.999651);
    path_0.cubicTo(2.75003, 0.787051, 2.8219, 0.60896, 2.96565, 0.465376);
    path_0.cubicTo(3.10938, 0.321793, 3.2875, 0.25, 3.5, 0.25);
    path_0.lineTo(6.5, 0.25);
    path_0.cubicTo(6.7125, 0.25, 6.89062, 0.321901, 7.03435, 0.465701);
    path_0.cubicTo(7.1781, 0.609518, 7.24997, 0.787717, 7.24997, 1.0003);
    path_0.cubicTo(7.24997, 1.2129, 7.1781, 1.39099, 7.03435, 1.53457);
    path_0.cubicTo(6.89062, 1.67816, 6.7125, 1.74995, 6.5, 1.74995);
    path_0.lineTo(5.74997, 1.74995);
    path_0.lineTo(5.74997, 3.75);
    path_0.lineTo(9, 3.75);
    path_0.cubicTo(9.2125, 3.75, 9.39062, 3.8219, 9.53435, 3.9657);
    path_0.cubicTo(9.6781, 4.10952, 9.74998, 4.28772, 9.74998, 4.5003);
    path_0.cubicTo(9.74998, 4.7129, 9.6781, 4.89099, 9.53435, 5.03458);
    path_0.cubicTo(9.39062, 5.17816, 9.2125, 5.24995, 9, 5.24995);
    path_0.lineTo(8.74998, 5.24995);
    path_0.lineTo(8.74998, 13.25);
    path_0.cubicTo(8.74998, 13.6782, 8.60703, 14.0352, 8.32115, 14.3211);
    path_0.cubicTo(8.03527, 14.607, 7.67823, 14.75, 7.25003, 14.75);
    path_0.lineTo(5.74997, 14.75);
    path_0.lineTo(5.74997, 20);
    path_0.close();
    path_0.moveTo(2.74997, 13.25);
    path_0.lineTo(7.25003, 13.25);
    path_0.lineTo(7.25003, 11.3461);
    path_0.lineTo(5.25, 11.3461);
    path_0.cubicTo(5.09103, 11.3461, 4.95193, 11.2865, 4.8327, 11.1673);
    path_0.cubicTo(4.71347, 11.048, 4.65385, 10.9089, 4.65385, 10.75);
    path_0.cubicTo(4.65385, 10.591, 4.71347, 10.4519, 4.8327, 10.3327);
    path_0.cubicTo(4.95193, 10.2134, 5.09103, 10.1538, 5.25, 10.1538);
    path_0.lineTo(7.25003, 10.1538);
    path_0.lineTo(7.25003, 8.34613);
    path_0.lineTo(5.25, 8.34613);
    path_0.cubicTo(5.09103, 8.34613, 4.95193, 8.28651, 4.8327, 8.16728);
    path_0.cubicTo(4.71347, 8.04804, 4.65385, 7.90894, 4.65385, 7.74998);
    path_0.cubicTo(4.65385, 7.59101, 4.71347, 7.45191, 4.8327, 7.33268);
    path_0.cubicTo(4.95193, 7.21344, 5.09103, 7.15383, 5.25, 7.15383);
    path_0.lineTo(7.25003, 7.15383);
    path_0.lineTo(7.25003, 5.24995);
    path_0.lineTo(2.74997, 5.24995);
    path_0.lineTo(2.74997, 13.25);
    path_0.close();
    path_0.moveTo(12.75, 19.7499);
    path_0.cubicTo(12.3218, 19.7499, 11.9647, 19.607, 11.6789, 19.3211);
    path_0.cubicTo(11.393, 19.0352, 11.25, 18.6782, 11.25, 18.25);
    path_0.lineTo(11.25, 11.5);
    path_0.cubicTo(11.25, 11.0194, 11.343, 10.6217, 11.5289, 10.3069);
    path_0.cubicTo(11.7148, 9.99203, 11.8994, 9.72434, 12.0827, 9.50383);
    path_0.cubicTo(12.2596, 9.28973, 12.4151, 9.11024, 12.549, 8.96538);
    path_0.cubicTo(12.683, 8.82049, 12.75, 8.66536, 12.75, 8.49998);
    path_0.lineTo(12.75, 7.74995);
    path_0.lineTo(12.5, 7.74995);
    path_0.cubicTo(12.2875, 7.74995, 12.1094, 7.67805, 11.9656, 7.53425);
    path_0.cubicTo(11.8219, 7.39043, 11.75, 7.21223, 11.75, 6.99965);
    path_0.cubicTo(11.75, 6.78705, 11.8219, 6.60896, 11.9656, 6.46538);
    path_0.cubicTo(12.1094, 6.32179, 12.2875, 6.25, 12.5, 6.25);
    path_0.lineTo(17.5, 6.25);
    path_0.cubicTo(17.7125, 6.25, 17.8906, 6.3219, 18.0344, 6.4657);
    path_0.cubicTo(18.1781, 6.60952, 18.25, 6.78772, 18.25, 7.0003);
    path_0.cubicTo(18.25, 7.2129, 18.1781, 7.39099, 18.0344, 7.53458);
    path_0.cubicTo(17.8906, 7.67816, 17.7125, 7.74995, 17.5, 7.74995);
    path_0.lineTo(17.25, 7.74995);
    path_0.lineTo(17.25, 8.49998);
    path_0.cubicTo(17.25, 8.66536, 17.3221, 8.82818, 17.4663, 8.98845);
    path_0.cubicTo(17.6106, 9.1487, 17.7763, 9.33588, 17.9634, 9.54998);
    path_0.cubicTo(18.1468, 9.77049, 18.3237, 10.0375, 18.4942, 10.3509);
    path_0.cubicTo(18.6647, 10.6644, 18.75, 11.0462, 18.75, 11.4965);
    path_0.lineTo(18.75, 18.25);
    path_0.cubicTo(18.75, 18.6782, 18.607, 19.0352, 18.3211, 19.3211);
    path_0.cubicTo(18.0353, 19.607, 17.6782, 19.75, 17.25, 19.75);
    path_0.lineTo(12.75, 19.7499);
    path_0.close();
    path_0.moveTo(12.75, 12.1538);
    path_0.lineTo(17.25, 12.1538);
    path_0.lineTo(17.25, 11.5);
    path_0.cubicTo(17.25, 11.2115, 17.175, 10.966, 17.025, 10.7634);
    path_0.cubicTo(16.875, 10.5609, 16.7019, 10.348, 16.5058, 10.125);
    path_0.cubicTo(16.327, 9.92313, 16.1563, 9.69798, 15.9938, 9.44955);
    path_0.cubicTo(15.8313, 9.20112, 15.75, 8.88459, 15.75, 8.49998);
    path_0.lineTo(15.75, 7.74995);
    path_0.lineTo(14.25, 7.74995);
    path_0.lineTo(14.25, 8.49998);
    path_0.cubicTo(14.25, 8.87251, 14.1708, 9.18295, 14.0125, 9.4313);
    path_0.cubicTo(13.8541, 9.67965, 13.6865, 9.90574, 13.5096, 10.1096);
    path_0.cubicTo(13.3134, 10.3327, 13.1378, 10.5481, 12.9827, 10.7558);
    path_0.cubicTo(12.8275, 10.9634, 12.75, 11.2115, 12.75, 11.5);
    path_0.lineTo(12.75, 12.1538);
    path_0.close();
    path_0.moveTo(12.75, 18.25);
    path_0.lineTo(17.25, 18.25);
    path_0.lineTo(17.25, 16.3461);
    path_0.lineTo(12.75, 16.3461);
    path_0.lineTo(12.75, 18.25);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffF0EDF8).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
