import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_invoice_create_sales/business_invoice_create_sales_bloc.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/invoice/create_sales_body/create_sales_body_model.dart';
import 'package:quickprism/domain/stocks/models/customers/customers_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/screens/business/home_old/invoice/screen_invoice_add_item.dart';
import 'package:quickprism/presentation/widgets/appbar/main_appbar.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';
import 'package:quickprism/presentation/widgets/form_fields/filled_text_field.dart';

@RoutePage()
class ScreenInvoiceNewSale extends StatefulWidget {
  const ScreenInvoiceNewSale({super.key});

  @override
  State<ScreenInvoiceNewSale> createState() => _ScreenInvoiceNewSaleState();
}

class _ScreenInvoiceNewSaleState extends State<ScreenInvoiceNewSale> {
  final bloc = getIt<BusinessInvoiceCreateSalesBloc>();
  CustomersDatum? currentSelectedCustomer;
  List<CustomersDatum> customers = [];

  // List<CreatePurchaseItemsDetail> selectedItems = [];
  List<AddedItemModel> selectedItems = [];

  @override
  void initState() {
    bloc.add(BusinessInvoiceCreateSalesInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessInvoiceCreateSalesBloc,
        BusinessInvoiceCreateSalesState>(
      bloc: bloc,
      listener: (ctx, state) async {
        if (state is BusinessInvoiceCreateSalesNavigateToInvoiceState) {
          ctx.router.replace(RouteStockInvoice());
        }
        if (state is BusinessInvoiceCreateSalesNavigateToCustomersState) {
          await ctx.router
              .push(RouteStockSelectCustomers(
                  customers: customers,
                  currentCustomer: currentSelectedCustomer))
              .then((value) {
            if (value != null) {
              var newVal = value as List<CustomersDatum?>;

              setState(() {
                currentSelectedCustomer = newVal[0];
              });
            }
          });
        }
        if (state is BusinessInvoiceCreateSalesNavigateToAddItemState) {
          await ctx.router.push(const RouteInvoiceAddItem()).then((value) {
            if (value != null) {
              var newVal = value as List<AddedItemModel>;

              setState(() {
                selectedItems = newVal;
              });
            }
          });
        }
      },
      builder: (context, state) {
        if (state.customers != null) {
          customers = state.customers!;
        }

        return Scaffold(
          appBar: MainAppBar(
            title: "New sales entry",
            context: context,
          ),
          body: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 1.sp,
                height: 32.h,
                color: AppColors.supportSP4,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '10 sep 2023',
                      style: AppStyles.subHeading14
                          .copyWith(color: AppColors.textColorT1),
                    ),
                  ],
                ),
              ),
              24.verticalSpace,
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Customer QPID (optional)',
                        style: AppStyles.detailsTextFieldHead
                            .copyWith(fontSize: 14.sp),
                        textAlign: TextAlign.start,
                      ),
                      12.verticalSpace,
                      InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: <Widget>[
                                Text(
                                  "1234",
                                  style: AppStyles.subHeading14.copyWith(
                                    color: AppColors.oldPrimaryP2,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.chevron_right,
                                  color: AppColors.oldPrimaryP2,
                                )
                              ],
                            ),
                            const Divider(),
                          ],
                        ),
                      ),
                      18.verticalSpace,
                      Text(
                        'Customer (optional)',
                        style: AppStyles.detailsTextFieldHead
                            .copyWith(fontSize: 14.sp),
                        textAlign: TextAlign.start,
                      ),
                      12.verticalSpace,
                      InkWell(
                        onTap: () {
                          bloc.add(
                              BusinessInvoiceCreateSalesSelectCustomersEvent());
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            currentSelectedCustomer == null
                                ? Row(
                                    children: <Widget>[
                                      Text(
                                        "Select customer",
                                        style: AppStyles.subHeading14.copyWith(
                                          color: AppColors.oldPrimaryP2,
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.chevron_right,
                                        color: AppColors.oldPrimaryP2,
                                      )
                                    ],
                                  )
                                : Row(
                                    children: <Widget>[
                                      Text(
                                        currentSelectedCustomer!.name!,
                                        style: AppStyles.subHeading14.copyWith(
                                          color: AppColors.oldPrimaryP2,
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.chevron_right,
                                        color: AppColors.oldPrimaryP2,
                                      )
                                    ],
                                  ),
                            const Divider(),
                          ],
                        ),
                      ),
                      18.verticalSpace,
                      Text(
                        'Items',
                        style: AppStyles.detailsTextFieldHead
                            .copyWith(fontSize: 14.sp),
                        textAlign: TextAlign.start,
                      ),
                      12.verticalSpace,
                      InkWell(
                        onTap: () {
                          bloc.add(BusinessInvoiceCreateSalesAddItemsEvent());
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: <Widget>[
                                Text(
                                  "Add items here",
                                  style: AppStyles.subHeading14,
                                ),
                                const Spacer(),
                                CircleAvatar(
                                  radius: 10.r,
                                  backgroundColor: AppColors.supportUI3,
                                  child: Icon(
                                    Icons.add,
                                    color: AppColors.oldPrimaryP1,
                                    size: 15.r,
                                  ),
                                )
                              ],
                            ),
                            const Divider(),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: selectedItems.length,
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemBuilder: (context, index) =>
                                _addItemTile(selectedItems[index])),
                      ),
                    ],
                  ),
                ),
              ),
              12.verticalSpace,
              AppPrimaryButton(
                label: 'Record',
                onTap: currentSelectedCustomer != null
                    ? () {
                        if (selectedItems.isNotEmpty) {
                          // bloc.add(
                          //   BusinessInvoiceCreateSalesCreateEvent(
                          //     request: CreateSalesBodyModel(
                          //         customerId: currentSelectedCustomer!
                          //             .businessCustomerId,
                          //         shopId: UserConstants.currentShop!.shopId,
                          //         itemsDetails: selectedItems
                          //             .map((e) => SalesItemsDetail(
                          //                   itemId: e.itemId,
                          //                   quantity: int.parse(e.quantity),
                          //                   price:
                          //                       double.parse(e.purchasePrice),
                          //                   date: DateTime.now().toString(),
                          //                 ))
                          //             .toList(),
                          //         gstPercentage: 18,
                          //         cashAmountRecieved: 100,
                          //         onlineAmountRecieved: 100,
                          //         dueAmount: 100,
                          //         remarks: '',
                          //         date: DateTime.now().toString(),
                          //         time:
                          //             DateTime.now().toString().split(' ')[1]),
                          //   ),
                          // );
                        }
                      }
                    : null,
              ),
              24.verticalSpace,
            ],
          ),
        );
      },
    );
  }

  Widget _addItemTile(AddedItemModel data) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      height: 100.h,
      // color: Colors.amber,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                data.itemName!,
                style: AppStyles.subHeading14500,
              ),
              const Spacer(),
              Text(
                data.date,
                style: AppStyles.subHeading12Semi
                    .copyWith(color: AppColors.textColorT1),
              ),
            ],
          ),
          12.verticalSpace,
          Row(
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FilledTextField(
                      heading: 'Quantity',
                      controller: TextEditingController(text: data.quantity),
                      onChanged: (e) {
                        data.quantity = e;
                      },
                    ),
                  ],
                ),
              ),
              16.horizontalSpace,
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FilledTextField(
                      heading: 'Purchase price',
                      controller:
                          TextEditingController(text: data.purchasePrice),
                      onChanged: (e) {
                        data.purchasePrice = e;
                      },
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
