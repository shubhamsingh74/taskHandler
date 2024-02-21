import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';
import 'package:quickprism/core/utils/extensions.dart';

import '../../../domain/user/models/user_model.dart';
import '../../../domain/user/user_constants.dart';
 
class CustomShopDropdown extends StatelessWidget {
 final List<BusinessManagement> list;
   final void Function(BusinessManagement?)? onChanged;

  const CustomShopDropdown({
    Key? key,
    required this.list,
    required this.onChanged,
  }) : super(key: key);

// var ds = UserConstants.currentShop;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff165375), width: 1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<BusinessManagement>(
            isDense: true,
            isExpanded: false,
            // value: UserConstants.currentShop,
            hint: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.store_mall_directory_outlined,
                  color: "#${ UserConstants.currentShop?.shopColour}".toColor(),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 60.w,
                  child: Marquee(
                    text: UserConstants.currentShop?.shopName ?? "",
                    // text: "defaultShop?.shopName" ?? "",
                    scrollAxis: Axis.horizontal, //scroll direction
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 50.0,
                    velocity: 10.0, //speed
                    pauseAfterRound: const Duration(seconds: 10),
                    // startPadding: 10.0,
                    accelerationDuration: const Duration(seconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: const Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeOut,
                  ),
                ),
              ],
            ),
            items: list.map((shop) {
              String val = "#${shop.shopColour}";
              // int val = int.parse(shop.shopColour!, radix: 16);
              return DropdownMenuItem<BusinessManagement>(
                value: shop,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.store, color: val.toColor()),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                       width: 60.w,
                      child: Marquee(
                        text: shop.shopName ?? "N/A",
                        scrollAxis: Axis.horizontal, //scroll direction
                        crossAxisAlignment: CrossAxisAlignment.start,
                        blankSpace: 50.0,
                        velocity: 10.0, //speed
                        pauseAfterRound: const Duration(seconds: 10),
                        // startPadding: 10.0,
                        accelerationDuration: const Duration(seconds: 1),
                        accelerationCurve: Curves.linear,
                        decelerationDuration: const Duration(milliseconds: 500),
                        decelerationCurve: Curves.easeOut,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),

            
            onChanged: onChanged
            
            ),
      ),
    );
  }
}
