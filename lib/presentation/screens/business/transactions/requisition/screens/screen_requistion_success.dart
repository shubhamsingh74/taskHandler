import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/presentation/screens/business/transactions/requisition/screens/screen_create_requisition_select_items.dart';
import 'package:quickprism/presentation/screens/business/transactions/requisition/widgets/custom_common_item_widget.dart';
import 'package:quickprism/presentation/screens/business/transactions/screen_create_purchase.dart';

import '../../../../../widgets/appbar/main_app_bar_business.dart';

///---------requisition success screen
class ScreenRequisitionSuccess extends StatefulWidget {
  final List<Map<String, dynamic>> itemsLists;
  final List<Map<String, dynamic>> vendorsList;
  final String date;
  final String buyersSignature;
  final String shippingAddress;
  final String billingAddress;

  const ScreenRequisitionSuccess(
      {super.key,
      required this.itemsLists,
      required this.vendorsList,
      required this.buyersSignature,
      required this.shippingAddress,
      required this.billingAddress, required this.date
      });

  @override
  State<ScreenRequisitionSuccess> createState() =>
      _ScreenRequisitionSuccessState();
}

class _ScreenRequisitionSuccessState extends State<ScreenRequisitionSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBarBusiness(
        isLoading: false,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w).copyWith(bottom: 20.h),
        child: SizedBox(
          height: 58.h,
          child: customRowPrimaryButton(
            onTap1: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ScreenCreateRequisitionSelectItems(),));
            },
            title1: 'Send Another',
            onTap2: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenCreatePurchase(),));
            },
            title2: 'Purchases',
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            AppAssets.iconsRequisitionBackSuccessNew,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                190.h.verticalSpace,
                // Center(
                //   child: Image.asset(
                //     AppAssets.iconsGreyPlane,
                //     height: 242.h,
                //     width: 247.w,
                //     fit: BoxFit.fill,
                //   ),
                // ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(top: 20.h),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            25.h.verticalSpace,
                            Text(
                              "Requisition Sent Successfully!",
                              style: AppStyles.inter70025125D99
                                  .copyWith(fontSize: 22.sp),
                            ),
                            2.h.verticalSpace,
                            Padding(
                              padding: EdgeInsets.only(left: 15.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Requisition no. 010101 ",
                                    style: AppStyles.inter600182D2F2F,
                                  ),
                                  5.h.verticalSpace,
                                  Text(
                                    "Date : ${widget.date} ",
                                    style: AppStyles.inter50016666060,
                                  ),
                                ],
                              ),
                            ),
                            20.h.verticalSpace,
                            Padding(
                              padding: EdgeInsets.only(top: 0.h),
                              child: ListView.builder(
                                itemCount: widget.itemsLists.length,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                primary: false,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5.h),
                                    child: customCommonItemWidget(
                                        name: widget.itemsLists[index]["itemName"],
                                        category: widget.itemsLists[index]
                                        ["itemCategory"],
                                        brand: widget.itemsLists[index]["itemBrand"],
                                        unit: widget.itemsLists[index]["itemUnit"],
                                        quantity: widget.itemsLists[index]
                                        ["itemQuantity"]
                                            .toString()),
                                  );
                                },
                              ),
                            ),
                            20.h.verticalSpace,
                            Text(
                              "Vendors",
                              style: AppStyles.inter60016242323,
                            ),
                            10.h.verticalSpace,
                            GridView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: widget.vendorsList.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 40.h,
                                  mainAxisSpacing: 20.h,
                                  crossAxisSpacing: 30.h,
                                  crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return customVendorsContainerWidget(
                                  title: widget.vendorsList[index]["vendorsName"],
                                );
                              },
                            ),
                            20.h.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Buyer’s Signatory",
                                  style: AppStyles.inter500153D3A3A,
                                ),
                                Text(
                                 widget.buyersSignature,
                                  style: AppStyles.inter500153D3A3A,
                                ),
                              ],
                            ),
                            20.h.verticalSpace,
                            Text(
                              "Billing Address",
                              style: AppStyles.inter50015474545,
                            ),
                            Text(
                              widget.billingAddress,
                              style: AppStyles.inter50015474545,
                            ),
                            20.h.verticalSpace,
                            Text(
                              "Shipping Address",
                              style: AppStyles.inter50015474545,
                            ),
                            Text(
                              widget.shippingAddress,
                              style: AppStyles.inter50015474545,
                            ),
                            50.h.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      child: InkWell(
                        splashFactory: NoSplash.splashFactory,
                        onTap: () {},
                        child: Material(
                          elevation: 10,
                          shadowColor: Colors.blue.shade400,
                          borderRadius: BorderRadius.circular(8.r),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 7.h, horizontal: 25.w),
                            decoration: BoxDecoration(
                              color: const Color(0xffDDEFFE),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppAssets.iconsFileSave,
                                  height: 19.h,
                                  width: 19.w,
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  "Download PDF",
                                  style: AppStyles.inter60015242323.copyWith(
                                      fontSize: 14.sp,
                                      color: const Color(0xff0E4572)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///-------custom vendor widget
  customVendorsContainerWidget({required String title}) {
    return Material(
      elevation: 10,
      shadowColor: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(25.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.r),
            border: Border.all(color: Colors.grey, width: 1)),
        child: Text(
          title,
          style: AppStyles.inter40011585555,
        ),
      ),
    );
  }


  ///--------common row button for this screen
  customRowPrimaryButton(
      {required VoidCallback onTap1,
      required VoidCallback onTap2,
      required String title1,
      required String title2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: onTap1,
            child: Material(
              elevation: 10,
              shadowColor: Colors.blue.withOpacity(0.6),
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.newThemePrimaryColor,
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xff125D99),
                        Color(0xff1276C6),
                      ]),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20.h,
                    ),
                    3.w.horizontalSpace,
                    Text(
                      title1,
                      style: AppStyles.inter70016FFFFFF,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        15.w.horizontalSpace,
        Expanded(
          child: InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: onTap2,
            child: Material(
              elevation: 10,
              shadowColor: Colors.blue.withOpacity(0.6),
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.newThemeButtonColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 24.h,
                      color: const Color(0xff0E4572),
                    ),
                    3.w.horizontalSpace,
                    Text(
                      title2,
                      style: AppStyles.inter600160E4572,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
