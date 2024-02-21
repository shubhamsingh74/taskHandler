// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/constants/constants.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/core/utils/utils.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/button/bottom_navigation_bar.dart';
import 'package:quickprism/presentation/widgets/color_tab_bar/color_tab_bar.dart';
import 'package:quickprism/presentation/widgets/error_widget/error_widget.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';
import 'package:quickprism/presentation/widgets/normal_dropdown/normal_dropdown.dart';
import 'package:quickprism/presentation/widgets/svg_icon_widget/svg_icon_widget.dart';
import '../../../../application/business/business_create_item/business_create_item_bloc.dart';
import '../../../../domain/core/di/injectable.dart';
import 'widgets/check_box.dart';

@RoutePage()
class ScreenCreateItemNew extends StatefulWidget {
  const ScreenCreateItemNew({super.key});

  @override
  State<ScreenCreateItemNew> createState() => _ScreenCreateItemNewState();
}

class _ScreenCreateItemNewState extends State<ScreenCreateItemNew>
    with TickerProviderStateMixin {
  final createItemBloc = getIt<BusinessCreateItemBloc>();
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    createItemBloc
        .add(BusinessCreateNewItemInitialEvent( ));
     tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: BlocConsumer<BusinessCreateItemBloc, BusinessCreateItemState>(
          bloc: createItemBloc,
          listener: (context, state) {
            if (state is BusinessCreateItemSuccessState) {
              context.router.popAndPush(
                  RouteCreateItemSuccess(bloc: createItemBloc, state: state));
            }
          },
          builder: (context, state) {
            if (state is BusinessCreateItemLoadingState) {
              return const Scaffold(
                body: AppLoadingWidget(),
              );
            }
            if (state is BusinessCreateItemErrorState) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                ),
                body: const AppErrorWidget(message: "Something went wrong"),
              );
            }
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    customAppBar(context: context),
                    15.verticalSpace,
                     
                      Text("delete this"),
                        // ColoredTabBar(
                        //     color: Colors.transparent,
                        //     tabBar: TabBar(
                        //       splashFactory: NoSplash.splashFactory,
                        //       controller:  tabController,
                        //       // controller:  tabController,
                        //       tabAlignment: TabAlignment.start,
                        //       physics: const BouncingScrollPhysics(),
                        //       isScrollable: true,
                        //       indicatorColor: AppColors.white,
                        //       onTap: (value) {
                        //         // TabBarTheme;
                        //       },
                        //       tabs: [
                        //         // Tab(
                        //         //   text: "Item Details",
                        //         // ),
                        //         _tabBarItemContainer(
                        //             title: "Item Details",
                        //             isCurrent: tabController.index == 0),
                        //         //   Padding(
                        //         //   padding: EdgeInsets.only(right: 15),
                        //         //   child: Tab(
                        //         //     text: "Add Units",
                        //         //   ),
                        //         // ),
                        //         _tabBarItemContainer(
                        //             title: "Add Units",
                        //             isCurrent: tabController.index == 1),
                        //         _tabBarItemContainer(
                        //             title: "Add Lot",
                        //             isCurrent: tabController.index == 2),
                        //         //   Tab(
                        //         //   text: "Add Units",
                        //         // ),
                        //       ],
                        //     ),
                        //   ),
                    // Expanded(
                    //   child:
                    //       //
                    //       tabController == null
                    //       tabController == null
                    //           ? const SizedBox.shrink()
                    //           : TabBarView(
                    //               controller:  tabController,
                    //               controller:  tabController,
                    //               children: [
                    //                   WidgetItemDetails(
                    //                       businessCreateItemBloc:
                    //                           createItemBloc,
                    //                       state: state),
                    //                   // WidgetAddUnits(
                    //                   //   bloc: createItemBloc,
                    //                   //   state: state,
                    //                   // ),
                    //                   // WidgetAddLots(
                    //                   //   bloc: createItemBloc,
                    //                   //   state: state,
                    //                   // ),
                    //                 ]),
                    // ),
                    10.verticalSpace,
                  ],
                ),
              ),
            );
          },
        ));
  }
}

///-------appbar for this screen.
Widget customAppBar({required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      AppSvgIconWidget(
        iconPath: AppAssets.iconsBack,
        size: 45,
        onTap: () {
          context.router.back();
        },
      ),
      10.horizontalSpace,
      Text(
        "Create Item",
        style: AppStyles.createITemTitleSTyle,
      ),
      const Spacer(),
      InkWell(
        splashFactory: NoSplash.splashFactory,
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppColors.itemstoreColor2, width: 1)),
          child: Row(
            children: [
              const AppSvgIconWidget(
                iconPath: AppAssets.storeIcon,
                size: 15,
                color: AppColors.storeColor1,
              ),
              Text(
                "Store1",
                style: AppStyles.storeTitle,
              ),
              5.horizontalSpace,
              const AppSvgIconWidget(
                iconPath: AppAssets.iconsDown,
                size: 10,
              )
            ],
          ),
        ),
      ),
      7.horizontalSpace,
      InkWell(
          onTap: () {},
          splashFactory: NoSplash.splashFactory,
          child: Image.asset(
            AppAssets.iconsSettings,
            height: 24,
            width: 24,
          )),
      // AppSvgIconWidget(
      //   onTap: () {},
      //   iconPath: AppAssets.iconsSetting,
      //   size: 24,
      //   color: Colors.black45,
      // )
    ],
  );
}

///---custom Tabbar screens.

//-----ItemDetails widgets
class WidgetItemDetails extends StatefulWidget {
  BusinessCreateItemBloc businessCreateItemBloc;
  BusinessCreateItemState state;
  WidgetItemDetails({
    Key? key,
    required this.businessCreateItemBloc,
    required this.state,
  }) : super(key: key);

  @override
  State<WidgetItemDetails> createState() => _WidgetItemDetailsState();
}

class _WidgetItemDetailsState extends State<WidgetItemDetails>
    with AutomaticKeepAliveClientMixin<WidgetItemDetails> {
  final TextEditingController _itemCodeController = TextEditingController();

  final TextEditingController _itemBrandController = TextEditingController();

  final TextEditingController _itemHsnSacController = TextEditingController();

  final TextEditingController _itemNameController = TextEditingController();

  int categoryId = 0;

  String categoryName = "";

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // _itemCodeController.text = state.code.toString();
    // _itemBrandController.text = state.brand;
    // _itemHsnSacController.text = state.hsnSecCode.toString();
    // _itemNameController.text = state.name;
    return Scaffold(
      bottomNavigationBar: ButtonBottomNavigationBar(
        title: "Next",
        onTap: () {
          widget.businessCreateItemBloc.add(
              BusinessCreateItemSaveItemDetailsEvent(
                  code: int.parse(_itemCodeController.text),
                  category: categoryName,
                  categoryId: categoryId,
                  brand: _itemBrandController.text,
                  hsnSecCode: int.parse(_itemHsnSacController.text),
                  name: _itemNameController.text));
          // widget.state.tabController?.animateTo(1);
          // widget.state.tabController?.animateTo(1);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientProgressBar(
                  backgroundColor: Colors.grey,
                  percent: 26,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF0D94A7),
                      Color(0xFF117ADB),
                      Color(0xFF75C68FE),
                    ],
                    stops: [
                      0.2,
                      0.8,
                      0.2,
                    ],
                  )),
              15.verticalSpace,
              Material(
                elevation: 10,
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Scan Item Code",
                        style: AppStyles.TabTextStyle,
                      ),
                      6.verticalSpace,
                      Image.asset(
                        AppAssets.imageCamera,
                        height: 64,
                        width: 64,
                      ),
                      25.verticalSpace,
                      NormalTextField(
                        label: "Item Code*",
                        hintText: "Item Code*",
                        controller: _itemCodeController,
                        inputType: TextInputType.number,
                        prefix: const AppSvgIconWidget(
                          iconPath: AppAssets.barCode,
                          color: AppColors.primaryP2,
                        ),
                        borderColor: AppColors.primaryP2,
                        suffix: Text(
                          'Assign QuickSKU   ',
                          style: AppStyles.styleInter14500T7.copyWith(
                            fontSize: 12.sp,
                            height: 4,
                          ),
                        ),
                      ),
                      5.h.verticalSpace,
                    ],
                  ),
                ),
              ),
              15.h.verticalSpace,
              Text(
                "Item category*",
                style: AppStyles.itemTabColor,
              ),
              2.h.verticalSpace,
              NormalDropDown(
                fillcolor: AppColors.textFieldFilledColor,
                // height: 50,
                hintText: "Select Item Category",
                onSelected: (categoriesInfoDatum) {
                  categoryId = categoriesInfoDatum.categoryId ?? -1;
                  categoryName = categoriesInfoDatum.name ?? "N/A";
                },
                entries: widget.state.categoriesList
                    .map((e) =>
                        DropdownMenuEntry(value: e, label: e.name ?? "N/A"))
                    .toList(),
                // entries: [],
              ),
              8.h.verticalSpace,
              Text(
                "Item brand",
                style: AppStyles.itemTabColor,
              ),
              2.h.verticalSpace,
              NormalTextField(
                isFilled: true,
                label: "Add Item brand",
                hintText: "Add Item brand",
                controller: _itemBrandController,
              ),
              8.h.verticalSpace,
              Text(
                "HSN/SAC code*",
                style: AppStyles.itemTabColor,
              ),
              2.h.verticalSpace,
              NormalTextField(
                isFilled: true,
                label: "HSN/SAC code*",
                hintText: "HSN/SAC code*",
                inputType: TextInputType.number,
                controller: _itemHsnSacController,
                suffix: const Icon(Icons.search),
              ),
              8.h.verticalSpace,
              Text(
                "Item Name",
                style: AppStyles.itemTabColor,
              ),
              2.h.verticalSpace,
              NormalTextField(
                isFilled: true,
                label: "Add Item name",
                hintText: "Add Item name",
                controller: _itemNameController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

//-----Add units widget


// class WidgetAddUnits extends StatefulWidget {
//   BusinessCreateItemBloc bloc;
//   BusinessCreateItemState state;
//   WidgetAddUnits({
//     Key? key,
//     required this.bloc,
//     required this.state,
//   }) : super(key: key);

//   @override
//   State<WidgetAddUnits> createState() => _WidgetAddUnitsState();
// }

// class _WidgetAddUnitsState extends State<WidgetAddUnits> {
//   List<String> sellingUnits = [];
//   List<String> purchasingUnits = [];
//   Set<String> dealingUnits = {};
//   // List<String> dealingUnits = [];
//   List<SizedBox> quantityWidgetList = [];
//   List<TextEditingController> quantityControllerList = [];
//   // final unitConversionFactorsKey =
//   //     GlobalKey<_CustomUnitRelationshipAndConversionState>();

//   SizedBox createQuantityWidget(Size size) {
//     TextEditingController quantityController = TextEditingController();
//     quantityControllerList.add(quantityController);
//     return SizedBox(
//       width: size.width * 0.7,
//       child: NormalTextField(
//         isFilled: true,
//         label: "Quantity",
//         controller: quantityController,
//         inputType: TextInputType.number,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       bottomNavigationBar: ButtonBottomNavigationBar(
//         // margin: EdgeInsets.zero,
//         // padding: EdgeInsets.zero,
//         title: "Next",
//         onTap: () {
//           // unitConversionFactorsKey
//           // if (widget.state.levelOfAddUnits == 1) {
//           //   widget.bloc.add(BusinessCreateItemAddSellingAndPurchasingUnitEvent(
//           //       sellingUnitList: sellingUnits,
//           //       purchasingUnitList: purchasingUnits));
//           // } else {
//           //   bool isAllConversionDone = true;
//           //   // unitConversionFactorsKey.currentState
//           //   for (var i in unitConversionFactorsKey
//           //       .currentState!.unitConversionFactorList) {
//           //     if (i.text.isEmpty) {
//           //       isAllConversionDone = false;
//           //       break;
//           //     }
//           //   }
//           //   if (isAllConversionDone == true) {
//           //     widget.bloc.add(
//           //       BusinessCreateItemAddConversionFactorsListEvent(
//           //         conversionFactorList: unitConversionFactorsKey
//           //             .currentState!.unitConversionFactorList,
//           //       ),
//           //     );
//           //     widget.state.tabController!.animateTo(2);
//           //   } else {
//           //     Utils.errorToast(context, "Complete all conversions");
//           //   }
//           // }
//           dealingUnits.toList().toString().log("dealing units");
//           purchasingUnits.toString().log("pur Units");
//           sellingUnits.toString().log("sel Units");
//           quantityControllerList.forEach((element) {
//             element.text.log("");
//             if(sellingUnits.isEmpty){
//               Utils.successToast(context, "No selling unit selected");
//             }
//           });
//         },
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             GradientProgressBar(
//                 backgroundColor: Colors.grey,
//                 percent: 66,
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color(0xFF0D94A7),
//                     Color(0xFF117ADB),
//                     Color(0xFF75C68FE),
//                   ],
//                   stops: [
//                     0.2,
//                     0.8,
//                     0.2,
//                   ],
//                 )),
//             15.verticalSpace,
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 5.w),
//               child: 
// Material(
//                 elevation: 10,
//                 color: Colors.white,
//                 shadowColor: Colors.grey,
//                 borderRadius: BorderRadius.circular(15.r),
//                 child: Padding(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(widget.state.name,
//                                   style: AppStyles.addunitsTitle),
//                               7.horizontalSpace,
//                               Text("HSN/SAC Code : ${widget.state.hsnSecCode}",
//                                   style: AppStyles.addunitsSubTitle),
//                             ],
//                           ),
//                           2.verticalSpace,
//                           Text("Item code : ${widget.state.code}",
//                               style: AppStyles.addunitsSubTitle),
//                           2.verticalSpace,
//                           Text("Category : ${widget.state.category}",
//                               style: AppStyles.addunitsSubTitle),
//                           2.verticalSpace,
//                           Text("Brand : ${widget.state.brand}",
//                               style: AppStyles.addunitsSubTitle),
//                           2.verticalSpace,
//                         ],
//                       ),
//                       const Spacer(),
//                       InkWell(
//                         splashFactory: NoSplash.splashFactory,
//                         onTap: () {},
//                         child: Image.asset(
//                           AppAssets.iconsBarCode,
//                           height: 52,
//                           width: 50,
//                         ),
//                       ),
//                       5.horizontalSpace,
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             //  customUnitRelationWidgets(),
//             // ============================  level one
//             15.verticalSpace,
//             // ===================  selling and purchasing unit =======================
//             Visibility(
//               visible: widget.state.levelOfAddUnits == 1,
//               child: Column(
//                 children: [
//                   Center(
//                       child: Text(
//                     "How do you manage your inventory?",
//                     style: AppStyles.addunitsTitleInventory,
//                   )),
//                   20.verticalSpace,
//                   ListView.builder(
//                     itemCount: dealingUnits.length,
//                     primary: false,
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) {
//                       var data = dealingUnits.map((e) => e).toList();
//                       // print(data);
//                       return Column(
//                         children: [
//                           20.verticalSpace,
//                           Material(
//                             elevation: 7,
//                             borderRadius: BorderRadius.circular(10.r),
//                             shadowColor: Colors.blue,
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 16.w, vertical: 10.h),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(data[index]),
//                                       CustomPaint(
//                                         size: Size(84.w, 98.h),
//                                         painter: RPSCustomPainter(),
//                                       )
//                                     ],
//                                   ),
//                                   Wrap(
//                                     children: [
//                                       MyRoundCheckBox(
//                                         border: Border.all(
//                                             width: 0,
//                                             color: Colors.transparent),
//                                         uncheckedColor: const Color(0xffDDEFFE),
//                                         isRound: false,
//                                         size: 25.sp,
//                                         onTap: (p0) {
//                                           if (p0!) {
//                                             sellingUnits.add(data[index]);
//                                           } else {
//                                             sellingUnits.remove(data[index]);
//                                           }
//                                         },
//                                       ),
//                                       const Text(" Selling Unit")
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           20.h.verticalSpace,
//                           Visibility(
//                             visible: index < dealingUnits.length - 1,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 // const Icon(
//                                 //   Icons.arrow_downward,
//                                 //   size: 80,
//                                 //   color: Colors.green,
//                                 // ),
//                                 Container(
//                                   height: 70,
//                                   width: 5,
//                                   decoration: const BoxDecoration(
//                                     color: Color(0xff1790F1),
//                                   ),
//                                 ),
//                                 quantityWidgetList[index],
//                               ],
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                   10.verticalSpace,
//                   _addMoreSellingOrPurchasingUnit(
//                     onTap: () async {
//                       await showDialog(
//                         barrierDismissible: false,
//                         context: context,
//                         builder: (context) {
//                           return StatefulBuilder(
//                             builder: (context, dialogSetState) {
//                               var dealingUnitList =
//                                   dealingUnits.map((e) => e).toList();
//                               return Column(
//                                 children: [
//                                   Container(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10.w),
//                                     color: Colors.white,
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         IconButton(
//                                             onPressed: () {
//                                               setState(() {
//                                                 purchasingUnits.clear();
//                                                 sellingUnits.clear();
//                                                 dealingUnits.clear();
//                                                 quantityControllerList.clear();
//                                                 context.popRoute();
//                                               });
//                                             },
//                                             icon: const Icon(
//                                               Icons.close,
//                                               color: Colors.red,
//                                               size: 20,
//                                             )),
//                                         IconButton(
//                                             onPressed: () {
//                                               setState(() {
//                                                 quantityWidgetList.clear();
//                                                 quantityControllerList.clear();
//                                                 for (int i = 0;
//                                                     i < dealingUnits.length;
//                                                     i++) {
//                                                   quantityWidgetList.add(
//                                                       createQuantityWidget(
//                                                           size));
//                                                 }
//                                                 context.popRoute();
//                                               });
//                                             },
//                                             icon: const Icon(
//                                               Icons.check,
//                                               color: Colors.green,
//                                               size: 20,
//                                             )),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: size.height * 0.8,
//                                     // width: 200,
//                                     child: GridView.count(
//                                       crossAxisCount: 3,
//                                       crossAxisSpacing: 4.0,
//                                       mainAxisSpacing: 8.0,
//                                       shrinkWrap: true,
//                                       childAspectRatio: 1,
//                                       children: List.generate(
//                                           growable: false,
//                                           itemUnitConstantsList.length,
//                                           (index) {
//                                         var unitName =
//                                             itemUnitConstantsList[index];
//                                         return Material(
//                                           // height: 30,
//                                           child: InkWell(
//                                             // splashColor: C,
//                                             onTap: () async {
//                                               if (unitName
//                                                   .toLowerCase()
//                                                   .contains("others")) {
//                                                 TextEditingController
//                                                     otherUnitController =
//                                                     TextEditingController();
//                                                 await showDialog<void>(
//                                                   context: context,
//                                                   barrierDismissible:
//                                                       true, // user must tap button!
//                                                   builder:
//                                                       (BuildContext context) {
//                                                     return AlertDialog(
//                                                       title: const Text(
//                                                           'Add your custom unit'),
//                                                       content:
//                                                           SingleChildScrollView(
//                                                         child: ListBody(
//                                                           children: <Widget>[
//                                                             NormalTextField(
//                                                               label:
//                                                                   "Unit Name",
//                                                               controller:
//                                                                   otherUnitController,
//                                                               isFilled: true,
//                                                             )
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       actions: <Widget>[
//                                                         TextButton(
//                                                             child: const Text(
//                                                                 'Cancel'),
//                                                             onPressed: () {
//                                                               Navigator.of(
//                                                                       context)
//                                                                   .pop();
//                                                             }),
//                                                         TextButton(
//                                                           child:
//                                                               const Text('Add'),
//                                                           onPressed: () {
//                                                             dialogSetState(
//                                                               () {
//                                                                 itemUnitConstantsList
//                                                                     .removeLast();
//                                                                 dealingUnits.add(
//                                                                     otherUnitController
//                                                                         .text);
//                                                                 itemUnitConstantsList.add(
//                                                                     otherUnitController
//                                                                         .text);
//                                                                 itemUnitConstantsList
//                                                                     .add(
//                                                                         "OTHERS");
//                                                                 Navigator.of(
//                                                                         context)
//                                                                     .pop();
//                                                               },
//                                                             );
//                                                           },
//                                                         ),
//                                                       ],
//                                                     );
//                                                   },
//                                                 );
//                                               } else {
//                                                 dialogSetState(
//                                                   () {
//                                                     dealingUnits
//                                                             .contains(unitName)
//                                                         ? dealingUnits
//                                                             .remove(unitName)
//                                                         : dealingUnits
//                                                             .add(unitName);
//                                                   },
//                                                 );
//                                               }
//                                             },
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                                 Text(
//                                                     "${dealingUnitList.contains(unitName) ? dealingUnitList.indexOf(unitName) + 1 : ""}"),
//                                                 Text(
//                                                   unitName,
//                                                   style: TextStyle(
//                                                       fontSize: 18.sp,
//                                                       color:
//                                                           dealingUnits.contains(
//                                                                   unitName)
//                                                               ? Colors.green
//                                                               : null),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         );
//                                       }),
//                                     ),
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         },
//                       );
//                     },
//                   ),
//                   20.verticalSpace,
//                 ],
//               ),
//             ),
//             // ======== customUnitRelationWidgets ====================
//             // Visibility(
//             //     visible: widget.state.levelOfAddUnits == 2,
//             //     child: CustomUnitRelationshipAndConversion(
//             //       bloc: widget.bloc,
//             //       state: widget.state,
//             //       key: unitConversionFactorsKey,
//             //     )),
//             // ====
//           ],
//         ),
//       ),
//     );
//   }

  ///--Inventory management widget.

  ///----Relation between units widgets
// }

// class CustomUnitRelationshipAndConversion extends StatefulWidget {
//   BusinessCreateItemBloc bloc;
//   BusinessCreateItemState state;
//   CustomUnitRelationshipAndConversion({
//     Key? key,
//     required this.bloc,
//     required this.state,
//   }) : super(key: key);

//   @override
//   State<CustomUnitRelationshipAndConversion> createState() =>
//       _CustomUnitRelationshipAndConversionState();
// }

// class _CustomUnitRelationshipAndConversionState
//     extends State<CustomUnitRelationshipAndConversion> {
//   List<TextEditingController> unitConversionFactorList = [];
//   String smallestQuantity = "";
//   List<Container> unitConversionWidgetList = [];

//   @override
//   void didUpdateWidget(
//       covariant CustomUnitRelationshipAndConversion oldWidget) {
//     // TODO: implement didUpdateWidget
//     // smallestQuantity.log("create didUpdateCalled");
//     // unitConversionWidgetList.clear();
//     // smallestQuantity = widget.state.smallestUnit;
//     // createWidgets(
//     //     smallestUnit: smallestQuantity, unitList: widget.state.purchasingUnits);
//     super.didUpdateWidget(oldWidget);
//   }

//   void createWidgets(
//       {required String smallestUnit, required List<String> unitList}) {
//     for (var element in unitList) {
//       if (element != smallestUnit) {
//         unitConversionWidgetList.add(unitConversionTileWidget(
//             smallestUnit: smallestUnit, conversionUnit: element));
//       }
//     }
//   }

//   Container unitConversionTileWidget(
//       {required String smallestUnit, required String conversionUnit}) {
//     TextEditingController unitQtyController = TextEditingController();
//     // TextEditingController unitToUnitController = TextEditingController();
//     // TextEditingController unitFromQtyController = TextEditingController();
//     // TextEditingController unitFromUnitController = TextEditingController();
//     unitConversionFactorList.add(unitQtyController);

//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
//       child: Material(
//         elevation: 10,
//         color: Colors.white,
//         shadowColor: Colors.grey,
//         borderRadius: BorderRadius.circular(15),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Flexible(
//                     child: SizedBox(
//                         height: 50.h,
//                         child: NormalTextField(
//                           controller: unitQtyController,
//                           inputType: TextInputType.number,
//                           label: "Quantity",
//                         )),
//                   ),
//                   Flexible(
//                     child:
//                         //
//                         //  NormalDropDown(
//                         //     height: 50.h,
//                         //     width: 50.w,
//                         //     onSelected: (p0) {
//                         //       unitFromUnitController.text = p0.toString();
//                         //     },
//                         //     entries: unitsList
//                         //         .map((e) => DropdownMenuEntry(
//                         //               value: e,
//                         //               label: e,
//                         //               style: ButtonStyle(
//                         //                   backgroundColor: MaterialStatePropertyAll(
//                         //                       Color((math.Random().nextDouble() *
//                         //                                   0xFFFFFF)
//                         //                               .toInt())
//                         //                           .withOpacity(1.0))),
//                         //             ))
//                         //         .toList()),
//                         Text(
//                       smallestUnit,
//                       style: AppStyles.unitsTermText,
//                     ),
//                   ),
//                   Text(
//                     "in 1",
//                     // "in 1",
//                     style: AppStyles.unitsTermText,
//                   ),
//                   // Flexible(
//                   //   child: SizedBox(
//                   //       height: 50.h,
//                   //       child: NormalTextField(
//                   //         controller: unitToQtyController,
//                   //         inputType: TextInputType.number,
//                   //         label: "Quantity",
//                   //       )),
//                   // ),
//                   Flexible(
//                     child:
//                         //
//                         //  NormalDropDown(
//                         //     height: 50.h,
//                         //     width: 50.w,
//                         //     onSelected: (p0) {
//                         //       unitToUnitController.text = p0.toString();
//                         //     },
//                         //     entries: unitsList
//                         //         .map((e) => DropdownMenuEntry(
//                         //               value: e,
//                         //               label: e,
//                         //               style: ButtonStyle(
//                         //                   backgroundColor: MaterialStatePropertyAll(
//                         //                       Color((math.Random().nextDouble() *
//                         //                                   0xFFFFFF)
//                         //                               .toInt())
//                         //                           .withOpacity(1.0))),
//                         //             ))
//                         //         .toList()),
//                         Text(
//                       conversionUnit,
//                       style: AppStyles.unitsTermText,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // unitConversionWidgetList.add(unitConversionTileWidget(conversionUnit: "bags", smallestUnit: "pcs"));
//     return Column(
//       children: [
//         15.verticalSpace,
//         Center(
//             child: Text(
//           "Select smallest dealing unit",
//           // "Define the relation between your units",
//           style: AppStyles.addunitsTitleInventory.copyWith(fontSize: 20),
//         )),
//         5.verticalSpace,
//         NormalDropDown(
//             // height: 50.h,
//             // width: 50.w,
//             onSelected: (p0) {
//               smallestQuantity = p0.toString();
//               widget.bloc.add(BusinessCreateItemAddSmallestUniEvent(
//                   smallestUnit: smallestQuantity));
//             },
//             entries: widget.state.purchasingUnits
//                 .map((e) => DropdownMenuEntry(
//                       value: e,
//                       label: e,
//                       // style: ButtonStyle(
//                       //     backgroundColor: MaterialStatePropertyAll(Color(
//                       //             (math.Random().nextDouble() * 0xFFFFFF)
//                       //                 .toInt())
//                       //         .withOpacity(1.0))),
//                     ))
//                 .toList()),
//         ListView.builder(
//           itemCount: unitConversionWidgetList.length,
//           primary: false,
//           padding: EdgeInsets.zero,
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             return unitConversionWidgetList[index];
//           },
//         ),
//         20.h.verticalSpace,
//       ],
//     );
//   }
// }

//------Add Lots widgets
// class WidgetAddLots extends StatefulWidget {
//   BusinessCreateItemBloc bloc;
//   BusinessCreateItemState state;
//   WidgetAddLots({
//     Key? key,
//     required this.bloc,
//     required this.state,
//   }) : super(key: key);

//   @override
//   State<WidgetAddLots> createState() => _WidgetAddLotsState();
// }

// class _WidgetAddLotsState extends State<WidgetAddLots> {
//   List<LotDetailsModel> savedLotsList = [];
//   Container? lotDetailsWidget;
//   Container createLotDetails({
//     required List<LotDetailsModel> savedLotsList,
//   }) {
//     final TextEditingController dateController = TextEditingController();
//     final TextEditingController purchasePriceController =
//         TextEditingController();
//     final TextEditingController unitOfLotController = TextEditingController();
//     final TextEditingController quantityOfLotController =
//         TextEditingController();
//     final TextEditingController mrpItemController = TextEditingController();
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 15.w),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Lot",
//             style: AppStyles.lotsTitle,
//           ),
//           8.verticalSpace,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Date of purchase",
//                     style: AppStyles.lotsSubTitle,
//                   ),
//                   2.h.verticalSpace,
//                   InkWell(
//                     onTap: () async {
//                       DateTime? date = await showDatePicker(
//                         context: context,
//                         firstDate: DateTime.utc(2020),
//                         lastDate: DateTime.utc(2040),
//                       );
//                       dateController.text = date.toString().substring(0, 10);
//                     },
//                     child: SizedBox(
//                       width: 0.35.sw,
//                       // height: 60,
//                       child: NormalTextField(
//                         enabled: false,
//                         isFilled: true,
//                         // label: "date",
//                         hintText: "date",
//                         controller: dateController,
//                         suffix:
//                             //
//                             Icon(Icons.calendar_today_outlined),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Purchase Price/Item",
//                     style: AppStyles.lotsSubTitle,
//                   ),
//                   2.h.verticalSpace,
//                   SizedBox(
//                     width: 0.4.sw,
//                     height: 60,
//                     child: NormalTextField(
//                       inputType: TextInputType.number,
//                       // fillColor: AppColors.itemtextfieldColor,
//                       isFilled: true,
//                       label: "Add Purchase Price/Item",
//                       hintText: "Add Purchase Price/Item",
//                       controller: purchasePriceController,
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//           5.verticalSpace,
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Unit",
//                 style: AppStyles.lotsSubTitle,
//               ),
//               2.verticalSpace,
//               NormalDropDown(
//                 fillcolor: AppColors.itemtextfieldColor,
//                 height: 50,
//                 width: 0.82.sw,
//                 hintText: "Select Unit",
//                 onSelected: (unit) {
//                   unitOfLotController.text = unit.toString();
//                 },
//                 entries: widget.state.purchasingUnits
//                     .map((e) => DropdownMenuEntry(value: e, label: e))
//                     .toList(),
//               ),
//             ],
//           ),
//           15.verticalSpace,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Quantity of Lot",
//                     style: AppStyles.lotsSubTitle,
//                   ),
//                   2.verticalSpace,
//                   SizedBox(
//                     width: 0.45.sw,
//                     height: 60,
//                     child: NormalTextField(
//                       inputType: TextInputType.number,
//                       isFilled: true,
//                       label: "Add Quantity of lot",
//                       hintText: "Add Quantity of lot",
//                       controller: quantityOfLotController,
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "MRP/Item",
//                     style: AppStyles.lotsSubTitle,
//                   ),
//                   2.h.verticalSpace,
//                   SizedBox(
//                     width: 0.32.sw,
//                     height: 60,
//                     child: NormalTextField(
//                       inputType: TextInputType.number,
//                       isFilled: true,
//                       label: "Add MRP/Item",
//                       hintText: "Add MRP/Item",
//                       controller: mrpItemController,
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//           15.verticalSpace,
//           InkWell(
//             splashFactory: NoSplash.splashFactory,
//             onTap: () {
//               setState(() {
//                 savedLotsList.add(LotDetailsModel(
//                     dateOfPurchase: dateController.text,
//                     purchasePriceOfItem:
//                         double.parse(purchasePriceController.text),
//                     unit: unitOfLotController.text,
//                     qtyOfLot: int.parse(quantityOfLotController.text),
//                     mrpOfItem: double.parse(mrpItemController.text)));
//                 lotDetailsWidget = null;
//               });
//             },
//             child: Container(
//               width: double.infinity,
//               alignment: Alignment.center,
//               padding: const EdgeInsets.symmetric(
//                 vertical: 15,
//               ),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(colors: [
//                   Color(0xff06721D),
//                   Color(0xff0D7c26),
//                 ]),
//                 borderRadius: BorderRadius.circular(7),
//               ),
//               child: Text(
//                 "Save lot",
//                 style: AppStyles.buttonText,
//               ),
//             ),
//           ),
//           15.verticalSpace,
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: ButtonBottomNavigationBar(
//         title: "Next",
//         onTap: () {
//           widget.bloc.add(BusinessCreateItemAddLotDataEvent(
//               lotData: savedLotsList.map((e) => e.toJson()).toList()));
//         },
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             GradientProgressBar(
//                 backgroundColor: Colors.grey,
//                 percent: 100,
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color(0xFF0D94A7),
//                     Color(0xFF117ADB),
//                     Color(0xFF75C68FE),
//                   ],
//                   stops: [
//                     0.2,
//                     0.8,
//                     0.2,
//                   ],
//                 )),
//             15.verticalSpace,
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5),
//               child: Material(
//                 elevation: 10,
//                 color: Colors.white,
//                 shadowColor: Colors.grey,
//                 borderRadius: BorderRadius.circular(15),
//                 child: Padding(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Text(widget.state.name,
//                                       style: AppStyles.addunitsTitle),
//                                   7.horizontalSpace,
//                                   Text(
//                                       // "HSN/SAC Code : ",
//                                       widget.state.hsnSecCode.toString(),
//                                       style: AppStyles.addunitsSubTitle),
//                                 ],
//                               ),
//                               2.verticalSpace,
//                               Text(
//                                   //"Category : Cold Drinks",
//                                   "Category : ${widget.state.category}",
//                                   style: AppStyles.addunitsSubTitle),
//                               2.verticalSpace,
//                               Text(
//                                   // "Brand : Pepsi Co.",
//                                   "Brand : ${widget.state.brand}",
//                                   style: AppStyles.addunitsSubTitle),
//                             ],
//                           ),
//                           const Spacer(),
//                           Image.asset(
//                             AppAssets.iconsBarCode,
//                             height: 52,
//                             width: 50,
//                           ),
//                           5.horizontalSpace,
//                         ],
//                       ),
//                       2.verticalSpace,
//                       Text(
//                           // "Units: Carton, Box ,Packet , Item",
//                           "Units: ${widget.state.conversionUnitList}",
//                           style: AppStyles.addunitsSubTitle),
//                       2.verticalSpace,
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             15.verticalSpace,
//             // lot details
//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: savedLotsList.length,
//               itemBuilder: (context, index) {
//                 var data = savedLotsList[index];
//                 return _lotDetailsViewTile(data: data, lotNo: index + 1);
//               },
//             ),
//             15.verticalSpace,
//             lotDetailsWidget == null
//                 ? const SizedBox.shrink()
//                 : lotDetailsWidget as Widget,
//             InkWell(
//               splashFactory: NoSplash.splashFactory,
//               onTap: () {
//                 setState(() {
//                   lotDetailsWidget = createLotDetails(
//                     savedLotsList: savedLotsList,
//                   );
//                 });
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     AppAssets.iconsPlus,
//                     height: 21.w,
//                     width: 21.w,
//                   ),
//                   5.horizontalSpace,
//                   Text(
//                     "Add More Lots",
//                     style: AppStyles.tabIconAddLots,
//                   )
//                 ],
//               ),
//             ),
//             30.verticalSpace,
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget _lotDetailsViewTile(
//     {required LotDetailsModel data, required int lotNo}) {
//   return Padding(
//     padding: EdgeInsets.symmetric(vertical: 5.h),
//     child: Material(
//       elevation: 10,
//       color: Colors.white,
//       shadowColor: Colors.grey,
//       borderRadius: BorderRadius.circular(15.r),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Lot $lotNo", style: AppStyles.lotsTitle),
//                 5.verticalSpace,
//                 Row(
//                   children: [
//                     Text(
//                         // "DD/MM/YY",
//                         data.dateOfPurchase,
//                         style: AppStyles.addunitsSubTitle),
//                     5.horizontalSpace,
//                     Text("|", style: AppStyles.addunitsSubTitle),
//                     5.horizontalSpace,
//                     Text("${data.purchasePriceOfItem} Rs/Item",
//                         // "X Rs/Item",
//                         style: AppStyles.addunitsSubTitle),
//                   ],
//                 ),
//                 5.verticalSpace,
//                 Row(
//                   children: [
//                     Text(
//                       // "CAR",
//                       data.unit,
//                       style: AppStyles.addunitsSubTitle,
//                     ),
//                     2.horizontalSpace,
//                     Text("|", style: AppStyles.addunitsSubTitle),
//                     2.horizontalSpace,
//                     Text(
//                       data.qtyOfLot.toString(),
//                       // "Lot Quantity",
//                       style: AppStyles.addunitsSubTitle,
//                     ),
//                     2.horizontalSpace,
//                     Text("|", style: AppStyles.addunitsSubTitle),
//                     2.horizontalSpace,
//                     Text(
//                       // "X Rs/Item MRP",
//                       data.mrpOfItem.toString(),
//                       style: AppStyles.addunitsSubTitle,
//                     ),
//                   ],
//                 ),
//                 2.verticalSpace,
//               ],
//             ),
//             5.horizontalSpace,
//           ],
//         ),
//       ),
//     ),
//   );
// }

///----------createItem successful Screen.
///

customAppBarSuccessScreen({required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          AppAssets.iconsMenu,
          height: 36,
          width: 26,
        ),
        10.horizontalSpace,
        Text(
          "QuickPrism",
          style: AppStyles.successItemTitle,
        ),
        const Spacer(),
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColors.itemstoreColor2, width: 1)),
            child: Row(
              children: [
                const AppSvgIconWidget(
                  iconPath: AppAssets.storeIcon,
                  size: 15,
                  color: AppColors.storeColor1,
                ),
                Text(
                  "Store1",
                  style: AppStyles.storeTitle,
                ),
                5.horizontalSpace,
                const AppSvgIconWidget(
                  iconPath: AppAssets.iconsDown,
                  size: 10,
                )
              ],
            ),
          ),
        ),
        7.horizontalSpace,
        InkWell(
            onTap: () {},
            splashFactory: NoSplash.splashFactory,
            child: Image.asset(
              AppAssets.iconsSettings,
              height: 24,
              width: 24,
            )),
      ],
    ),
  );
}

// ======================= progress indicator

class GradientProgressBar extends StatelessWidget {
  ///it can be anything between 0 to 100
  final int percent;
  final LinearGradient gradient;
  final Color backgroundColor;

  GradientProgressBar(
      {required this.percent,
      required this.gradient,
      required this.backgroundColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: percent,
          fit: FlexFit.tight,
          child: Container(
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: percent == 100
                  ? BorderRadius.all(Radius.circular(4))
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      topLeft: Radius.circular(4)),
            ),
            child: SizedBox(height: 5.0),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 100 - percent,
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: percent == 0
                  ? BorderRadius.all(Radius.circular(4))
                  : BorderRadius.only(
                      bottomRight: Radius.circular(4),
                      topRight: Radius.circular(4)),
            ),
            child: SizedBox(height: 5.0),
          ),
        ),
      ],
    );
  }
}

// tabbar container item view

Widget _tabBarItemContainer({required bool isCurrent, required String title}) {
  return Container(
    margin: EdgeInsets.only(bottom: 5),
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
    decoration: BoxDecoration(
      color: isCurrent ? AppColors.primaryP1Teal : null,
      borderRadius: BorderRadius.circular(8.r),
      border: Border(
        top: BorderSide(color: Color(0xff228EF2), width: 1),
        left: BorderSide(color: Color(0xff228EF2), width: 1),
        right: BorderSide(color: Color(0xff228EF2), width: 1),
      ),
    ),
    child: Text(
      title,
      style: TextStyle(
        color: isCurrent ? Colors.white : Colors.black,
      ),
    ),
  );
}

// widgets

Widget _addMoreSellingOrPurchasingUnit({VoidCallback? onTap}) {
  return InkWell(
    splashFactory: NoSplash.splashFactory,
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.iconsPlus,
          height: 23,
          width: 21,
        ),
        5.horizontalSpace,
        Text(
          "Add More",
          style: AppStyles.tabIconName,
        ),
      ],
    ),
  );
}


/**
 
   // Row(
                        //   children: [
                        //     Column(
                        //       children: [
                        //         InkWell(
                        //           splashFactory: NoSplash.splashFactory,
                        //           onTap: () {},
                        //           child: Image.asset(
                        //             AppAssets.iconsTicBox,
                        //             height: 26,
                        //             width: 21,
                        //           ),
                        //         ),
                        //         8.verticalSpace,
                        //         Text(
                        //           "Saved",
                        //           style: AppStyles.tabIconName,
                        //         ),
                        //       ],
                        //     ),
                        //     10.horizontalSpace,
                        //     Column(
                        //       children: [
                        //         InkWell(
                        //           splashFactory: NoSplash.splashFactory,
                        //           onTap: () {},
                        //           child: Image.asset(
                        //             AppAssets.iconsEdit,
                        //             height: 15,
                        //             width: 19,
                        //           ),
                        //         ),
                        //         17.verticalSpace,
                        //         Text(
                        //           "Edit",
                        //           style: AppStyles.tabIconName,
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        // 5.horizontalSpace,

 */

//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(84, 98),
//     painter: RPSCustomPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File
