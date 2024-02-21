// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickprism/application/business/business_transactions/business_transaction_bloc.dart';

import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/invoice/models/transactions/transactions_model.dart';
import 'package:quickprism/domain/invoice/models/transactions_purchases/transactions_purchase_model.dart';
import 'package:quickprism/domain/invoice/models/transactions_sales/transactions_sales_model.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/screens/business/transactions/quotation/screens/screen_view_requisition.dart';
import 'package:quickprism/presentation/screens/business/transactions/requisition/screens/screen_create_requisition_select_items.dart';
import 'package:quickprism/presentation/screens/business/transactions/screen_create_purchase.dart';
import 'package:quickprism/presentation/screens/business/transactions/screen_direct_sale.dart';
import 'package:quickprism/presentation/widgets/close_button_widget/app_close_button.dart';
import 'package:quickprism/presentation/widgets/error_widget/error_widget.dart';
import 'package:quickprism/presentation/widgets/floating_action_button/app_floating_action_button.dart';
import 'package:quickprism/presentation/widgets/form_fields/search_text_field.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';
import 'package:quickprism/presentation/widgets/svg_icon_widget/svg_icon_widget.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../domain/user/user_constants.dart';
import '../../../widgets/color_tab_bar/color_tab_bar.dart';

class ScreenBusinessTransactions extends StatefulWidget {
  const ScreenBusinessTransactions({super.key, required this.shopId});

  final int? shopId;

  @override
  State<ScreenBusinessTransactions> createState() =>
      _ScreenBusinessTransactionsState();
}

class _ScreenBusinessTransactionsState
    extends State<ScreenBusinessTransactions> {
  String transactionType = "Sales";
  final bloc = getIt<BusinessTransactionBloc>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.shopId == null) {
      bloc.add(BusinessTransactionNoStoreEvent());
    } else {
      // bloc.add(BusinessTransactionInitialEvent(
      //     shopId: widget.shopId!));
      bloc.add(BusinessTransactionInitialEvent(
          shopId: widget.shopId ?? UserConstants.currentShop!.shopId!));
    }
  }

  @override
  void didUpdateWidget(covariant ScreenBusinessTransactions oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    if (widget.shopId == null) {
      bloc.add(BusinessTransactionNoStoreEvent());
    } else {
      // bloc.add(BusinessTransactionInitialEvent(
      //     shopId: widget.shopId!));
      bloc.add(BusinessTransactionInitialEvent(
          shopId: widget.shopId ?? UserConstants.currentShop!.shopId!));
    }
    // } );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessTransactionBloc, BusinessTransactionState>(
      bloc: bloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is BusinessTransactionLoadingState) {
          return AppLoadingWidget();
        }

        if (state is BusinessTransactionErrorState) {
          return AppErrorWidget();
        }

        return RefreshIndicator(
          onRefresh: () async {
            if (widget.shopId == null) {
              bloc.add(BusinessTransactionNoStoreEvent());
            } else {
              bloc.add(BusinessTransactionInitialEvent(
                  shopId: UserConstants.currentShop!.shopId!));
            }
          },
          child: DefaultTabController(
            length: 4,
            child: Scaffold(
              body: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.verticalSpace,
                  _transactionTopWidget(details: state.mainData),
                  16.verticalSpace,
                  //   TransactionTabBar(),

                  //

                  Expanded(
                    child: Column(
                      children: [
                        ColoredTabBar(
                          color: AppColors.primaryP1,
                          tabBar: TabBar(
                            tabAlignment: TabAlignment.start,
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            automaticIndicatorColorAdjustment: true,
                            labelPadding:
                                EdgeInsets.symmetric(horizontal: 20.w),
                            isScrollable: true,
                            labelStyle: AppStyles.activeTabStyle,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: const BoxDecoration(
                                color: AppColors.primaryP1,
                                border: Border(
                                    bottom: BorderSide(
                                  color: AppColors.white,
                                  width: 2,
                                ))),
                            dividerColor: AppColors.white,
                            indicatorColor: AppColors.white,
                            unselectedLabelStyle: AppStyles.inActiveTabStyle,
                            unselectedLabelColor: AppColors.textColorT3,
                            onTap: (value) {},
                            tabs: [
                              Tab(
                                text: "Sales",
                              ),
                              Tab(
                                text: "Purchase",
                              ),
                              Tab(
                                text: "Returns",
                              ),
                              Tab(
                                text: "Expense",
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(children: [
                            SalesWidget(
                              state: state,
                              businessTransactionBloc: bloc,
                            ),
                            PurchaseWidget(businessTransactionBloc: bloc),
                            Returns(),
                            Expenses(),
                          ]),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _transactionTopWidget({required TransactionsData? details}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MonthlyNoSalesOrPurchasesYetAndPurchases(
                title: "Monthly Sales",
                subTitle: details?.monthlySales.toString() ?? "0",
              ),
              16.horizontalSpace,
              MonthlyNoSalesOrPurchasesYetAndPurchases(
                title: "Monthly Purchases",
                subTitle: details?.monthlyPurchases.toString() ?? "0",
              ),
            ],
          ),
        ),
        16.verticalSpace,
        TodaysInAndOut(
          todaysIn: details?.todaysIn!.toString() ?? "0",
          todaysOut: details?.todaysOut!.toString() ?? "0",
        ),
        16.verticalSpace,
        ViewReport(),
      ],
    );
  }
}

class FloatingActionButton extends StatelessWidget {
  final Function() onTap;
  String transactionType;

  FloatingActionButton({
    Key? key,
    required this.onTap,
    required this.transactionType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      // onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: ShapeDecoration(
          color: AppColors.oldPrimaryP2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: AppColors.white,
              size: 25.h,
            ),
            5.horizontalSpace,
            Container(
              height: 24.h,
            ),
            Text(
              transactionType,
              // 'Sales',
              style: AppStyles.inter16600T1.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class SalesWidget extends StatefulWidget {
  const SalesWidget(
      {super.key, required this.state, required this.businessTransactionBloc});

  final BusinessTransactionState state;
  final BusinessTransactionBloc businessTransactionBloc;

  @override
  State<SalesWidget> createState() => _SalesWidgetState();
}

class _SalesWidgetState extends State<SalesWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.state.isSalesLoading ?? true) {
      return Center(
        child: CircularProgressIndicator(
          color: AppColors.textColorT3,
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    ///----just for the testing purpose
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenViewRequisition(),
                        ));
                  },
                  child: Material(
                    elevation: 10,
                    shadowColor: Colors.grey,
                    borderRadius: BorderRadius.circular(20.r),
                    child: Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      decoration: BoxDecoration(
                          color: const Color(0xff0684BA),
                          borderRadius: BorderRadius.circular(20.r)),
                      child: const Text(
                        "New Quotation",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Flexible(child: MainSearchTextField()),
            // AppRoundActionButtonWidget(
            //     iconData: Icons.menu,
            //     bgColor: AppColors.textColorT3,
            //     iconColor: AppColors.textColorT1,
            //     onTap: () {}),
            // 16.horizontalSpace,
          ],
        ),
        body:
            //
            widget.state.sales!.isEmpty
                ? Center(
                    child: NoSalesOrPurchasesYet(
                    salesOrPurchases: "Sales",
                  ))
                : ListView.builder(
                    itemCount: widget.state.sales?.length ?? 0,
                    itemBuilder: (context, index) {
                      return SalesInvoiceListTile(
                          currentSale: widget.state.sales![index]);
                    }),
        //

        floatingActionButton: AppFloatingActionButton(
          onTap: () async {
            showDialog(
              context: context,
              builder: (context) => customShowDialogWidget(context: context),
            );
            // await context.router
            //     .push(RouteTransactionSalesInvoice())
            //     .then((value) {
            //   businessTransactionBloc.add(BusinessTransactionInitialEvent(
            //     shopId: UserConstants.currentShop!.shopId!,
            //     // shopId:
            //   ));
            // });
          },
          icon: Icon(Icons.add),
          label: 'Add Sale',
        )
        //  AppFloatingActionButton(
        //   icon: Icon(Icons.add),
        //   onTap: () async {
        //     await context.router
        //         .push(RouteTransactionSalesInvoice())
        //         .then((value) {
        //       businessTransactionBloc.add(BusinessTransactionInitialEvent(
        //         shopId: UserConstants.currentShop!.shopId!,
        //         // shopId:
        //       ));
        //     });
        //   },
        //   label: '',
        //   // label: 'Sales',
        // ),
        );
  }

  ///-----customShowDialogWidget
  customShowDialogWidget({required BuildContext context}) {
    return Center(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          margin: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffF0F8FE),
                Color(0xffEFF7FC),
              ]),
              borderRadius: BorderRadius.circular(20.r)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Choose an option",
                  style: AppStyles.activeTabStyleDialogTitleMain),
              15.h.verticalSpace,
              customButtonContainer(
                  mainTitle: '  Customers List',
                  subTitle: '  Explore Added Customers',
                  image: AppAssets.imageManyUsers,
                  height: 26,
                  width: 21,
                  onTap: () {}),
              customButtonContainer(
                  mainTitle: 'Direct Sales',
                  subTitle: 'Sell Directly to a person',
                  image: AppAssets.imagePlayButton,
                  height: 27,
                  width: 32,
                  onTap: () {
                    ///------just to check the flow purpose
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenDirectSale(),
                        )).then((value) {
                      Navigator.pop(context);
                    });
                  }),
              customButtonContainer(
                  mainTitle: '  Add Customers',
                  subTitle: '  Add New Regular Customers',
                  image: AppAssets.imageAddCircle,
                  height: 26,
                  width: 25,
                  onTap: () {}),
              customButtonContainer(
                  mainTitle: 'Cash',
                  subTitle: 'Use Cash mode of payment',
                  image: AppAssets.imageRupeeCash,
                  height: 30,
                  width: 37,
                  onTap: () {}),
              20.h.verticalSpace,
              customNavigationButtons(),
            ],
          )),
    );
  }

  ///----custom button container for showdialog
  customButtonContainer(
      {required String mainTitle,
      required String subTitle,
      required String image,
      required VoidCallback onTap,
      required double height,
      required double width}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Material(
          elevation: 10,
          color: Colors.white,
          shadowColor: Colors.grey.shade200.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Color(0xff249AF0), width: 2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  height: height,
                  width: width,
                  fit: BoxFit.fill,
                ),
                10.h.horizontalSpace,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainTitle,
                      style: AppStyles.dialogTextTitle,
                    ),
                    Text(
                      subTitle,
                      style: AppStyles.dialogText,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///----next button and cancel button
  customNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            ///---------just for the checking flow
          },
          child: Material(
            elevation: 10,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 60.sp, vertical: 15.sp),
              decoration: BoxDecoration(
                  color: const Color(0xff1DB4C9),
                  borderRadius: BorderRadius.circular(8.r)),
              child: const Text(
                "Next",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Material(
            elevation: 10,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.red, width: 2)),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PurchaseWidget extends StatelessWidget {
  PurchaseWidget({super.key, required this.businessTransactionBloc});

  BusinessTransactionBloc businessTransactionBloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessTransactionBloc, BusinessTransactionState>(
      // bloc:  bloc,
      bloc: businessTransactionBloc,

      listener: (context, state) {},
      builder: (context, state) {
        if (state.isPurchaseLoading ?? true) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.textColorT3,
            ),
          );
        }
        return Scaffold(
            appBar: AppBar(
              toolbarHeight: 70,
              backgroundColor: AppColors.white,
              elevation: 0,
              actions: [
                customButtonWidget(context: context),
                // Flexible(child: MainSearchTextField()),
                // AppRoundActionButtonWidget(
                //     iconData: Icons.menu,
                //     bgColor: AppColors.textColorT3,
                //     iconColor: AppColors.textColorT1,
                //     onTap: () {}),
                //16.horizontalSpace,
              ],
            ),
            floatingActionButton: AppFloatingActionButton(
              icon: Icon(Icons.add),
              onTap: () async {
                ///----just for the testing purpose
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => ScreenCreateRequisition(),
                //     ));
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenQuotationPurchase(),));

                await context.router
                    .push(RouteTransactionsPurchase())
                    .then((value) {
                  businessTransactionBloc.add(BusinessTransactionInitialEvent(
                      shopId: UserConstants.currentShop!.shopId!));
                });
              },
              label: 'Add Purchase',
            ),
            body: state.purchases!.isEmpty
                ? Center(
                    child: NoSalesOrPurchasesYet(
                    salesOrPurchases: "Purchases",
                  ))
                : ListView.builder(
                    itemCount: state.purchases?.length ?? 0,
                    itemBuilder: (context, index) {
                      return PurchaseInvoiceListTile(
                          currentPurchase: state.purchases![index]);
                    }));
      },
    );
  }

  ///----custom widget for button
  customButtonWidget({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              ///----just for the testing purpose
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenCreateRequisitionSelectItems(),
                  ));
            },
            child: Material(
              elevation: 10,
              shadowColor: Colors.grey,
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                decoration: BoxDecoration(
                    color: const Color(0xff0684BA),
                    borderRadius: BorderRadius.circular(20.r)),
                child: const Text(
                  "+  New Requisition",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          2.h.horizontalSpace,
          InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              ///----just for the testing purpose
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenQuotationPurchase(),
                  ));
            },
            child: Material(
              elevation: 10,
              shadowColor: Colors.grey,
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                decoration: BoxDecoration(
                    color: const Color(0xff0684BA),
                    borderRadius: BorderRadius.circular(20.r)),
                child: const Text(
                  "+   New Purchase Order",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SalesInvoiceListTile extends StatelessWidget {
  const SalesInvoiceListTile({
    super.key,
    required this.currentSale,
  });

  final TransactionsSalesData currentSale;

  @override
  Widget build(BuildContext context) {
    bool isUnpaid = currentSale.paymentMode!.contains("unpaid");
    int paidAmount = currentSale.amount! - currentSale.dueAmount!;
    bool isFullyPaid = currentSale.dueAmount == 0;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 9.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          left: BorderSide(color: AppColors.supportUI12),
          top: BorderSide(color: AppColors.supportUI12),
          right: BorderSide(color: AppColors.supportUI12),
          bottom: BorderSide(width: 1, color: AppColors.supportUI12),
        ),
      ),
      child: Row(
        children: [
          // ==========
          16.horizontalSpace,
          Container(
            padding: EdgeInsets.all(8.w),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: isUnpaid
                  ? AppColors.shadeColorRed
                  : isFullyPaid
                      ? AppColors.supportUI11
                      : AppColors.shadeColorYellow,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r)),
            ),
            child: AppSvgIconWidget(
              iconPath: AppAssets.invoicePaid,
              color: isUnpaid
                  ? AppColors.textColorRed
                  : isFullyPaid
                      ? AppColors.textColorGreen
                      : AppColors.textColorYellow,
            ),
          ),
          8.horizontalSpace,
          //========
          Column(
            children: [
              Text(
                'Invoice ${currentSale.invoiceNumber}',
                // 'Tax Invoice 123',
                style: AppStyles.tileStyleTitle,
              ),
              Row(
                children: [
                  Text(currentSale.date!.toString().split(' ')[0],
                      style: AppStyles.tileStyleGray),
                  4.horizontalSpace,
                  AppSvgIconWidget(
                    iconPath: AppAssets.storeIcon,
                    color: AppColors.storeColor1,
                  ),
                ],
              ),
              Text(isFullyPaid ? "" : 'Payment pending',
                  style: AppStyles.tileStyleGray)
            ],
          ),

          //
          Spacer(),
          //
          Column(
            children: [
              Text(
                '₹${currentSale.amount}',
                textAlign: TextAlign.right,
                style: AppStyles.tabStyle,
              ),
              Text(
                "${isUnpaid ? "" : currentSale.paymentMode}",
                // 'Cash',
                textAlign: TextAlign.right,
                style: AppStyles.tileStyleSubTitle,
              ),
              Row(
                children: [
                  Text(
                      // 'Fully paid',
                      isUnpaid
                          ? "Unpaid"
                          : isFullyPaid
                              ? "Fully paid"
                              : "Partially paid",
                      textAlign: TextAlign.right,
                      style: AppStyles.inter12400T212500.copyWith(
                        color: isUnpaid
                            ? AppColors.textColorRed
                            : isFullyPaid
                                ? AppColors.textColorGreen
                                : AppColors.textColorYellow,
                      )),
                  4.horizontalSpace,
                  isUnpaid
                      ? SizedBox.shrink()
                      : isFullyPaid
                          ? AppSvgIconWidget(
                              iconPath: AppAssets.arrowTiltedUp,
                              color: AppColors.textColorGreen,
                            )
                          : AppSvgIconWidget(
                              iconPath: AppAssets.arrowTiltedUp,
                              color: AppColors.textColorYellow,
                            ),
                  4.horizontalSpace,
                  Text(
                      isUnpaid
                          ? ""
                          : paidAmount != 0
                              ? "$paidAmount"
                              : "${currentSale.amount}",
                      textAlign: TextAlign.right,
                      style: AppStyles.inter12400T212500.copyWith(
                        color: isUnpaid
                            ? AppColors.textColorRed
                            : isFullyPaid
                                ? AppColors.textColorGreen
                                : AppColors.textColorYellow,
                      )),
                ],
              )
            ],
          ),
          16.horizontalSpace,
        ],
      ),
    );
  }
}

class PurchaseInvoiceListTile extends StatefulWidget {
  const PurchaseInvoiceListTile({
    super.key,
    required this.currentPurchase,
  });

  final TransactionsPurchaseData currentPurchase;

  @override
  State<PurchaseInvoiceListTile> createState() =>
      _PurchaseInvoiceListTileState();
}

class _PurchaseInvoiceListTileState extends State<PurchaseInvoiceListTile> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    // unpaid pully paid , partially paid
    bool isUnpaid = widget.currentPurchase.paymentMode!.contains("unpaid");
    int paidAmount =
        widget.currentPurchase.amount! - widget.currentPurchase.dueAmount!;
    bool isFullyPaid = widget.currentPurchase.dueAmount == 0;

    return Column(
      children: [
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () {
            isTapped = !isTapped;
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 9.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(
                left: BorderSide(color: AppColors.supportUI12),
                top: BorderSide(color: AppColors.supportUI12),
                right: BorderSide(color: AppColors.supportUI12),
                bottom: BorderSide(width: 1, color: AppColors.supportUI12),
              ),
            ),
            child: Row(
              children: [
                // ==========
                16.horizontalSpace,
                Container(
                  padding: EdgeInsets.all(8.w),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: isUnpaid
                        ? AppColors.shadeColorRed
                        : isFullyPaid
                            ? AppColors.supportUI11
                            : AppColors.shadeColorYellow,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r)),
                  ),
                  child: AppSvgIconWidget(
                    iconPath: AppAssets.invoicePaid,
                    color: isUnpaid
                        ? AppColors.textColorRed
                        : isFullyPaid
                            ? AppColors.textColorGreen
                            : AppColors.textColorYellow,
                  ),
                ),
                8.horizontalSpace,
                //========
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Purchase Order ${widget.currentPurchase.invoiceNumber}',
                      // 'Tax Invoice 123',
                      style: AppStyles.tileStyleTitle,
                    ),
                    Row(
                      children: [
                        Text(
                            widget.currentPurchase.date!
                                .toString()
                                .split(' ')[0],
                            style: AppStyles.tileStyleGray),
                        4.horizontalSpace,
                        AppSvgIconWidget(
                          iconPath: AppAssets.storeIcon,
                          color: AppColors.storeColor1,
                        ),
                      ],
                    ),
                    Text(isFullyPaid ? "" : 'Payment pending',
                        style: AppStyles.tileStyleGray)
                  ],
                ),

                //
                Spacer(),
                //
                Column(
                  children: [
                    Text(
                      '₹${widget.currentPurchase.amount}',
                      textAlign: TextAlign.right,
                      style: AppStyles.tabStyle,
                    ),
                    Text(
                      isUnpaid ? "" : '${widget.currentPurchase.paymentMode}',
                      // "${isUnpaid ? "" : currentPurchase.paymentMode}",
                      textAlign: TextAlign.right,
                      style: AppStyles.tileStyleSubTitle,
                    ),
                    Row(
                      children: [
                        Text(
                            isUnpaid
                                ? "Unpaid"
                                : isFullyPaid
                                    ? "Fully paid"
                                    : "Partially paid",
                            textAlign: TextAlign.right,
                            style: AppStyles.inter12400T212500.copyWith(
                              // color: AppColors.textColorGreen,
                              color: isUnpaid
                                  ? AppColors.textColorRed
                                  : isFullyPaid
                                      ? AppColors.textColorGreen
                                      : AppColors.textColorYellow,
                            )),

                        4.horizontalSpace,

                        //
                        //
                        isUnpaid
                            ? SizedBox.shrink()
                            : isFullyPaid
                                ? AppSvgIconWidget(
                                    iconPath: AppAssets.arrowTiltedUp,
                                    color: AppColors.textColorGreen,
                                  )
                                : AppSvgIconWidget(
                                    iconPath: AppAssets.arrowTiltedUp,
                                    color: AppColors.textColorYellow,
                                  ),

                        //
                        4.horizontalSpace,
                        Text(
                            isUnpaid
                                ? ""
                                : paidAmount != 0
                                    ? "$paidAmount"
                                    : "${widget.currentPurchase.amount}",
                            textAlign: TextAlign.right,
                            style: AppStyles.inter12400T212500.copyWith(
                              color: isUnpaid
                                  ? AppColors.textColorRed
                                  : isFullyPaid
                                      ? AppColors.textColorGreen
                                      : AppColors.textColorYellow,
                            )),
                      ],
                    )
                  ],
                ),
                16.horizontalSpace,
              ],
            ),
          ),
        ),
        //---making the choice collection of the is item received or not.
        Visibility(
          visible: isTapped,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.purchaseBackground,
            ),
            child: Row(
              children: [
                16.horizontalSpace,
                Text(
                  "Item received?",
                  style: AppStyles.purchaseItemRecieved,
                ),
                Spacer(),
                Row(
                  children: [
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.textColorT4,
                          border: Border.all(
                              color: AppColors.borderColorTextField, width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text("No", style: AppStyles.purchaseItemNo),
                      ),
                    ),
                    10.horizontalSpace,
                    InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.textColorT7,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text("Yes", style: AppStyles.purchaseItemYes),
                      ),
                    ),
                  ],
                ),
                16.horizontalSpace,
              ],
            ),
          ),
        )
      ],
    );
  }
}

class NoSalesOrPurchasesYet extends StatelessWidget {
  const NoSalesOrPurchasesYet({super.key, required this.salesOrPurchases});

  final String salesOrPurchases;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
        Flexible(child: SvgPicture.asset(AppAssets.noSales)),
        20.verticalSpace,
        Text('No $salesOrPurchases yet!',
            style: AppStyles.inter16600T1.copyWith(fontSize: 18.sp)),
        10.verticalSpace,
        Flexible(
          child: SizedBox(
            width: 290.w,
            child: Text(
              'Record your $salesOrPurchases here by clicking on add $salesOrPurchases button',
              textAlign: TextAlign.center,
              style: AppStyles.inter12400T2.copyWith(fontSize: 14.sp),
              // TextStyle(
              //   color: Color(0xFF8D8D8D),
              //   fontSize: 14,
              //   fontFamily: 'Inter',
              //   fontWeight: FontWeight.w400,
              // ),
            ),
          ),
        ),
      ],
    );
  }
}

class Returns extends StatelessWidget {
  const Returns({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("returns"),
    );
  }
}

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("expenses"),
    );
  }
}

class TodaysInAndOut extends StatelessWidget {
  final String todaysIn;
  final String todaysOut;

  const TodaysInAndOut({
    super.key,
    required this.todaysIn,
    required this.todaysOut,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFF4F4F4)),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Today’s OUT', style: AppStyles.inter12400T2),
                  SizedBox(height: 8.h),
                  Text('₹$todaysOut',
                      style: AppStyles.inter12400T212500
                          .copyWith(color: AppColors.textColorRed)),
                ],
              ),
            ),
          ),
          16.horizontalSpace,
          Flexible(
            child: Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFF4F4F4)),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Today’s IN', style: AppStyles.inter12400T2),
                  SizedBox(height: 8.h),
                  Text('₹$todaysIn',
                      style: AppStyles.inter12400T212500
                          .copyWith(color: AppColors.textColorGreen)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ViewReport extends StatelessWidget {
  const ViewReport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('View Report', style: AppStyles.inter12600T7),
        AppSvgIconWidget(
          iconPath: AppAssets.forwardArrowIcon,
          color: AppColors.primaryP2,
        ),
      ],
    );
  }
}

class MonthlyNoSalesOrPurchasesYetAndPurchases extends StatelessWidget {
  final String title;
  final String subTitle;

  const MonthlyNoSalesOrPurchasesYetAndPurchases({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: 1.sw,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFF4F4F4)),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyles.inter12400T2,
            ),
            8.verticalSpace,
            Text(
              '₹$subTitle',
              style: AppStyles.tileStyleSubTitle,
            ),
          ],
        ),
      ),
    );
  }
}
