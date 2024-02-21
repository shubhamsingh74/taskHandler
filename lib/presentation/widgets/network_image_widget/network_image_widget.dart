import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/presentation/screens/business/my_lists/widgets/my_list_tile_widget.dart';
import 'package:shimmer/shimmer.dart';

class AppNetWorkImageWidget extends StatelessWidget {
  const AppNetWorkImageWidget(
      {super.key, required this.imageUrl, required this.rawSize});
  final String imageUrl;
  final double rawSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: rawSize.w,
      height: rawSize.w,
      clipBehavior: Clip.hardEdge,
      decoration: ShapeDecoration(
        color: AppColors.textColorT3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      ),
      child: TileImageWidget(
        url: imageUrl,
      ),
    );
  }
}

class TileImageWidget extends StatelessWidget {
  const TileImageWidget({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (_, a, b) =>
          b?.expectedTotalBytes == b?.cumulativeBytesLoaded
              ? a
              : Shimmer.fromColors(
                  baseColor: AppColors.shimmerGrey,
                  highlightColor: AppColors.white,
                  child: a,
                ),
      errorBuilder: (_, a, b) => Image.asset(
        AppAssets.imageError,
        fit: BoxFit.contain,
      ),
    );
  }
}
