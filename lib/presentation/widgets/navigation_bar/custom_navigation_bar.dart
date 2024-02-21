import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:shimmer/shimmer.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar(
      {super.key,
      required this.onTap,
      required this.currentIndex,
      this.isLoading = false});

  final void Function(int) onTap;
  final int currentIndex;

  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? loadingWidget
        : BottomNavigationBar(
            // useLegacyColorScheme: true,

            elevation: 10,
            backgroundColor: AppColors.white,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Image(
                    image: AssetImage(
                      AppAssets.iconsListTab,
                    ),
                    height: 25,
                    width: 29,
                    fit: BoxFit.fill,
                  ),
                ),
                label: 'My lists',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Image(
                    image: AssetImage(
                      AppAssets.iconsIconRupee,
                    ),
                    height: 25,
                    width: 30,
                    fit: BoxFit.fill,
                  ),
                ),
                label: 'Transactions',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Image(
                    image: AssetImage(
                      AppAssets.iconsIconDiscover,
                    ),
                    height: 26,
                    width: 33,
                    fit: BoxFit.fill,
                  ),
                ),
                label: 'Discover',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Image(
                    image: AssetImage(
                      AppAssets.iconsIconGroup,
                    ),
                    height: 28,
                    width: 27,
                    fit: BoxFit.fill,
                  ),
                ),
                label: 'Parties',
              ),
            ],
            currentIndex: currentIndex,
            selectedItemColor: const Color(0xff454343),
            unselectedItemColor: const Color(0xff454343),
            // unselectedItemColor: AppColors.unselectedItemColor,
            selectedLabelStyle: AppStyles.navigationStyleSelected.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: const Color(0xff454343)),
            unselectedLabelStyle: AppStyles.navigationStyleUnSelected.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: const Color(0xff454343)),
            onTap: onTap,
          );
  }

  Widget get loadingWidget => SizedBox(
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            4,
            (index) => Shimmer.fromColors(
                baseColor: AppColors.shimmerGrey,
                highlightColor: AppColors.white,
                child: const CircleAvatar()),
          ),
        ),
      );
}
