// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/utils.dart';
import 'package:quickprism/presentation/widgets/button/bottom_navigation_bar.dart';
import 'package:quickprism/presentation/widgets/svg_icon_widget/svg_icon_widget.dart';
import '../../../../application/business/transactions_sales_invoice/transaction_sales_invoice_bloc.dart';
import '../../../../domain/core/di/injectable.dart';
import '../../../../domain/invoice/create_purchase_response_model/purchaseBodyModel/invoice_body_model.dart';
import '../../../../domain/stocks/models/mylist_details/mylist_details_model.dart';
import '../../../../domain/user/models/parties/parties_model.dart';
import '../../../../domain/user/user_constants.dart';
import '../../../../infrastructure/routing/app_router.dart';
import '../../../widgets/button/radio_button.dart';
import '../../../widgets/error_widget/error_widget.dart';
import '../../../widgets/loading_widget/loading_widget.dart';
import 'widgets/additional_discount_bottom_sheet.dart';
import 'widgets/bill_to_sales.dart';
import 'widgets/sheet_due_botton_sheet_radio_button.dart';
import 'widgets/item_bottom_sheet_sales.dart';
import 'widgets/payment_amount_handler.dart';
import 'widgets/selected_party_details_sales.dart';
import 'widgets/selected_item_display_tile.dart';

@RoutePage()
class ScreenTransactionSalesInvoice extends StatefulWidget {
  const ScreenTransactionSalesInvoice({super.key});

  @override
  State<ScreenTransactionSalesInvoice> createState() =>
      _ScreenTransactionSalesInvoiceState();
}

class _ScreenTransactionSalesInvoiceState
    extends State<ScreenTransactionSalesInvoice> {
  final transactionSalesInvoiceBloc = getIt<TransactionSalesInvoiceBloc>();

  PartiesListDatum? partyDetail;
  TextEditingController totalAmountController =
      TextEditingController(text: "0");
  TextEditingController additionalDiscountController = TextEditingController();
  TextEditingController additionalDiscountTypeIsPercentageController =
      TextEditingController(text: "false");

  final dateTime = DateTime.now();

  TextEditingController paymentModeController = TextEditingController(text: "");
  final paymentModeSelectionKey = GlobalKey<_PaymentModesSelectionState>();

  int count = 0;
  @override
  void initState() {
    transactionSalesInvoiceBloc.add(TransactionSalesInvoiceInitialEvent());

    additionalDiscountController.text = "0";
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    totalAmountController.dispose();
    additionalDiscountController.dispose();
    additionalDiscountTypeIsPercentageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionSalesInvoiceBloc,
        TransactionSalesInvoiceState>(
      bloc: transactionSalesInvoiceBloc,
      listenWhen: (previous, current) {
        if ((previous is TransactionSalesInvoiceMainState ||
                    previous
                        is TransactionSalesInvoiceGettingQuantityAndLotsSuccessState) &&
                current is TransactionSalesInvoiceMainState ||
            current is TransactionSalesInvoicePartySelected ||
            current is TransactionSalesInvoiceSuccessState ||
            current
                is TransactionSalesInvoiceGettingQuantityAndLotsSuccessState) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {
        if (state is TransactionSalesInvoicePartySelected) {
          partyDetail = state.partyDetail;
        }
        if (state is TransactionSalesInvoiceMainState) {
          var totalAmount = 0.0;
          for (var i in state.selectedItems) {
            totalAmount +=
                (i.salePrice - i.salePrice * (i.discount / 100)) * i.quantity;
          }
          paymentModeSelectionKey.currentState!.totalAmount =
              totalAmount.toStringAsFixed(2);
          totalAmountController.text = totalAmount.toStringAsFixed(2);
        }
        if (state is TransactionSalesInvoiceSuccessState) {
          context.router.popAndPush(
            RouteStockInvoice(
                child: Column(
              children: [
                Text(
                    "invoice id -> ${state.createSalesResponseModel.data.invoiceId}"),
                Text("amount -> ${state.createSalesResponseModel.data.amount}"),
                Text(
                    "cash received -> ${state.createSalesResponseModel.data.cashAmountReceived}"),
                Text(
                    "party id -> ${state.createSalesResponseModel.data.partyId}"),
                SizedBox(
                  width: double.infinity,
                ),
              ],
            )),
          );
        }
      },
      builder: (context, state) {
        if (state is TransactionSalesInvoiceLoadingState) {
          return const Scaffold(
            body: Center(child: AppLoadingWidget()),
          );
        }
        if (state is TransactionSalesInvoiceErrorState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
            ),
            body: const AppErrorWidget(message: "Something went wrong"),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Sales Invoice",
              style: AppStyles.appBar,
            ),
            backgroundColor: AppColors.white,
          ),
          bottomNavigationBar: ButtonBottomNavigationBar(
            title: 'Quick invoice',
            onTap: () {
              if (state.selectedItems.isEmpty) {
                Utils.errorToast(context, "Select items");
              }
              if (partyDetail == null) {
                Utils.errorToast(context, "Party not selected");
              }
              if (paymentModeSelectionKey.currentState!.pMode.isEmpty) {
                Utils.errorToast(context, "Payment not settled");
              }
              // due amount
              double totalAmount = double.parse(
                  totalAmountController.text.isNotEmpty
                      ? totalAmountController.text
                      : "0.0");
              // amount handling for extra discount
              if (additionalDiscountController.text.isNotEmpty &&
                  additionalDiscountTypeIsPercentageController.text
                      .contains("true")) {
                additionalDiscountController.text =
                    "${double.parse(additionalDiscountController.text.isNotEmpty ? additionalDiscountController.text : "0") / 100 * totalAmount}";
              }
              //
              double cashAmountReceived = double.parse(paymentModeSelectionKey
                      .currentState!
                      .cashAmountReceivedController
                      .text
                      .isNotEmpty
                  ? paymentModeSelectionKey
                      .currentState!.cashAmountReceivedController.text
                  : "0.0");
              double onlineAmountReceived = double.parse(paymentModeSelectionKey
                      .currentState!
                      .onlineAmountReceivedController
                      .text
                      .isNotEmpty
                  ? paymentModeSelectionKey
                      .currentState!.onlineAmountReceivedController.text
                  : "0.0");
              double creditAmount = double.parse(paymentModeSelectionKey
                      .currentState!
                      .creditAmountReceivedController
                      .text
                      .isNotEmpty
                  ? paymentModeSelectionKey
                      .currentState!.creditAmountReceivedController.text
                  : "0.0");
              double dueAmount = totalAmount -
                  (cashAmountReceived + onlineAmountReceived + creditAmount);
              //===
              // payment check
              if ((paymentModeSelectionKey.currentState!.pMode
                          .contains("cash") &&
                      cashAmountReceived.toInt() == 0) ||
                  (paymentModeSelectionKey.currentState!.pMode
                          .contains("online") &&
                      onlineAmountReceived.toInt() == 0) ||
                  (paymentModeSelectionKey.currentState!.pMode
                          .contains("credit") &&
                      creditAmount.toInt() == 0) ||
                  (paymentModeSelectionKey.currentState!.pMode
                          .contains("multi") &&
                      onlineAmountReceived.toInt() == 0 &&
                      cashAmountReceived.toInt() == 0)) {
                Utils.errorToast(context, "Payment field is empty");
              } else if (state.selectedItems.isNotEmpty &&
                  partyDetail != null &&
                  paymentModeSelectionKey.currentState!.pMode.isNotEmpty)
              // if (1 == 0)
              // ===
              {
                transactionSalesInvoiceBloc.add(
                  TransactionSalesInvoiceCreateEvent(
                    bodyModel: InvoiceBodyModel(
                      shopId: UserConstants.currentShop!.shopId!,
                      date: dateTime,
                      time:
                          "${dateTime.hour}:${dateTime.minute}:${dateTime.second}",

                      recordType: 'sale',
                      partyId: partyDetail!.partyId ?? 0,
                      additionalCharges: 00,
                      additionalDiscount: double.parse(
                              additionalDiscountController.text.isNotEmpty
                                  ? additionalDiscountController.text
                                  : "0.0")
                          .toInt(),
                      amount: totalAmount.toInt(),
                      // gstNo:UserConstants.currentShop. ,
                      gstNo: 'GST123456789',
                      cashAmountReceived: cashAmountReceived.toInt(),
                      cashNotesReference: paymentModeSelectionKey
                          .currentState!.cashNotesReferenceNoController.text,
                      onlineAmountReceived: onlineAmountReceived.toInt(),
                      onlineNotesReference: paymentModeSelectionKey
                          .currentState!.onlineNotesReferenceNoController.text,
                      dueAmount: dueAmount.toInt(),
                      // dueDate : paymentModeSelectionKey.currentState!.dueDate,
                      creditAmount: creditAmount.toInt(),
                      invoiceBodyModelSaleItem: state.selectedItems,
                      invoiceBodyModelPurchaseItem: [],
                    ),
                  ),
                );
              }
            },
          ),
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.zero,
                // padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        color: AppColors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // ====
                            // InvoiceNumber(invoiceNo: "_ _ _"),
                            /// =====
                            Date(
                              date:
                                  "${dateTime.day}-${dateTime.month}-${dateTime.year}",
                            ),
                            // ===================
                          ],
                        ),
                      ),
                      // =======
                      8.h.verticalSpace,
                      //===================
                      Visibility(
                        visible: partyDetail == null,
                        child: BillToWidgetSales(
                          transactionInvoiceBloc: transactionSalesInvoiceBloc,
                          partyType: "Customer",
                          addNew: "party",
                        ),
                      ),
                      Visibility(
                          visible: partyDetail != null,
                          child: SelectedPartyDetailsSales(
                            partyDetail: partyDetail,
                            transactionInvoiceBloc: transactionSalesInvoiceBloc,
                          )),

                      SelectItemsFromInventory(state.items,
                          transactionSalesInvoiceBloc:
                              transactionSalesInvoiceBloc),
                      // item show list
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          state.selectedItems.length,
                          (index) {
                            var currentBodyItem = state.selectedItems[index];
                            var currentMyListItem = state.items.firstWhere(
                                (element) =>
                                    element.itemId == currentBodyItem.itemId);
                            double totalDiscountPrice = double.parse(
                                (currentBodyItem.salePrice -
                                        currentBodyItem.salePrice *
                                            (currentBodyItem.discount / 100))
                                    .toStringAsFixed(2));
                            if (count == 0) {
                              paymentModeSelectionKey.currentState!
                                  .totalAmount = (totalDiscountPrice *
                                      currentBodyItem.quantity)
                                  .toStringAsFixed(2);
                              totalAmountController.text =
                                  paymentModeSelectionKey
                                      .currentState!.totalAmount;
                            }
                            count++;
                            return SelectedItemDisplayTile(
                              quantity: currentBodyItem.quantity,
                              priceOfItem: totalDiscountPrice,
                              itemName: currentMyListItem.itemName ?? "N/A",
                              priceAfterTax:
                                  totalDiscountPrice * currentBodyItem.quantity,
                            );
                          },
                        ),
                      ),
                      //
                      // additional discount
                      AdditionalDiscountBottomSheet(
                        additionalDiscountController:
                            additionalDiscountController,
                        additionalDiscountTypeIsPercentageController:
                            additionalDiscountTypeIsPercentageController,
                        onTapClose: () {
                          setState(() {
                            context.router.pop();
                            additionalDiscountController.clear();
                          });
                        },
                        onTapSave: () {
                          setState(() {
                            context.popRoute();
                            double totalAmount = double.parse(
                                totalAmountController.text.isNotEmpty
                                    ? totalAmountController.text
                                    : "0.0");
                            if (additionalDiscountController.text.isNotEmpty &&
                                additionalDiscountTypeIsPercentageController
                                    .text
                                    .contains("true")) {
                              additionalDiscountController.text =
                                  "${double.parse(additionalDiscountController.text.isNotEmpty ? additionalDiscountController.text : "0") / 100 * totalAmount}";
                            } else {
                              if (additionalDiscountController
                                      .text.isNotEmpty &&
                                  additionalDiscountTypeIsPercentageController
                                      .text
                                      .contains("false")) {
                                additionalDiscountController.text =
                                    "${double.parse(additionalDiscountController.text.isNotEmpty ? additionalDiscountController.text : "0")}";
                              }
                            }
                          });
                        },
                      ),
                      8.h.verticalSpace,
                      8.h.verticalSpace,
                      PaymentModesSelection(
                        paymentModeController: paymentModeController,
                        key: paymentModeSelectionKey,
                      ),
                      50.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

//
class Date extends StatelessWidget {
  final String date;
  const Date({
    super.key,
    required this.date,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date',
            style: AppStyles.inter12400T212500
                .copyWith(fontWeight: FontWeight.w400),
          ),
          Row(
            children: [
              Text(
                date,
                style: AppStyles.tileStyleTitle,
              ),
              5.horizontalSpace,
              const AppSvgIconWidget(
                iconPath: AppAssets.calendar,
                color: AppColors.oldPrimaryP2,
              )
            ],
          )
        ],
      ),
    );
  }
}

// ===============

class SelectItemsFromInventory extends StatefulWidget {
  const SelectItemsFromInventory(this.items,
      {super.key, required this.transactionSalesInvoiceBloc});
  final List<MyListDetailsData> items;
  final TransactionSalesInvoiceBloc transactionSalesInvoiceBloc;

  @override
  State<SelectItemsFromInventory> createState() =>
      _SelectItemsFromInventoryState();
}

class _SelectItemsFromInventoryState extends State<SelectItemsFromInventory> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showModalBottomSheet(
          scrollControlDisabledMaxHeightRatio: 0.8,
          context: context,
          builder: (context) {
            return ItemBottomSheetSales(
                items: widget.items,
                transactionSalesInvoiceBloc:
                    widget.transactionSalesInvoiceBloc);
          },
        );
      },
      child: Container(
        // height: 40.h,
        margin: EdgeInsets.only(top: 20.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Items',
              style: AppStyles.inter12400T2,
            ),
            Text(' + Add items', style: AppStyles.inter12600T7)
          ],
        ),
      ),
    );
  }
}

//

class PaymentModesSelection extends StatefulWidget {
  TextEditingController paymentModeController;
  PaymentModesSelection({
    Key? key,
    required this.paymentModeController,
  }) : super(key: key);

  @override
  State<PaymentModesSelection> createState() => _PaymentModesSelectionState();
}

class _PaymentModesSelectionState extends State<PaymentModesSelection> {
  String pMode = "";
  String totalAmount = "0.0";
  String dueDate = "";
  TextEditingController cashAmountReceivedController =
      TextEditingController(text: "1");
  TextEditingController cashNotesReferenceNoController =
      TextEditingController(text: "0");
  TextEditingController sheetDueDateController = TextEditingController();
  TextEditingController onlineAmountReceivedController =
      TextEditingController(text: "0");
  TextEditingController onlineNotesReferenceNoController =
      TextEditingController();
  TextEditingController creditAmountReceivedController =
      TextEditingController(text: "0");
  TextEditingController creditNotesReferenceNoController =
      TextEditingController();
  Color unpaidLabelColor = AppColors.textColorYellow;
  Color multiMode = AppColors.textColorYellow;
  Color cashLabelColor = AppColors.textColorGreen;
  Color onlineLabelColor = Colors.purple;
  Color creditColor = AppColors.primaryP1;

  @override
  void dispose() {
    // TODO: implement dispose

    cashAmountReceivedController.dispose();
    cashNotesReferenceNoController.dispose();
    sheetDueDateController.dispose();
    onlineAmountReceivedController.dispose();
    onlineNotesReferenceNoController.dispose();
    creditAmountReceivedController.dispose();
    creditNotesReferenceNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Amount', style: AppStyles.inter16600T6),
              Text('₹$totalAmount', style: AppStyles.inter16600T6),
            ],
          ),
          Wrap(
            children: [
              AppRadioButton(
                onChanged: (p0) {
                  setState(() {
                    widget.paymentModeController.text = p0!;
                    pMode = p0;
                    // cashNotesReferenceNoController.text = p0;
                  });
                },
                value: "unpaid",
                title: "Unpaid",
                groupValue: widget.paymentModeController.text,
                radioColor: unpaidLabelColor,
              ),
              AppRadioButton(
                value: "cash",
                title: "Cash",
                groupValue: widget.paymentModeController.text,
                radioColor: cashLabelColor,
                onChanged: (p0) {
                  setState(() {
                    widget.paymentModeController.text = p0!;
                    pMode = p0;
                    onlineAmountReceivedController.text="0";
                    onlineNotesReferenceNoController.clear();
                    creditAmountReceivedController.text="0";
                    creditNotesReferenceNoController.clear();
                  });
                },
              ),
              AppRadioButton(
                value: "online",
                title: "Online",
                radioColor: onlineLabelColor,
                groupValue: widget.paymentModeController.text,
                onChanged: (p0) {
                  setState(() {
                    widget.paymentModeController.text = p0!;
                    pMode = p0;
                    cashAmountReceivedController.text="0";
                    cashNotesReferenceNoController.clear();
                    creditAmountReceivedController.text="0";
                    creditNotesReferenceNoController.clear();
                  });
                },
              ), 
              AppRadioButton(
                onChanged: (p0) {
                  setState(() {
                    widget.paymentModeController.text = p0!;
                    pMode = p0;
                  });
                },
                value: "multimode",
                title: "Multimode",
                radioColor: multiMode,
                groupValue: widget.paymentModeController.text,
              ),
              AppRadioButton(
                onChanged: (p0) {
                  setState(() {
                    widget.paymentModeController.text = p0!;
                    pMode = p0;
                  });
                },
                radioColor: creditColor,
                value: "credit",
                title: "Credit",
                groupValue: widget.paymentModeController.text,
              ),
            ],
          ),
          Visibility(
              visible: pMode == "cash",
              child: PaymentAmountHandler(
                notesReferenceNoController: cashNotesReferenceNoController,
                amountReceivedController: cashAmountReceivedController,
                paymentMode: "cash",
                labelColor: cashLabelColor,
              )),
          Visibility(
              visible: pMode == "online",
              child: PaymentAmountHandler(
                notesReferenceNoController: onlineNotesReferenceNoController,
                amountReceivedController: onlineAmountReceivedController,
                paymentMode: "online",
                labelColor: onlineLabelColor,
              )),
          Visibility(
            visible: pMode == "multimode",
            child: Column(
              children: [
                PaymentAmountHandler(
                    notesReferenceNoController: cashNotesReferenceNoController,
                    amountReceivedController: cashAmountReceivedController,
                    label: "Cash Received",
                    paymentMode: "cash",
                    labelColor: cashLabelColor),
                PaymentAmountHandler(
                    notesReferenceNoController:
                        onlineNotesReferenceNoController,
                    amountReceivedController: onlineAmountReceivedController,
                    label: "Online Received",
                    paymentMode: "online",
                    labelColor: onlineLabelColor),
                //
              ],
            ),
          ),
          Visibility(
            visible: pMode == "credit",
            child: PaymentAmountHandler(
                notesReferenceNoController: creditNotesReferenceNoController,
                amountReceivedController: creditAmountReceivedController,
                label: "Credit",
                paymentMode: "credit",
                labelColor: creditColor),
          ),
          // due date
          Visibility(
            visible: pMode == "credit" || pMode == "multimode",
            child: InkWell(
                onTap: () async {
                  await showModalBottomSheet(
                    scrollControlDisabledMaxHeightRatio: 0.58,
                    context: context,
                    builder: (context) {
                      String sheetDueDate = dueDate;
                      return StatefulBuilder(
                        builder: (context, sheetSetState) {
                          return Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.r),
                                topRight: Radius.circular(12.r),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                20.h.verticalSpace,
                                Row(
                                  children: [
                                    const Spacer(),
                                    CloseButton(
                                      onPressed: () {
                                        dueDate = "";
                                        context.router.pop();
                                        setState(() {});
                                      },
                                    )
                                  ],
                                ),
                                Text('Select the due date for this invoice',
                                    style: AppStyles.inter18600T1),
                                24.h.verticalSpace,
                                SheetDueDateBottomSheetRadioButton(
                                  groupValue: sheetDueDate,
                                  title: "7 Days",
                                  value: "7 days",
                                  onChanged: (p0) {
                                    sheetDueDate = p0!;
                                    sheetSetState(() {});
                                    // setState(() {});
                                  },
                                ),
                                SheetDueDateBottomSheetRadioButton(
                                  groupValue: sheetDueDate,
                                  title: "30 Days",
                                  value: "30 days",
                                  onChanged: (p0) {
                                    sheetDueDate = p0!;
                                    sheetSetState(() {});
                                    // setState(() {});
                                  },
                                ),
                                SheetDueDateBottomSheetRadioButton(
                                  groupValue: sheetDueDate,
                                  title: "45 Days",
                                  value: "45 days",
                                  onChanged: (p0) {
                                    sheetDueDate = p0!;
                                    sheetSetState(() {});
                                    // setState(() {});
                                  },
                                ),
                                SheetDueDateBottomSheetRadioButton(
                                  groupValue: sheetDueDate,
                                  title: "120 Days",
                                  value: "120 days",
                                  onChanged: (p0) {
                                    sheetDueDate = p0!;
                                    sheetSetState(() {});
                                    // setState(() {});
                                  },
                                ),
                                24.h.verticalSpace,
                                Flexible(
                                    child: ButtonBottomNavigationBar(
                                  title: "Save",
                                  onTap: () {
                                    dueDate = sheetDueDate;
                                    setState(() {});
                                    // sheetSetState(() {});
                                    context.router.pop();
                                  },
                                ))
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                child: Text(
                    '+ Due date  ${dueDate.isEmpty ? "" : "($dueDate)"}',
                    style: AppStyles.styleInter14500T7)),
          ),
        ],
      ),
    );
  }
}
