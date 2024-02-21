import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../application/business/business_create_item/business_create_item_bloc.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/styles/app_styles.dart';
import '../../../../widgets/button/common_primary_button_business.dart';
import '../../../../widgets/form_fields/normal_text_field.dart';
import '../../../../widgets/normal_dropdown/normal_dropdown.dart';
import 'item_details_card.dart';

class WidgetAddLots extends StatefulWidget {
  final BusinessCreateItemBloc bloc;
  final BusinessCreateItemState state;

  const WidgetAddLots({
    Key? key,
    required this.bloc,
    required this.state,
  }) : super(key: key);

  @override
  State<WidgetAddLots> createState() => _WidgetAddLotsState();
}

class _WidgetAddLotsState extends State<WidgetAddLots> {
  List<LotDetailsModel> savedLotsList = [];
  Column? lotDetailsWidget;

  Column createLotDetails(
      {required List<LotDetailsModel> savedLotsList,
      required Size size,
      int? index}) {
    LotDetailsModel? lotDetail;
    index != null ? lotDetail = savedLotsList[index] : null;
    final TextEditingController dateController =
        TextEditingController(text: lotDetail?.dateOfPurchase);
    final TextEditingController purchasePriceController =
        TextEditingController(text: lotDetail?.purchasePriceOfItem.toString());
    final TextEditingController unitOfLotController =
        TextEditingController(text: lotDetail?.unit);
    final TextEditingController quantityOfLotController =
        TextEditingController(text: lotDetail?.qtyOfLot.toString());
    final TextEditingController mrpItemController =
        TextEditingController(text: lotDetail?.mrpOfItem.toString());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Do you have previous lots of same item?",
          style: AppStyles.inter60015242323
              .copyWith(fontSize: 20.sp, color: const Color(0xff494747)),
        ),
        5.h.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20.h,
              width: 20.w,
              decoration: BoxDecoration(
                color: const Color(0xffDDEFFE),
                borderRadius: BorderRadius.circular(2.r)
              ),
            ),
            10.horizontalSpace,
            Text("Is the Item Perishable?",style: AppStyles.inter500154B4A4A.copyWith(color: const Color(0xff4F4C4C)))
          ],
        ),
        5.h.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${lotDetail != null ? "Edit" : "Add"} Details for Lot ${lotDetail != null ? index! + 1 : savedLotsList.length + 1}",
              style: AppStyles.lotsTitle,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    lotDetailsWidget = null;
                  });
                },
                icon: const Icon(Icons.close))
          ],
        ),
        Text(
          "Lot ${lotDetail != null ? index! + 1 : savedLotsList.length + 1}",
          style: AppStyles.lotsTitle,
        ),
        20.h.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date of purchase",
                  style: AppStyles.lotsSubTitle,
                ),
                2.h.verticalSpace,
                InkWell(
                  onTap: () async {
                    DateTime? date = await showDatePicker(
                      context: context,
                      firstDate: DateTime.utc(2020),
                      lastDate: DateTime.utc(2040),
                    );
                    dateController.text = date.toString().substring(0, 10);
                  },
                  child: SizedBox(
                    width: size.width * 0.5,
                    height: 60.h,
                    child: NormalTextField(
                      borderColor: Colors.transparent,
                      enabled: false,
                      isFilled: true,
                      // label: "date",
                      hintText: "DD/MM/YYYY",
                      controller: dateController,
                      suffix:const Icon(Icons.calendar_today_outlined),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.35,
                  child: FittedBox(
                    child: Text(
                      "Purchase Price/Unit",
                      // "Purchase Price/Item",
                      style: AppStyles.lotsSubTitle
                          .copyWith(fontSize: size.width * 0.05),
                    ),
                  ),
                ),
                2.h.verticalSpace,
                SizedBox(
                  width: size.width * 0.38,
                  height: 60.h,
                  child: NormalTextField(
                    inputType: TextInputType.number,
                    // fillColor: AppColors.itemtextfieldColor,
                    isFilled: true,
                    // label: "Add Purchase Price/Item",
                    hintText: "Add Price",
                    controller: purchasePriceController,
                  ),
                ),
              ],
            )
          ],
        ),
        20.h.verticalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Unit",
              style: AppStyles.lotsSubTitle,
            ),
            2.verticalSpace,
            NormalDropDown(
              fillcolor: AppColors.itemtextfieldColor,
              // height: 50,
              // width: double.maxFinite,
              width: 0.90.sw,
              // width: size.width,
              hintText: "Select Unit",
              onSelected: (unit) {
                unitOfLotController.text = unit.toString();
              },
              entries: widget.state.conversionUnitList
                  .map((e) => DropdownMenuEntry(value: e, label: e))
                  .toList(),
            ),
          ],
        ),
        20.h.verticalSpace,
        Text(
          "Quantity of Lot",
          style: AppStyles.lotsSubTitle,
        ),
        2.verticalSpace,
        NormalTextField(
          inputType: TextInputType.number,
          isFilled: true,
          label: "Add Quantity of lot",
          hintText: "Add Quantity of lot",
          controller: quantityOfLotController,
        ),
        20.h.verticalSpace,
        Text(
          "MRP/Unit",
          style: AppStyles.lotsSubTitle,
        ),
        2.h.verticalSpace,
        NormalTextField(
          inputType: TextInputType.number,
          isFilled: true,
          // label: "Add MRP/Item",
          hintText: "Add MRP/Unit",
          // hintText: "Add MRP/Item",
          controller: mrpItemController,
        ),
        15.verticalSpace,
        CommonPrimaryButton(
          title: "Save Lot",
          onTap: () {
            setState(() {
              LotDetailsModel data;
              lotDetail == null
                  ? savedLotsList.add(LotDetailsModel(
                      dateOfPurchase: dateController.text,
                      purchasePriceOfItem:
                          double.parse(purchasePriceController.text),
                      unit: unitOfLotController.text,
                      qtyOfLot: int.parse(quantityOfLotController.text),
                      mrpOfItem: double.parse(mrpItemController.text)))
                  : {
                      data = LotDetailsModel(
                          dateOfPurchase: dateController.text,
                          purchasePriceOfItem:
                              double.parse(purchasePriceController.text),
                          unit: unitOfLotController.text,
                          qtyOfLot: int.parse(quantityOfLotController.text),
                          mrpOfItem: double.parse(mrpItemController.text)),
                      savedLotsList.removeAt(index!),
                      savedLotsList.insert(index, data)
                    };
              lotDetailsWidget = null;
            });
          },
        ),
        15.h.verticalSpace,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpace,
        ItemDetailCard(
          state: widget.state,
        ),
        15.verticalSpace,
        // lot details
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: savedLotsList.length,
          itemBuilder: (context, index) {
            var data = savedLotsList[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: _lotDetailsViewTile(
                data: data,
                lotNo: index + 1,
                onTapEdit: () {
                  setState(() {
                    lotDetailsWidget = createLotDetails(
                        savedLotsList: savedLotsList, size: size, index: index);
                  });
                },
              ),
            );
          },
        ),
        15.verticalSpace,
        lotDetailsWidget == null
            ? const SizedBox.shrink()
            : lotDetailsWidget as Widget,

        lotDetailsWidget != null
            ? const SizedBox.shrink()
            : InkWell(
                onTap: () {
                  setState(() {
                    lotDetailsWidget = null;
                    lotDetailsWidget = createLotDetails(
                        savedLotsList: savedLotsList, size: size);
                  });
                },
                child: Material(
                  elevation: 10,
                  shadowColor: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(8.r),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    decoration: BoxDecoration(
                        color: const Color(0xffDDEFFE),
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Text(
                      "+ Add ${savedLotsList.isEmpty ? "" : "Another"}Lot",
                      style: AppStyles.inter14500T5.copyWith(
                          color: const Color(0xff0E4572), fontSize: 16.sp),
                    ),
                  ),
                ),
              ),
        40.h.verticalSpace,
        savedLotsList.isEmpty
            ? const SizedBox.shrink()
            : CommonPrimaryButton(
                title: "Next",
                onTap: () {
                  widget.bloc.add(BusinessCreateItemAddLotDataEvent(
                      lotData: savedLotsList));
                  // context.router.push(RouteCreateItemSuccess(
                  //     bloc: widget.bloc, state: widget.state));
                },
              ),
        50.h.verticalSpace,
        // AppPrimaryButton(onTap: () {,
        // },)
      ],
    );
    //   ),
    // );
  }
}

Widget _lotDetailsViewTile({
  required LotDetailsModel data,
  required int lotNo,
  required VoidCallback onTapEdit,
}) {
  return Material(
    elevation: 10,
    color: Colors.white,
    shadowColor: Colors.grey,
    borderRadius: BorderRadius.circular(15.r),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Lot $lotNo", style: AppStyles.lotsTitle),
                  5.verticalSpace,
                  Text(data.dateOfPurchase, style: AppStyles.addunitsSubTitle),
                  5.verticalSpace,
                ],
              ),
              InkWell(
                onTap: onTapEdit,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                  decoration: BoxDecoration(
                      color: Color(0xffDDEFFE),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Center(
                      child: Row(
                    children: [
                      const Icon(Icons.edit_outlined),
                      Text(
                        " Edit",
                        style: AppStyles.inter14500T5.copyWith(
                            color: Color(0xff0E4572), fontSize: 16.sp),
                      ),
                    ],
                  )),
                ),
              ),
            ],
          ),
          Text("${data.unit} | ${data.qtyOfLot}"),
          5.h.verticalSpace,
          Text(
              "${data.purchasePriceOfItem} Rs/${data.unit} | ${data.mrpOfItem} Rs/${data.unit} MRP")
        ],
      ),
    ),
  );
}

class LotDetailsModel {
  String dateOfPurchase;
  double purchasePriceOfItem;
  String unit;
  int qtyOfLot;
  double mrpOfItem;

  LotDetailsModel({
    required this.dateOfPurchase,
    required this.purchasePriceOfItem,
    required this.unit,
    required this.qtyOfLot,
    required this.mrpOfItem,
  });

  Map<String, dynamic> toJson() {
    return {
      "quantity": qtyOfLot,
      "mrp": mrpOfItem,
      "date": dateOfPurchase,
      "unit": unit,
      "purchase_price": purchasePriceOfItem,
    };
  }
}
