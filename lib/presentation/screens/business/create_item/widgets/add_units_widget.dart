import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/presentation/widgets/form_fields/search_text_field.dart';

import '../../../../../application/business/business_create_item/business_create_item_bloc.dart';
import '../../../../../core/assets/svg_canvas/drum_item_details.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/styles/app_styles.dart';
import '../../../../widgets/button/common_primary_button_business.dart';
import '../../../../widgets/form_fields/normal_text_field.dart';
import 'item_details_card.dart';

class WidgetAddUnits extends StatefulWidget {
  final BusinessCreateItemBloc bloc;
  final BusinessCreateItemState state;

  const WidgetAddUnits({
    Key? key,
    required this.bloc,
    required this.state,
  }) : super(key: key);

  @override
  State<WidgetAddUnits> createState() => _WidgetAddUnitsState();
}

class _WidgetAddUnitsState extends State<WidgetAddUnits> {
  bool isUnitSelectionMode = false;
  bool isPurchaseUnitSelected = false;
  bool isSaleUnitSelected = false;
  Set<String> sellingUnits = {};
  Set<String> purchasingUnits = {};
  Set<String> dealingUnits = {};
  Set<String> allUnits = {};
  int count = 0;

  @override
  void initState() {
    super.initState();
    allUnits.addAll(itemUnitConstantsList);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (count == 0) {
      widget.state.purchasingUnits.isNotEmpty
          ? isPurchaseUnitSelected = true
          : {};
      sellingUnits.addAll(widget.state.sellingUnits);
      purchasingUnits.addAll(widget.state.purchasingUnits);
      dealingUnits.addAll(widget.state.sellingUnits);
      count++;
    }

    var dealingUnitList = dealingUnits.map((e) => e).toList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ============================  level one

        // ===================  selling and purchasing unit =======================
        Visibility(
          visible: isUnitSelectionMode == false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              ItemDetailCard(
                state: widget.state,
              ),
              20.verticalSpace,
              Text(
                "Help Us understand your Inventory",
                style: AppStyles.inter50015666060,
              ),
              5.verticalSpace,
              Text(
                "Select to choose Your Units from our set of units or add your own units , Help us understand the relation Between Your Purchase Unit and Selling Units .",
                style: AppStyles.inter50016242323,
              ),
              10.verticalSpace,
              //const Text("\nPurchasing unit"),
              Visibility(
                  visible: isPurchaseUnitSelected == false,
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          isUnitSelectionMode = !isUnitSelectionMode;
                          isPurchaseUnitSelected = false;
                          dealingUnits.clear();
                        });
                      },
                      child: Material(
                        elevation: 10,
                        shadowColor: Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(8.r),
                        child: Container(
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          decoration: BoxDecoration(
                            color: const Color(0xffDDEFFE).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            "+ Add purchasing Unit",
                            style: AppStyles.inter500150E4572,
                          ),
                        ),
                      ))),
              ListView.builder(
                itemCount: purchasingUnits.length,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      20.verticalSpace,
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(12.r),
                        shadowColor: Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 10.h),
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              CustomPaint(
                                size: Size(85.w, 100.h),
                                painter: DrumItemDetailsPainter(),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Select Purchasing Units",
                                          style: AppStyles.inter60015242323,
                                        ),
                                        Text(
                                          purchasingUnits.toList()[index],
                                          style: AppStyles.inter50015242323,
                                        ),
                                        Text(
                                          "Measure",
                                          style: AppStyles.inter500154F4C4C,
                                        ),
                                      ],
                                    ),
                                    10.verticalSpace,
                                    _addMoreSellingOrPurchasingUnit(
                                      onTap: () {
                                        setState(() {
                                          isUnitSelectionMode =
                                              !isUnitSelectionMode;
                                          isPurchaseUnitSelected = false;
                                          dealingUnits.clear();
                                          dealingUnits.add(
                                              purchasingUnits.toList()[index]);
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      20.h.verticalSpace,
                    ],
                  );
                },
              ),

              10.verticalSpace,
              //const Text("\nSelling units"),
              Visibility(
                  visible: isSaleUnitSelected == false,
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          isUnitSelectionMode = true;
                          isSaleUnitSelected = true;
                        });
                      },
                      child: Material(
                        elevation: 10,
                        shadowColor: Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(8.r),
                        child: Container(
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          decoration: BoxDecoration(
                            color: const Color(0xffDDEFFE).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            "+ Add selling Unit",
                            style: AppStyles.inter500150E4572,
                          ),
                        ),
                      ))),
              ListView.builder(
                itemCount: sellingUnits.length,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(12.r),
                    shadowColor: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 10.h),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          CustomPaint(
                            size: Size(85.w, 100.h),
                            painter: DrumItemDetailsPainter(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Select or Add Your Own \nSelling Unit",
                                      style: AppStyles.inter60015242323,
                                    ),
                                    Text(
                                      sellingUnits.toList()[index],
                                      style: AppStyles.inter50015242323,
                                    ),
                                  ],
                                ),
                                10.verticalSpace,
                                _addMoreSellingOrPurchasingUnit(
                                  onTap: () {
                                    setState(() {
                                      isUnitSelectionMode = true;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              20.verticalSpace,
              sellingUnits.isEmpty
                  ? const SizedBox.shrink()
                  : CommonPrimaryButton(
                      title: "Next",
                      onTap: () {
                        widget.bloc.add(
                            BusinessCreateItemAddSellingAndDealingUnitEvent(
                                sellingUnitList: sellingUnits.toList(),
                                purchasingUnitList: purchasingUnits.toList()));
                      },
                    ),
              30.verticalSpace,
            ],
          ),
        ),
        // ======== unit selection ====================
        Visibility(
            visible: isUnitSelectionMode,
            child: Column(
              children: [
                10.verticalSpace,
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          if (isPurchaseUnitSelected == false) {
                            purchasingUnits.clear();
                            dealingUnits.clear();
                          } else {
                            sellingUnits.clear();
                          }
                          isUnitSelectionMode = false;
                        });
                      },
                        child: Image.asset(
                      AppAssets.imageLeftArrow,
                      height: 25.h,
                      width: 30.w,
                      fit: BoxFit.fill,
                    )),
                    10.horizontalSpace,
                    Text(
                      "Select Purchase Unit",
                      style:
                          AppStyles.inter60015242323.copyWith(fontSize: 17.sp),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (isPurchaseUnitSelected == false) {
                              purchasingUnits.clear();
                              dealingUnits.clear();
                            } else {
                              sellingUnits.clear();
                            }
                            isUnitSelectionMode = false;
                          });
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 20,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isUnitSelectionMode = false;
                            if (isPurchaseUnitSelected == false) {
                              isPurchaseUnitSelected = true;
                              dealingUnits.clear();
                            } else {
                              sellingUnits.clear();
                              sellingUnits.addAll(dealingUnitList);
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 20,
                        )),
                  ],
                ),
                CreateItemSearchTextField(
                  hintText: "Search Units",
                  onChanged: (value) {
                    setState(() {
                      for (var element in itemUnitConstantsList) {
                        if (element.contains(value)) {
                          allUnits.add(element);
                        } else {
                          allUnits.remove(element);
                        }
                      }
                    });
                  },
                ),
                10.verticalSpace,
                // SearchBar(
                //   elevation: const MaterialStatePropertyAll(10),
                //   backgroundColor:const MaterialStatePropertyAll(Colors.white),
                //
                //   onChanged: (value) {
                //     setState(() {
                //       for (var element in itemUnitConstantsList) {
                //         if (element.contains(value)) {
                //           allUnits.add(element);
                //         }else{
                //           allUnits.remove(element);
                //         }
                //       }
                //     });
                //   },
                // ),
                SizedBox(
                  height: size.height * 0.7,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    // padding: EdgeInsets.all(20),
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    // primary: false,
                    childAspectRatio: 1,
                    children: List.generate(growable: false, allUnits.length,
                        (index) {
                      var unitName = allUnits.toList()[index];
                      return InkWell(
                        splashColor: Colors.green,
                        onTap: () async {
                          if (unitName.toLowerCase().contains("others")) {
                            TextEditingController otherUnitController =
                                TextEditingController();
                            await showDialog<void>(
                              context: context,
                              barrierDismissible: true,
                              // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Add your custom unit'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        NormalTextField(
                                          label: "Unit Name",
                                          controller: otherUnitController,
                                          isFilled: true,
                                        )
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        }),
                                    TextButton(
                                      child: const Text('Add'),
                                      onPressed: () {
                                        setState(() {
                                          // allUnits.toList().removeLast();
                                          allUnits.remove(unitName);
                                          dealingUnits
                                              .add(otherUnitController.text);
                                          allUnits
                                              .add(otherUnitController.text);
                                          allUnits.add("OTHERS");
                                          Navigator.of(context).pop();
                                        });
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            setState(() {
                              if (isPurchaseUnitSelected == false) {
                                purchasingUnits.clear();
                                purchasingUnits.add(unitName);
                                dealingUnits.clear();
                                dealingUnits.add(unitName);
                              } else {
                                dealingUnits.contains(unitName)
                                    ? dealingUnits.remove(unitName)
                                    : dealingUnits.add(unitName);
                              }
                            });
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(9.w),
                          child: Material(
                            elevation: 10,
                            shadowColor: Colors.blue.shade200,
                            borderRadius: BorderRadius.circular(20.r),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: const Color(0xffFBFBFB),
                                  borderRadius: BorderRadius.circular(20.r),
                                  gradient: dealingUnitList.contains(unitName)
                                      ? LinearGradient(
                                          begin: Alignment.bottomRight,
                                          colors: [
                                              const Color(0xff36BC20),
                                              const Color(0xff36BC20)
                                                  .withOpacity(0.5),
                                              Colors.white,
                                              Colors.white,
                                              Colors.white,
                                            ])
                                      : null,
                                  border: dealingUnitList.contains(unitName)
                                      ? Border.all(
                                          width: 4,
                                          color: const Color(0xff1EA72C))
                                      : Border.all(
                                          width: 2, color: Colors.white)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Text(
                                  //   "${dealingUnitList.contains(unitName) ? dealingUnitList.indexOf(unitName) + 1 : ""}",
                                  //   // "dealing unit",
                                  // ),
                                  Text(
                                    unitName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: dealingUnits.contains(unitName)
                                            ? Colors.green
                                            : null),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ))
      ],
    );
    //   ),
    // );
  }
}

Widget _addMoreSellingOrPurchasingUnit({VoidCallback? onTap}) {
  return InkWell(
    splashFactory: NoSplash.splashFactory,
    onTap: onTap,
    child: Row(
      children: [
        Flexible(
          child: InkWell(
            onTap: onTap,
            child: Material(
              elevation: 5,
              shadowColor: Colors.blue,
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  color: const Color(0xff0E4572),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: FittedBox(
                    child: Row(
                      children: [
                        Image.asset(
                          AppAssets.imageAddTaskIcon,
                          height: 13.h,
                          width: 13.w,
                          fit: BoxFit.fill,
                        ),
                        5.horizontalSpace,
                        Text(
                          "Select",
                          style: AppStyles.inter16600T1.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 13.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        10.w.horizontalSpace,
        Flexible(
          child: InkWell(
            onTap: onTap,
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(8.r),
              shadowColor: Colors.blue.shade100,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                decoration: BoxDecoration(
                  color: const Color(0xffDDEFFE).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      size: 20,
                    ),
                    FittedBox(
                      child: Text(
                        " Add",
                        style: AppStyles.inter16600T1.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          color: const Color(0xff0E4572),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        10.w.horizontalSpace,
        Flexible(
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 9.h),
              decoration: BoxDecoration(
                color: const Color(0xffDDEFFE).withOpacity(0.6),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.edit_rounded),
                  FittedBox(
                    child: Text(
                      " Edit",
                      style: AppStyles.inter16600T1.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff0E4572),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
