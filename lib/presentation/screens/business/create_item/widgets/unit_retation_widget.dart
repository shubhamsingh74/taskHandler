// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';

import '../../../../../application/business/business_create_item/business_create_item_bloc.dart';
import '../../../../widgets/button/common_primary_button_business.dart';
import 'item_details_card.dart';

class UnitRelationWidget extends StatefulWidget {
  final BusinessCreateItemBloc businessCreateItemBloc;
  final BusinessCreateItemState state;
  const UnitRelationWidget({
    Key? key,
    required this.businessCreateItemBloc,
    required this.state,
  }) : super(key: key);

  @override
  State<UnitRelationWidget> createState() => _UnitRelationWidgetState();
}

class _UnitRelationWidgetState extends State<UnitRelationWidget> {
  List<Material> conversionWidget = [];
  List<TextEditingController> purchaseUnitQuantityControllerList = [];
  List<TextEditingController> sellingUnitQuantityControllerList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Material quantityTakingUnit(
      {required Size size,
      required String sellingUnit,
      required String purchasingUnit}) {
    TextEditingController purchasingQuantityController =
        TextEditingController();
    TextEditingController sellingQuantityController = TextEditingController();
    purchaseUnitQuantityControllerList.add(purchasingQuantityController);
    sellingUnitQuantityControllerList.add(sellingQuantityController);
    return Material(
      elevation: 10,
      color: Colors.white,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(15.r),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("For $sellingUnit"),
              20.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                      child: NormalTextField(
                    controller: sellingQuantityController,
                    label: "Quantity",
                  )),
                  2.w.horizontalSpace,
                  SizedBox(
                    width: size.width * 0.15,
                    child: Text(sellingUnit),
                  ),
                  5.w.horizontalSpace,
                  Text(
                    "in",
                    style: AppStyles.inter14500T5.copyWith(color: Colors.black),
                  ),
                  5.w.horizontalSpace,
                  Flexible(
                    child: NormalTextField(
                      controller: purchasingQuantityController,
                      label: "Quantity",
                    ),
                  ),
                  5.w.horizontalSpace,
                  SizedBox(
                    width: size.width * 0.15,
                    child: Text(purchasingUnit),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    conversionWidget.clear();
    purchaseUnitQuantityControllerList.clear();
    sellingUnitQuantityControllerList.clear();
    for (var element in widget.state.sellingUnits) {
      conversionWidget.add(quantityTakingUnit(
          size: size,
          sellingUnit: element,
          purchasingUnit: widget.state.purchasingUnits.first));
    }
    conversionWidget.length.toString().log("length");
    return Column(
      children: [
        20.h.verticalSpace,
        ItemDetailCard(
          state: widget.state,
        ),
        15.verticalSpace,
        Text(
          "Define the relation between your selling and purchase units",
          style: AppStyles.inter16600T1,
        ),
        //
        30.h.verticalSpace,
        IconButton(
            onPressed: () {
              widget.businessCreateItemBloc
                  .add(BusinessCreateItemEditUnitEvent());
            },
            icon: Icon(Icons.edit)),
        30.h.verticalSpace,
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: conversionWidget.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                conversionWidget[index],
                20.h.verticalSpace,
              ],
            );
          },
        ),
        CommonPrimaryButton(
          margin: const EdgeInsets.all(0).copyWith(
            bottom: 20.h,
          ),
          title: "Next",
          onTap: () {
            List<double> sellingQuantity = [];
            List<double> purchasingQuantity = [];
            for (var i = 0; i < sellingUnitQuantityControllerList.length; i++) {
              // ("selling:${sellingUnitQuantityControllerList[i].text} purchasing:${purchaseUnitQuantityControllerList[i].text}")
              //     .toString()
              //     .log("quantity");
              sellingQuantity
                  .add(double.parse(sellingUnitQuantityControllerList[i].text));
              purchasingQuantity.add(
                  double.parse(purchaseUnitQuantityControllerList[i].text));
            }
            widget.businessCreateItemBloc.add(
                BusinessCreateItemAddConversionFactorsListEvent(
                    purchasingQuantity: purchasingQuantity,
                    sellingQuantity: sellingQuantity));
          },
        ),
      ],
    );
  }
}
