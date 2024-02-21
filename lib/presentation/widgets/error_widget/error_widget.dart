import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/constants/constants.dart';
import 'package:quickprism/core/styles/app_styles.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget(
      {super.key,
      this.size,
      this.message,
      this.style,
      this.image,
      this.innerHeight = 0});

  final double? size;
  final String? message;
  final TextStyle? style;
  final String? image;
  final double innerHeight;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size ?? 1.sw / 2,
          width: size ?? 1.sw / 2,
          child: Center(child: Image.asset(image ?? errorImage)),
        ),
        innerHeight.verticalSpace,
        Text(
          message ?? 'No item found',
          style: style ?? AppStyles.subHeading16,
        ),
      ],
    );
  }
}
