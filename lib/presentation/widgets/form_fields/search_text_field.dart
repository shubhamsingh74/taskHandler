import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';

class MainSearchTextField extends StatelessWidget {
  const MainSearchTextField(
      {super.key,
      this.controller,
      this.onSuffixTap,
      this.onChanged,
        this.margin,
      this.hintText, this.borderRadiusGeometry});

  final TextEditingController? controller;

  final Function()? onSuffixTap;

  final Function(String)? onChanged;

  final String? hintText;
  final EdgeInsetsGeometry? margin;
final BorderRadiusGeometry ? borderRadiusGeometry;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 16.w),
     // margin: margin?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius:  borderRadiusGeometry ?? BorderRadius.circular(15.r),
          border: Border.all(color: const Color(0xffA8E5FF),width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.search),
          10.horizontalSpace,
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                controller: controller,
                // cursorHeight: 15.h,
                style: AppStyles.subHeading14.copyWith(color: AppColors.textColorT1),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                  // fillColor: Colors.amber,
                  // filled: true,
                  hintText: hintText,
                  hintStyle: AppStyles.subHeading12.copyWith(fontWeight: FontWeight.w500,fontSize: 14,color: const Color(0xff5C6162)),
                  suffix: InkWell(
                    onTap: onSuffixTap,
                    child: Icon(
                      Icons.close,
                      size: 18.h,
                    ),
                  ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                  )),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                  )),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                  )),
                ),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CreateItemSearchTextField extends StatelessWidget {
  const CreateItemSearchTextField(
      {super.key,
        this.controller,
        this.onSuffixTap,
        this.onChanged,
        this.margin,
        this.hintText, this.borderRadiusGeometry});

  final TextEditingController? controller;

  final Function()? onSuffixTap;

  final Function(String)? onChanged;

  final String? hintText;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry ? borderRadiusGeometry;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Material(
        elevation: 10,
        borderRadius:  borderRadiusGeometry ?? BorderRadius.circular(10.r),
        shadowColor: Colors.blue.shade200,
        child: Container(
          padding:EdgeInsets.symmetric(horizontal: 16.w),
          // margin: margin?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
          height: 50.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:  borderRadiusGeometry ?? BorderRadius.circular(10.r),
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.search),
              10.horizontalSpace,
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: controller,
                    // cursorHeight: 15.h,
                    style: AppStyles.subHeading14.copyWith(color: AppColors.textColorT1),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                      // fillColor: Colors.amber,
                      // filled: true,
                      hintText: hintText,
                      hintStyle: AppStyles.subHeading12.copyWith(fontWeight: FontWeight.w500,fontSize: 14,color: const Color(0xff5C6162)),
                      suffix: InkWell(
                        onTap: onSuffixTap,
                        child: Icon(
                          Icons.close,
                          size: 18.h,
                        ),
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          )),
                    ),
                    onChanged: onChanged,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MainSearchTextFieldStaffManagement extends StatelessWidget {
  const MainSearchTextFieldStaffManagement(
      {super.key,
        this.controller,
        this.onSuffixTap,
        this.onChanged,
        this.margin,
        this.hintText, this.borderRadiusGeometry});

  final TextEditingController? controller;

  final Function()? onSuffixTap;

  final Function(String)? onChanged;

  final String? hintText;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry ? borderRadiusGeometry;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 16.w),
      // margin: margin?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
      height: 50.h,
      width: 0.78.sw,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:  borderRadiusGeometry ?? BorderRadius.circular(74.r),
          // border: Border.all(color: const Color(0xffA8E5FF),width: 2)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.search),
          10.horizontalSpace,
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                controller: controller,
                // cursorHeight: 15.h,
                style: AppStyles.subHeading14.copyWith(color: AppColors.textColorT1),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                  // fillColor: Colors.amber,
                  // filled: true,
                  hintText: hintText,
                  hintStyle: AppStyles.subHeading12.copyWith(fontWeight: FontWeight.w500,fontSize: 14,color: const Color(0xff5C6162)),
                  suffix: InkWell(
                    onTap: onSuffixTap,
                    child: Icon(
                      Icons.close,
                      size: 18.h,
                    ),
                  ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      )),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      )),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      )),
                ),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class MainSearchTextFieldStaffManagementDashBord extends StatelessWidget {
  const MainSearchTextFieldStaffManagementDashBord(
      {super.key,
        this.controller,
        this.onSuffixTap,
        this.onChanged,
        this.margin,
        this.hintText, this.borderRadiusGeometry});

  final TextEditingController? controller;

  final Function()? onSuffixTap;

  final Function(String)? onChanged;

  final String? hintText;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry ? borderRadiusGeometry;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 16.w),
      // margin: margin?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:  borderRadiusGeometry ?? BorderRadius.circular(70.r),
        // border: Border.all(color: const Color(0xffA8E5FF),width: 2)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.search),
          10.horizontalSpace,
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                controller: controller,
                // cursorHeight: 15.h,
                style: AppStyles.subHeading14.copyWith(color: AppColors.textColorT1),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                  // fillColor: Colors.amber,
                  // filled: true,
                  hintText: hintText,
                  hintStyle: AppStyles.subHeading12.copyWith(fontWeight: FontWeight.w500,fontSize: 14,color: const Color(0xff5C6162)),
                  suffix: InkWell(
                    onTap: onSuffixTap,
                    child: Icon(
                      Icons.close,
                      size: 18.h,
                    ),
                  ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      )),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      )),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      )),
                ),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}