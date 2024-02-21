import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColoredTabBar extends StatelessWidget implements PreferredSizeWidget {
  const ColoredTabBar(
      {super.key, required this.color, required this.tabBar, this.margin});

  final Color color;
  final TabBar tabBar;
  final EdgeInsetsGeometry? margin;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
        margin: margin,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(5.r)),
        child: tabBar,
      );
}
