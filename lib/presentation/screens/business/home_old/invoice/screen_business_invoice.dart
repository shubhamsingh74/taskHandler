import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_invoice_home/business_invoice_home_bloc.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/invoice/models/purchase_list/invoice_purchase_list_model.dart';
import 'package:quickprism/domain/invoice/models/sales_list/invoice_sales_list_model.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/floating_action_button/app_floating_action_button.dart';

class ScreenBusinessInvoice extends StatefulWidget {
  const ScreenBusinessInvoice({super.key});

  @override
  State<ScreenBusinessInvoice> createState() => _ScreenBusinessInvoiceState();
}

class _ScreenBusinessInvoiceState extends State<ScreenBusinessInvoice> {
  final bloc = getIt<BusinessInvoiceHomeBloc>();

  @override
  void initState() {
    bloc.add(BusinessInvoiceHomeInitialEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              labelStyle: AppStyles.subHeading14Semi.copyWith(
                  color: AppColors.oldPrimaryP2, fontWeight: FontWeight.w600),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppColors.oldPrimaryP2,
              unselectedLabelStyle: AppStyles.subHeading14Semi,
              tabs: const [
                Tab(
                  text: 'Purchase',
                ),
                Tab(
                  text: 'Sale',
                ),
              ],
            ),
            BlocConsumer<BusinessInvoiceHomeBloc, BusinessInvoiceHomeState>(
              bloc: bloc,
              listener: (context, state) {},
              builder: (context, state) {
                if (state is BusinessInvoiceHomeLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is BusinessInvoiceHomeErrorState) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }

                return Expanded(
                  child: TabBarView(
                    children: [
                      purchaseTab(state.purchaseList!),
                      salesTab(state.salesList!),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget purchaseTab(List<InvoicePurchaseListData> purchaseList) => Scaffold(
        body: Column(
          children: <Widget>[
            16.verticalSpace,
            Row(
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.only(left: 16.w),
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        border:
                            Border.all(color: AppColors.borderColorTextField)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.search),
                        Text(
                          'Enter order id or supplier name',
                          style: AppStyles.subHeading12,
                        )
                      ],
                    ),
                  ),
                ),
                16.horizontalSpace,
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(right: 16.w),
                    height: 40.h,
                    decoration: BoxDecoration(
                        color: AppColors.borderColorTextField,
                        borderRadius: BorderRadius.circular(100.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'All',
                          style: AppStyles.subHeading12
                              .copyWith(color: AppColors.textColorT1),
                        ),
                        5.horizontalSpace,
                        const Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            16.verticalSpace,
            Expanded(
                child: ListView.separated(
                    padding: EdgeInsets.only(top: 16.h),
                    itemCount: purchaseList.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      var currentPurchase = purchaseList[index];

                      return InkWell(
                        onTap: () {
                          context.router.push(RouteStockInvoice());
                        },
                        child: Container(
                          height: 100.h,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Invoice number ${currentPurchase.purchaseRecordId}',
                                        style: AppStyles.subHeading12.copyWith(
                                          color: AppColors.oldPrimaryP1,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.chevron_right,
                                        color: AppColors.oldPrimaryP1,
                                      )
                                    ],
                                  ),
                                  8.verticalSpace,
                                  Text('${currentPurchase.supplierName}',
                                      style: AppStyles.subHeading12.copyWith(
                                          color: AppColors.textColorT1)),
                                  15.verticalSpace,
                                  SizedBox(
                                    width: 1.sw / 3,
                                    child: Text(
                                        currentPurchase.itemData!
                                            .map((e) => e)
                                            .toList()
                                            .toString()
                                            .replaceAll(RegExp(r'[\[\]]'), ''),
                                        overflow: TextOverflow.ellipsis,
                                        style: AppStyles.subHeading12.copyWith(
                                            color: AppColors.textColorT1)),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${currentPurchase.date.toString().split(' ')[0]} |  ${currentPurchase.date.toString().split(' ')[1].split(':')[0]}:${currentPurchase.date.toString().split(' ')[1].split(':')[1]}',
                                    style: AppStyles.subHeading12,
                                  ),
                                  8.verticalSpace,
                                  Text(
                                      'Total amount : Rs ${currentPurchase.totalAmount}',
                                      style: AppStyles.subHeading12500.copyWith(
                                          color: AppColors.textColorT1)),
                                  15.verticalSpace,
                                  Text(
                                      'Item count: ${currentPurchase.itemData!.length}',
                                      style: AppStyles.subHeading12500.copyWith(
                                          color: AppColors.textColorT1)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ),
        floatingActionButton: AppFloatingActionButton(
          heroTag: "new purchase",
          icon: const Icon(Icons.add),
          label: 'New Purchase',
          onTap: () async {
            await context.router.push(RouteInvoiceNewPurchase()).then((value) {
              bloc.add(BusinessInvoiceHomeInitialEvent());
            });
          },
        ),
      );
  Widget salesTab(List<InvoiceSalesListData> salesList) => Scaffold(
        body: Column(
          children: <Widget>[
            16.verticalSpace,
            Row(
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.only(left: 16.w),
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        border:
                            Border.all(color: AppColors.borderColorTextField)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.search),
                        Text(
                          'Enter order id or supplier name',
                          style: AppStyles.subHeading12,
                        )
                      ],
                    ),
                  ),
                ),
                16.horizontalSpace,
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(right: 16.w),
                    height: 40.h,
                    decoration: BoxDecoration(
                        color: AppColors.borderColorTextField,
                        borderRadius: BorderRadius.circular(100.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'All',
                          style: AppStyles.subHeading12
                              .copyWith(color: AppColors.textColorT1),
                        ),
                        5.horizontalSpace,
                        const Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            16.verticalSpace,
            Expanded(
                child: ListView.separated(
                    padding: EdgeInsets.only(top: 16.h),
                    itemCount: salesList.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      var currentSale = salesList[index];

                      return InkWell(
                        onTap: () {
                          context.router.push(RouteStockInvoice());
                        },
                        child: Container(
                          height: 100.h,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Invoice number ${currentSale.saleRecordId}',
                                        style: AppStyles.subHeading12.copyWith(
                                          color: AppColors.oldPrimaryP1,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.chevron_right,
                                        color: AppColors.oldPrimaryP1,
                                      )
                                    ],
                                  ),
                                  8.verticalSpace,
                                  Text('${currentSale.customerName}',
                                      style: AppStyles.subHeading12.copyWith(
                                          color: AppColors.textColorT1)),
                                  15.verticalSpace,
                                  Text(
                                      currentSale.itemData
                                          .toString()
                                          .replaceAll(RegExp(r'[\[\]]'), ''),
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyles.subHeading12.copyWith(
                                          color: AppColors.textColorT1)),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${currentSale.date.toString().split(' ')[0]} |  ${currentSale.date.toString().split(' ')[1].split(':')[0]}:${currentSale.date.toString().split(' ')[1].split(':')[1]}',
                                    style: AppStyles.subHeading12,
                                  ),
                                  8.verticalSpace,
                                  Text(
                                      'Total amount : Rs ${currentSale.totalAmount}',
                                      style: AppStyles.subHeading12500.copyWith(
                                          color: AppColors.textColorT1)),
                                  15.verticalSpace,
                                  Text(
                                      'Item count: ${currentSale.itemData!.length}',
                                      style: AppStyles.subHeading12500.copyWith(
                                          color: AppColors.textColorT1)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ),
        floatingActionButton: AppFloatingActionButton(
          heroTag: "New Sale",
          icon: const Icon(Icons.add),
          label: 'New Sale',
          onTap: () async {
            await context.router.push(RouteInvoiceNewSale()).then((value) {
              bloc.add(BusinessInvoiceHomeInitialEvent());
            });
          },
        ),
      );
}
