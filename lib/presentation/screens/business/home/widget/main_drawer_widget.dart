import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainAppDrawerBusiness extends StatelessWidget {
  const MainAppDrawerBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw/1.5,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.r),
            bottomRight: Radius.circular(15.r),
          )
      ),
    );
  }
}
