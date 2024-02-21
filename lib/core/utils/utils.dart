import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();

class Utils {
  static successToast(BuildContext context, String msg) => CherryToast.success(
      disableToastAnimation: true,
      animationCurve: Curves.ease,
      width: 1.sw - 32.w,
      animationType: AnimationType.fromTop,
      animationDuration: const Duration(milliseconds: 800),
      title: Text(msg,
          style: GoogleFonts.inter(
            color: Colors.black,
          ))).show(context);

  static errorToast(BuildContext context, String msg,
          {int? durationMilliSeconds}) =>
      CherryToast.error(
          disableToastAnimation: true,
          animationCurve: Curves.ease,
          width: 1.sw - 32.w,
          animationType: AnimationType.fromTop,
          animationDuration: const Duration(milliseconds: 800),
          toastDuration: Duration(milliseconds: durationMilliSeconds ?? 3000),
          title: Text(msg,
              style: GoogleFonts.inter(
                color: Colors.black,
              ))).show(context);
}
