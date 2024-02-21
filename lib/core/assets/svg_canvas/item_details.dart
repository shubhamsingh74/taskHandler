 
import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(19, 20), 
//     painter: ItemDetailsPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File
class ItemDetailsPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
            
Path path_0 = Path();
    path_0.moveTo(4.19234,8.615);
    path_0.lineTo(8.99999,0.730469);
    path_0.lineTo(13.8076,8.615);
    path_0.lineTo(4.19234,8.615);
    path_0.close();
    path_0.moveTo(14.4955,19.615);
    path_0.cubicTo(13.3511,19.615,12.3798,19.216,11.5817,18.4179);
    path_0.cubicTo(10.7837,17.6198,10.3846,16.6486,10.3846,15.5042);
    path_0.cubicTo(10.3846,14.3598,10.7837,13.387,11.5817,12.5859);
    path_0.cubicTo(12.3798,11.7848,13.3511,11.3843,14.4955,11.3843);
    path_0.cubicTo(15.6399,11.3843,16.6126,11.7848,17.4137,12.5859);
    path_0.cubicTo(18.2148,13.387,18.6153,14.3598,18.6153,15.5042);
    path_0.cubicTo(18.6153,16.6486,18.2148,17.6198,17.4137,18.4179);
    path_0.cubicTo(16.6126,19.216,15.6399,19.615,14.4955,19.615);
    path_0.close();
    path_0.moveTo(0.384644,19.115);
    path_0.lineTo(0.384644,11.8843);
    path_0.lineTo(7.61534,11.8843);
    path_0.lineTo(7.61534,19.115);
    path_0.lineTo(0.384644,19.115);
    path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xffF8F6FF).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}
