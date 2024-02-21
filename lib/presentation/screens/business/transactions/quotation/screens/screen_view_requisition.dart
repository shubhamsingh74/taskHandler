import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/presentation/screens/business/transactions/quotation/screens/screen_create_quotation.dart';
import 'package:quickprism/presentation/screens/business/transactions/requisition/widgets/custom_common_primary_button.dart';
import 'package:quickprism/presentation/widgets/appbar/main_app_bar_business.dart';

class ScreenViewRequisition extends StatefulWidget {
  const ScreenViewRequisition({super.key});

  @override
  State<ScreenViewRequisition> createState() => _ScreenViewRequisitionState();
}

class _ScreenViewRequisitionState extends State<ScreenViewRequisition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBarBusiness(
        isLoading: false,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w).copyWith(bottom: 20.h),
        child: SizedBox(
          height: 58.h,
          child: customCommonPrimaryButton(
              onTap: () {
                ///--------testing purpose
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenCreateQuotation(),
                    ));
              },
              title: 'Proceed to Send Quotation'),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 0.64.sh,
              decoration: const BoxDecoration(color: Colors.white),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  15.h.verticalSpace,
                  Row(
                    children: [
                      InkWell(
                        splashFactory: NoSplash.splashFactory,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          AppAssets.imageArrowLeft,
                          height: 28.h,
                          width: 30.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                      10.w.horizontalSpace,
                      Text(
                        "View Requisition",
                        style: AppStyles.inter70018282828
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  15.h.verticalSpace,
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 100.h),
                        child: Material(
                          elevation: 10,
                          shadowColor: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(11.r),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                    vertical: 30.h, horizontal: 25.w)
                                .copyWith(top: 35.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11.r),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Requisition no. 010101",
                                  style: AppStyles.inter600182D2F2F
                                      .copyWith(fontSize: 20.sp),
                                ),
                                10.h.verticalSpace,
                                Text("Sent By : B-Name",
                                    style: AppStyles.inter50016666060),
                                Text("Date : DD/MM/YYYY",
                                    style: AppStyles.inter50016666060),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.imageEnvelope,
                              height: 120.h,
                              width: 140.w,
                              fit: BoxFit.fill,
                            ),
                            InkWell(
                              splashFactory: NoSplash.splashFactory,
                              onTap: () {},
                              child: Material(
                                elevation: 5,
                                shadowColor: Colors.blue.shade400,
                                borderRadius: BorderRadius.circular(8.r),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 20.w),
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
                                        style: AppStyles.inter60015242323
                                            .copyWith(
                                                fontSize: 14.sp,
                                                color: const Color(0xff0E4572)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  20.h.verticalSpace,
                  Material(
                    elevation: 10,
                    shadowColor: Colors.blue.shade400,
                    borderRadius: BorderRadius.circular(11.r),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Product Details",
                            style: AppStyles.inter60016282828
                                .copyWith(fontSize: 18.5.sp),
                          ),
                          ListView.builder(
                            itemCount: 2,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            primary: false,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.h),
                                  child: customContainerItemWIdget(
                                      name: 'Pepsi',
                                      category: 'Cold Drinks',
                                      brand: 'Pepsi Co.',
                                      unit: 'PIECES',
                                      quantity: '200',
                                      hsnSacCode: '2456'));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  20.h.verticalSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Buyer’s Signatory",
                        style: AppStyles.inter500153D3A3A
                            .copyWith(fontSize: 16.sp),
                      ),
                      5.h.verticalSpace,
                      Text(
                        "Shubham Singh",
                        style: AppStyles.inter500153D3A3A
                            .copyWith(fontSize: 16.sp),
                      ),
                    ],
                  ),
                  20.h.verticalSpace,
                  Text(
                    "Billing Address",
                    style: AppStyles.inter50015474545,
                  ),
                  Text(
                    "sector 12",
                    style: AppStyles.inter50015474545,
                  ),
                  20.h.verticalSpace,
                  Text(
                    "Shipping Address",
                    style: AppStyles.inter50015474545,
                  ),
                  Text(
                    "sector 21, mumbai",
                    style: AppStyles.inter50015474545,
                  ),
                  50.h.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///----custom container
  customContainerItemWIdget(
      {required String name,
      required String category,
      required String brand,
      required String hsnSacCode,
      required String unit,
      required String quantity}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: AppStyles.inter60019242323,
            ),
            10.horizontalSpace,
            Text(
              hsnSacCode,
              style: AppStyles.inter50015666060,
            ),
          ],
        ),
        FittedBox(
          child: Text(
            "Category : $category",
            style: AppStyles.inter50015474545,
          ),
        ),
        Text(
          "Brand : $brand",
          style: AppStyles.inter50015474545,
        ),
        Text(
          "Qty: $quantity , Unit: $unit",
          style: AppStyles.inter50015474545,
        ),
      ],
    );
  }
}
