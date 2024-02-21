import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_transactions/requisition/transaction_requisition_bloc.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/utils.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/dealings/models/create_requisition/create_requisition_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/presentation/screens/business/transactions/requisition/screens/screen_requistion_success.dart';
import 'package:quickprism/presentation/screens/business/transactions/requisition/widgets/custom_common_item_widget.dart';
import 'package:quickprism/presentation/screens/business/transactions/requisition/widgets/custom_common_primary_button.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';

import '../../../../../widgets/appbar/main_app_bar_business.dart';

///---------screen review requisition
class ScreenRequisitionReview extends StatefulWidget {
  final List<Map<String, dynamic>> itemsLists;
  final List<RequisitionItemData> itemsListsModelType;
  final List<Map<String, dynamic>> vendorsList;
  final List<VendorData> vendorsListModelType;
  final String buyersSignature;
  final String shippingAddress;
  final String billingAddress;

  const ScreenRequisitionReview(
      {super.key,
      required this.itemsLists,
      required this.vendorsList,
      required this.buyersSignature,
      required this.shippingAddress,
      required this.billingAddress,
      required this.itemsListsModelType,
      required this.vendorsListModelType});

  @override
  State<ScreenRequisitionReview> createState() =>
      _ScreenRequisitionReviewState();
}

class _ScreenRequisitionReviewState extends State<ScreenRequisitionReview> {
  DateTime now = DateTime.now();
  final BusinessTransactionRequisitionBloc businessTransactionRequisitionBloc =
      getIt<BusinessTransactionRequisitionBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessTransactionRequisitionBloc,
            BusinessTransactionRequisitionState>(
        bloc: businessTransactionRequisitionBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is RequisitionLoadingState) {
            return const Scaffold(
              backgroundColor: Colors.white,
              body: AppLoadingWidget(),
            );
          }
          if (state is RequisitionErrorState) {
            return const Scaffold();
          }
          if (state is RequisitionInitialState) {
            return Scaffold(
              appBar: MainAppBarBusiness(
                isLoading: false,
              ),
              bottomNavigationBar: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w)
                    .copyWith(bottom: 20.h),
                child: SizedBox(
                  height: 58.h,
                  child: customCommonPrimaryButton(
                      onTap: () {
                        businessTransactionRequisitionBloc.add(
                            CreateRequisitionEvent(
                                businessId: UserConstants.userId!.toInt(),
                                vendorsDetails: widget.vendorsListModelType,
                                itemDetails: widget.itemsListsModelType));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                   ScreenRequisitionSuccess(
                                itemsLists: widget.itemsLists,
                                vendorsList: widget.vendorsList,
                                buyersSignature: widget.buyersSignature,
                                shippingAddress: widget.shippingAddress,
                                billingAddress: widget.billingAddress, date: '${now.day}/${now.month}/${now.year}',
                              ),
                            ));
                      },
                      title: 'Send Requisition'),
                ),
              ),
              body: SingleChildScrollView(
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
                            "Review Requisition",
                            style: AppStyles.inter70018282828
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      15.h.verticalSpace,
                      Center(
                        child: Image.asset(
                          AppAssets.imagePurchasePaperPlane,
                          height: 195.h,
                          width: 215.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                      15.h.verticalSpace,
                      Text(
                        "Requisition no. 010101 ",
                        style: AppStyles.inter600182D2F2F,
                      ),
                      5.h.verticalSpace,
                      Text(
                        "Date : ${now.day}/${now.month}/${now.year} ",
                        style: AppStyles.inter50016666060,
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Buyer’s Signatory",
                            style: AppStyles.inter500153D3A3A,
                          ),
                          5.h.verticalSpace,
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
            );
          }
          return const Scaffold();
        });
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
}
