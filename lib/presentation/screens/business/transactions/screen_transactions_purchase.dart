// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quickprism/application/business/transactions_purchase_invoice/transaction_purchase_invoice_bloc.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/utils.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/stocks/models/mylist_details/mylist_details_model.dart';
import 'package:quickprism/domain/user/models/parties/parties_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/screens/business/transactions/widgets/selected_item_display_tile.dart';
import 'package:quickprism/presentation/widgets/button/bottom_navigation_bar.dart';
import 'package:quickprism/presentation/widgets/error_widget/error_widget.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';
import 'package:quickprism/presentation/widgets/svg_icon_widget/svg_icon_widget.dart';

import '../../../../domain/invoice/create_purchase_response_model/purchaseBodyModel/invoice_body_model.dart';
import '../../../widgets/button/radio_button.dart';
import 'widgets/additional_discount_bottom_sheet.dart';
import 'widgets/bill_to_purchase.dart';
import 'widgets/item_bottom_sheet_purchase.dart';
import 'widgets/sheet_due_botton_sheet_radio_button.dart';
import 'widgets/payment_amount_handler.dart';
import 'widgets/selected_party_details_purchase.dart';

@RoutePage()
class ScreenTransactionsPurchase extends StatefulWidget {
  const ScreenTransactionsPurchase({super.key});

  @override
  State<ScreenTransactionsPurchase> createState() =>
      _ScreenTransactionsPurchaseState();
}

class _ScreenTransactionsPurchaseState
    extends State<ScreenTransactionsPurchase> {
  final transactionPurchaseInvoiceBloc =
      getIt<TransactionPurchaseInvoiceBloc>();

  String? dropdownvalue;
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
    transactionPurchaseInvoiceBloc
        .add(TransactionPurchaseInvoiceInitialEvent());
    super.initState();
    additionalDiscountController.text = "0";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    totalAmountController.dispose();
    additionalDiscountController.dispose();
    additionalDiscountTypeIsPercentageController.dispose();
    paymentModeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionPurchaseInvoiceBloc,
        TransactionPurchaseInvoiceState>(
      bloc: transactionPurchaseInvoiceBloc,
      listenWhen: (previous, current) {
        if (previous is TransactionPurchaseInvoiceMainState &&
                current is TransactionPurchaseInvoiceMainState ||
            current is TransactionPurchaseInvoicePartySelected ||
            current is TransactionPurchaseInvoiceSuccessState) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {
        if (state is TransactionPurchaseInvoicePartySelected) {
          partyDetail = state.partyDetail;
        }
        if (state is TransactionPurchaseInvoiceMainState) {
          var totalAmount = 0.0;
          if (state.selectedItems.isEmpty) {
            for (var i in state.selectedItems) {
              // var discountPriceOfOneItem = i.price - i.price * i.discount / 100;
              totalAmount = totalAmount + (i.purchasePrice * i.quantity);
            }
            totalAmountController.text = totalAmount.toStringAsFixed(2);
            paymentModeSelectionKey.currentState!.totalAmount =
                totalAmountController.text;
          }
        }
        if (state is TransactionPurchaseInvoiceSuccessState) {
          context.router.popAndPush(RouteStockInvoice(
            child: Column(
              children: [
                Text(
                    "invoice id -> ${state.createPurchaseResponseModel.data.invoiceId}"),
                Text(
                    "invoice url -> ${state.createPurchaseResponseModel.data.invoiceUrl}"),
                Text(
                    "shop id -> ${state.createPurchaseResponseModel.data.shopId}"),
                Text(
                    "amount -> ${state.createPurchaseResponseModel.data.amount}"),
                Text(
                    "cash received -> ${state.createPurchaseResponseModel.data.cashAmountReceived}"),
                Text(
                    "party id -> ${state.createPurchaseResponseModel.data.partyId}"),
                const SizedBox(
                  width: double.infinity,
                ),
              ],
            ),
          ));
        }
      },
      builder: (context, state) {
        if (state is TransactionPurchaseInvoiceLoadingState) {
          return const Scaffold(
            body: Center(child: AppLoadingWidget()),
          );
        }
        if (state is TransactionPurchaseInvoiceErrorState) {
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
              "Purchase Invoice",
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
              double totalAmount = double.parse(
                  totalAmountController.text.isNotEmpty
                      ? totalAmountController.text
                      : "0.0");
              if (additionalDiscountController.text.isNotEmpty &&
                  additionalDiscountTypeIsPercentageController.text
                      .contains("true")) {
                additionalDiscountController.text =
                    "${double.parse(additionalDiscountController.text.isNotEmpty ? additionalDiscountController.text : "0") / 100 * totalAmount}";
              }
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

              //
              if (state.selectedItems.isNotEmpty &&
                  partyDetail != null &&
                  paymentModeController.text.isNotEmpty) {
                // ============== payment check
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
                } else {
                  transactionPurchaseInvoiceBloc.add(
                    TransactionPurchaseInvoiceCreateEvent(
                      bodyModel: InvoiceBodyModel(
                        shopId: UserConstants.currentShop!.shopId!,
                        date: dateTime,
                        time:
                            "${dateTime.hour}:${dateTime.minute}:${dateTime.second}",
                        // time: '',
                        recordType: 'purchase',
                        // partyId: 0,
                        partyId: partyDetail!.partyId ?? 0,
                        additionalCharges: 00,
                        additionalDiscount: double.parse(
                                additionalDiscountController.text.isNotEmpty
                                    ? additionalDiscountController.text
                                    : "0.0")
                            .toInt(),
                        amount: totalAmount.toInt(),
                        gstNo: 'GST123456789',
                        cashAmountReceived: cashAmountReceived.toInt(),
                        cashNotesReference: paymentModeSelectionKey
                                .currentState!
                                .cashNotesReferenceNoController
                                .text
                                .isEmpty
                            ? "N/A"
                            : paymentModeSelectionKey.currentState!
                                .cashNotesReferenceNoController.text,
                        onlineAmountReceived: onlineAmountReceived.toInt(),
                        onlineNotesReference: paymentModeSelectionKey
                                .currentState!
                                .onlineNotesReferenceNoController
                                .text
                                .isEmpty
                            ? "N/A"
                            : paymentModeSelectionKey.currentState!
                                .onlineNotesReferenceNoController.text,
                        // dueAmount: 0,
                        dueAmount: dueAmount.toInt(),
                        // dueDate : paymentModeSelectionKey.currentState!.dueDate,
                        creditAmount: creditAmount.toInt(),
                        invoiceBodyModelPurchaseItem: state.selectedItems,
                        invoiceBodyModelSaleItem: [],
                      ),
                    ),
                  );
                }
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
                        child: BillToWidgetPurchase(
                          transactionInvoiceBloc:
                              transactionPurchaseInvoiceBloc,
                          partyType: "Vendor",
                          addNew: "Vendor",
                        ),
                      ),
                      Visibility(
                          visible: partyDetail != null,
                          child: SelectedPartyDetailsPurchase(
                            partyDetail: partyDetail,
                            transactionInvoiceBloc:
                                transactionPurchaseInvoiceBloc,
                          )),
                      SelectItemsFromInventory(state.items,
                          transactionPurchaseInvoiceBloc:
                              transactionPurchaseInvoiceBloc),

                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          state.selectedItems.length,
                          (index) {
                            var currentBodyItem = state.selectedItems[index];
                            var currentMyListItem = state.items.firstWhere(
                                (element) =>
                                    element.itemId == currentBodyItem.itemId);
                            double totalDiscountPrice =
                                (currentBodyItem.purchasePrice.toDouble() *
                                    currentBodyItem.quantity);
                            // =======
                            if (count == 0) {
                              paymentModeSelectionKey.currentState!
                                  .totalAmount = totalDiscountPrice.toString();
                              totalAmountController.text =
                                  paymentModeSelectionKey
                                      .currentState!.totalAmount;
                            }
                            count++;

                            // =========
                            return SelectedItemDisplayTile(
                              quantity: currentBodyItem.quantity,
                              priceOfItem:
                                  currentBodyItem.purchasePrice.toDouble(),
                              itemName: currentMyListItem.itemName ?? "N/A",
                              priceAfterTax: (currentBodyItem.purchasePrice *
                                      currentBodyItem.quantity)
                                  .toDouble(),
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

// =======================

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
      TextEditingController(text: "0");
  TextEditingController cashNotesReferenceNoController =
      TextEditingController();
  TextEditingController sheetDueDateController = TextEditingController();
  TextEditingController onlineAmountReceivedController =
      TextEditingController(text: "0");
  TextEditingController onlineNotesReferenceNoController =
      TextEditingController();
  TextEditingController creditAmountReceivedController =
      TextEditingController(text: "0");
  TextEditingController creditNotesReferenceNoController =
      TextEditingController();
  Color unpaidLabelColor = Colors.red;
  Color multiMode = AppColors.textColorYellow;
  Color cashLabelColor = AppColors.textColorGreen;
  Color onlineLabelColor = Colors.purple;
  Color creditColor = AppColors.primaryP1;
  @override
  void initState() {
    // TODO: implement initState
    pMode = widget.paymentModeController.text;
    super.initState();
  }

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
                radioColor: unpaidLabelColor,
                groupValue: widget.paymentModeController.text,
              ),
              AppRadioButton(
                value: "cash",
                title: "Cash",
                radioColor: cashLabelColor,
                groupValue: widget.paymentModeController.text,
                onChanged: (p0) {
                  setState(() {
                    widget.paymentModeController.text = p0!;
                    pMode = p0;
                    onlineAmountReceivedController.text = "0";
                    onlineNotesReferenceNoController.clear();
                    creditAmountReceivedController.text = "0";
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
                    cashAmountReceivedController.text = "0";
                    cashNotesReferenceNoController.clear();
                    creditAmountReceivedController.text = "0";
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
                value: "credit",
                title: "Credit",
                radioColor: creditColor,
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
                      notesReferenceNoController:
                          cashNotesReferenceNoController,
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
                  // PaymentAmountHandler(
                  //     notesReferenceNoController:
                  //         creditNotesReferenceNoController,
                  //     amountReceivedController: creditAmountReceivedController,
                  //     label: "Credit",
                  //     paymentMode: "credit"),
                ],
              )),
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
                    context: context,
                    scrollControlDisabledMaxHeightRatio: 0.58,
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
                                Flexible(
                                  child: SheetDueDateBottomSheetRadioButton(
                                    groupValue: sheetDueDate,
                                    title: "7 Days",
                                    value: "7 days",
                                    onChanged: (p0) {
                                      sheetDueDate = p0!;
                                      sheetSetState(() {});
                                      // setState(() {});
                                    },
                                  ),
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

// ==================================================

class SelectItemsFromInventory extends StatefulWidget {
  const SelectItemsFromInventory(this.items,
      {super.key, required this.transactionPurchaseInvoiceBloc});
  final List<MyListDetailsData> items;
  final TransactionPurchaseInvoiceBloc transactionPurchaseInvoiceBloc;

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
            return ItemBottomSheetPurchase(
                items: widget.items,
                transactionPurchaseInvoiceBloc:
                    widget.transactionPurchaseInvoiceBloc);
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

/// =============================

// bill to
