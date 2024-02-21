

//Add this CustomPaint widget to the Widget Tree
import 'package:flutter/material.dart';

// CustomPaint(
// size: Size(46, 40),
// painter: RPSCustomPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File
class BarCodeCanvasPainter extends CustomPainter {
@override
void paint(Canvas canvas, Size size) {

Path path_0 = Path();
path_0.moveTo(0.0830078,39.5729);
path_0.lineTo(0.0830078,28.7222);
path_0.lineTo(4.24967,28.7222);
path_0.lineTo(4.24967,35.2326);
path_0.lineTo(10.4997,35.2326);
path_0.lineTo(10.4997,39.5729);
path_0.lineTo(0.0830078,39.5729);
path_0.close();
path_0.moveTo(35.4997,39.5729);
path_0.lineTo(35.4997,35.2326);
path_0.lineTo(41.7497,35.2326);
path_0.lineTo(41.7497,28.7222);
path_0.lineTo(45.9163,28.7222);
path_0.lineTo(45.9163,39.5729);
path_0.lineTo(35.4997,39.5729);
path_0.close();
path_0.moveTo(6.33301,33.0625);
path_0.lineTo(6.33301,7.02079);
path_0.lineTo(10.4997,7.02079);
path_0.lineTo(10.4997,33.0625);
path_0.lineTo(6.33301,33.0625);
path_0.close();
path_0.moveTo(12.583,33.0625);
path_0.lineTo(12.583,7.02079);
path_0.lineTo(14.6663,7.02079);
path_0.lineTo(14.6663,33.0625);
path_0.lineTo(12.583,33.0625);
path_0.close();
path_0.moveTo(18.833,33.0625);
path_0.lineTo(18.833,7.02079);
path_0.lineTo(22.9997,7.02079);
path_0.lineTo(22.9997,33.0625);
path_0.lineTo(18.833,33.0625);
path_0.close();
path_0.moveTo(25.083,33.0625);
path_0.lineTo(25.083,7.02079);
path_0.lineTo(31.333,7.02079);
path_0.lineTo(31.333,33.0625);
path_0.lineTo(25.083,33.0625);
path_0.close();
path_0.moveTo(33.4163,33.0625);
path_0.lineTo(33.4163,7.02079);
path_0.lineTo(35.4997,7.02079);
path_0.lineTo(35.4997,33.0625);
path_0.lineTo(33.4163,33.0625);
path_0.close();
path_0.moveTo(37.583,33.0625);
path_0.lineTo(37.583,7.02079);
path_0.lineTo(39.6663,7.02079);
path_0.lineTo(39.6663,33.0625);
path_0.lineTo(37.583,33.0625);
path_0.close();
path_0.moveTo(0.0830078,11.3611);
path_0.lineTo(0.0830078,0.510376);
path_0.lineTo(10.4997,0.510376);
path_0.lineTo(10.4997,4.85065);
path_0.lineTo(4.24967,4.85065);
path_0.lineTo(4.24967,11.3611);
path_0.lineTo(0.0830078,11.3611);
path_0.close();
path_0.moveTo(41.7497,11.3611);
path_0.lineTo(41.7497,4.85065);
path_0.lineTo(35.4997,4.85065);
path_0.lineTo(35.4997,0.510376);
path_0.lineTo(45.9163,0.510376);
path_0.lineTo(45.9163,11.3611);
path_0.lineTo(41.7497,11.3611);
path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xff0091F7).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}