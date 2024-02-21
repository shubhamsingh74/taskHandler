// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/app_styles.dart';

class BackIconAndTitle extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;
  const BackIconAndTitle({
    Key? key,
    required this.title,
    this.padding,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    context.router.pop();
                  },
                  child: Icon(Icons.arrow_back)),
              10.horizontalSpace,
              Text(title,
                  style: AppStyles.inter50016.copyWith(
                    fontSize: 18.sp,
                  )),
            ],
          ),
          trailing ?? SizedBox(),
        ],
      ),
    );
  }
}
