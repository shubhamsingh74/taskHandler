import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenBusinessDashBoard extends StatefulWidget {
  const ScreenBusinessDashBoard({super.key});

  @override
  State<ScreenBusinessDashBoard> createState() =>
      _ScreenBusinessDashBoardState();
}

class _ScreenBusinessDashBoardState extends State<ScreenBusinessDashBoard> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text('DashBoard'),
      //   backgroundColor: AppColors.primaryP3,
      //   foregroundColor: AppColors.textColorT4,
      // ),

      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }

  Widget get placeHolder => Container(
        height: 100.h,
        width: 1.sw,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
      );
  Widget get placeHolder2 => Container(
        height: 100.h,
        width: 1.sw / 2.5,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
      );
}
