

 
//Add this CustomPaint widget to the Widget Tree
import 'package:flutter/material.dart';

// CustomPaint(
//     size: Size(17, 19), 
//     painter: RPSCustomPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File
class LotDetailsPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
            
Path path_0 = Path();
    path_0.moveTo(1.91684,18.6156);
    path_0.cubicTo(1.43659,18.6156,1.03009,18.4406,0.69735,18.0906);
    path_0.cubicTo(0.364591,17.7407,0.198212,17.3131,0.198212,16.808);
    path_0.lineTo(0.198212,12.9311);
    path_0.lineTo(2.70303,9.96956);
    path_0.lineTo(3.71956,11.0388);
    path_0.lineTo(1.72667,13.3849);
    path_0.lineTo(15.0517,13.3849);
    path_0.lineTo(13.088,11.0695);
    path_0.lineTo(14.1046,10.0003);
    path_0.lineTo(16.5801,12.9311);
    path_0.lineTo(16.5801,16.808);
    path_0.cubicTo(16.5801,17.3131,16.4137,17.7407,16.081,18.0906);
    path_0.cubicTo(15.7482,18.4406,15.3417,18.6156,14.8615,18.6156);
    path_0.lineTo(1.91684,18.6156);
    path_0.close();
    path_0.moveTo(7.19527,11.1599);
    path_0.lineTo(4.12914,7.88491);
    path_0.cubicTo(3.79517,7.53363,3.62971,7.1051,3.63276,6.59933);
    path_0.cubicTo(3.6358,6.09357,3.80431,5.66504,4.13829,5.31376);
    path_0.lineTo(8.55007,0.673409);
    path_0.cubicTo(8.88404,0.322125,9.28992,0.146484,9.76773,0.146484);
    path_0.cubicTo(10.2455,0.146484,10.6514,0.322125,10.9854,0.673409);
    path_0.lineTo(14.0899,3.90801);
    path_0.cubicTo(14.4239,4.25928,14.5933,4.68363,14.5982,5.18106);
    path_0.cubicTo(14.6031,5.67849,14.4385,6.10285,14.1045,6.45413);
    path_0.lineTo(9.61597,11.1753);
    path_0.cubicTo(9.28199,11.5265,8.87854,11.6996,8.40561,11.6945);
    path_0.cubicTo(7.93268,11.6894,7.52923,11.5112,7.19527,11.1599);
    path_0.close();
    path_0.moveTo(13.0788,5.39453);
    path_0.cubicTo(13.1276,5.34325,13.152,5.26953,13.152,5.17338);
    path_0.cubicTo(13.152,5.07722,13.1276,5.00349,13.0788,4.95221);
    path_0.lineTo(9.97801,1.72146);
    path_0.cubicTo(9.92925,1.67018,9.85916,1.64453,9.76773,1.64453);
    path_0.cubicTo(9.6763,1.64453,9.60621,1.67018,9.55745,1.72146);
    path_0.lineTo(5.11643,6.39258);
    path_0.cubicTo(5.06768,6.44387,5.0433,6.51759,5.0433,6.61376);
    path_0.cubicTo(5.0433,6.70993,5.06768,6.78365,5.11643,6.83493);
    path_0.lineTo(8.21729,10.0657);
    path_0.cubicTo(8.26605,10.117,8.33613,10.1426,8.42755,10.1426);
    path_0.cubicTo(8.51898,10.1426,8.58907,10.117,8.63783,10.0657);
    path_0.lineTo(13.0788,5.39453);
    path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xffFAF9FF).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}