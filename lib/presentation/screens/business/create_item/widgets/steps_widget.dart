import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets/svg_canvas/item_details.dart';
import '../../../../../core/assets/svg_canvas/lot_details.dart';
import '../../../../../core/assets/svg_canvas/unit_details.dart';
import '../../../../../core/styles/app_styles.dart';

class CreateItemStepOne extends StatelessWidget {
  const CreateItemStepOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          elevation: 10,
          shadowColor: Colors.blue.withOpacity(0.5),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(80.r),
              topLeft: Radius.circular(80.r),
              bottomRight: Radius.circular(40.r),
              topRight: Radius.circular(40.r)),
          child: Container(
            height: 50.h,
            width: 200.w,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff125D99),
                    Color(0xff1273C1),
                  ],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80.r),
                    topLeft: Radius.circular(80.r),
                    bottomRight: Radius.circular(40.r),
                    topRight: Radius.circular(40.r))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomPaint(
                  size: Size(25.w, 25.w),
                  painter: ItemDetailsPainter(),
                ),
                Text(
                  "Item Details",
                  style: AppStyles.inter60016FFFFFF,
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          height: 3.h,
          width: 18.w,
          decoration: BoxDecoration(
              color: const Color(0xff1790F1),
              borderRadius: BorderRadius.circular(5.r)),
        ),
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(100.r),
          shadowColor: Colors.blue.shade200,
          child: const CircleAvatar(
            backgroundColor: Color(0xff1790F1),
            child: Text("2", style: TextStyle(color: Colors.white)),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          height: 3.h,
          width: 18.w,
          decoration: BoxDecoration(
              color: const Color(0xff1790F1),
              borderRadius: BorderRadius.circular(5.r)),
        ),
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(100.r),
          shadowColor: Colors.blue.shade200,
          child: const CircleAvatar(
            backgroundColor: Color(0xff1790F1),
            child: Text("3", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}

// step two
class CreateItemStepTwo extends StatelessWidget {
  const CreateItemStepTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(100.r),
          shadowColor: Colors.blue.shade200,
          child: const CircleAvatar(
            backgroundColor: Color(0xff1790F1),
            child: Text("1", style: TextStyle(color: Colors.white)),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          height: 3.h,
          width: 18.w,
          decoration: BoxDecoration(
              color: const Color(0xff1790F1),
              borderRadius: BorderRadius.circular(5.r)),
        ),
        Material(
          elevation: 7,
          shadowColor: Colors.blue.shade500,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(80.r),
              topLeft: Radius.circular(80.r),
              bottomRight: Radius.circular(40.r),
              topRight: Radius.circular(40.r)),
          child: Container(
            height: 50.h,
            width: 200.w,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xff1273C1), Color(0xff125D99)],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80.r),
                    topLeft: Radius.circular(80.r),
                    bottomRight: Radius.circular(40.r),
                    topRight: Radius.circular(40.r))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomPaint(
                  size: Size(25.w, 25.w),
                  painter: UnitDetailsPainter(),
                ),
                Text(
                  " Unit Details",
                  style: AppStyles.inter60016FFFFFF,
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          height: 3.h,
          width: 18.w,
          decoration: BoxDecoration(
              color: const Color(0xff1790F1),
              borderRadius: BorderRadius.circular(5.r)),
        ),
        Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(100.r),
          shadowColor: Colors.blue.shade300,
          child: const CircleAvatar(
            backgroundColor: Color(0xff1790F1),
            child: Text("3", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}

// step three
class CreateItemStepThree extends StatelessWidget {
  const CreateItemStepThree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          elevation: 10,
          shadowColor: Colors.blue.shade200,
          borderRadius: BorderRadius.circular(100.r),
          child: const CircleAvatar(
            backgroundColor: Color(0xff1790F1),
            child: Text("1", style: TextStyle(color: Colors.white)),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          height: 3.h,
          width: 18.w,
          decoration: BoxDecoration(
              color: const Color(0xff1790F1),
              borderRadius: BorderRadius.circular(5.r)),
        ),
        Material(
          elevation: 10,
          shadowColor: Colors.blue.shade200,
          borderRadius: BorderRadius.circular(100.r),
          child: const CircleAvatar(
            backgroundColor: Color(0xff1790F1),
            child: Text("2", style: TextStyle(color: Colors.white)),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          height: 3.h,
          width: 18.w,
          decoration: BoxDecoration(
              color: const Color(0xff1790F1),
              borderRadius: BorderRadius.circular(5.r)),
        ),
        Material(
          elevation: 10,
          shadowColor: Colors.blue.shade200,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(80.r),
              topLeft: Radius.circular(80.r),
              bottomRight: Radius.circular(40.r),
              topRight: Radius.circular(40.r)),
          child: Container(
            height: 50.h,
            width: 200.w,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff1273C1), Color(0xff125D99)],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80.r),
                    topLeft: Radius.circular(80.r),
                    bottomRight: Radius.circular(40.r),
                    topRight: Radius.circular(40.r))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomPaint(
                  size: Size(25.w, 25.w),
                  painter: LotDetailsPainter(),
                ),
                Text(
                  " Lot Details",
                  style: AppStyles.inter60016FFFFFF,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
