import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/constants/constants.dart';
import 'package:quickprism/core/styles/app_styles.dart';

class AppEmptyWidget extends StatelessWidget {
  const AppEmptyWidget({super.key, this.size, this.message, this.style});

  final double? size;
  final String? message;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size ?? 1.sw / 2,
          width: size ?? 1.sw / 2,
          child: Center(child: Image.asset(emptyImage)),
        ),
        Text(
          message ?? 'No item found',
          style: style ?? AppStyles.subHeading16,
        ),
      ],
    );
  }
}
