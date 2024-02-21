import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_transactions/requisition/transaction_requisition_bloc.dart';
import 'package:quickprism/application/business/home/business_home/business_home_bloc.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/stocks/models/all_items_store/all_items_store_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/screens/business/create_item/screen_create_item.dart';
import 'package:quickprism/presentation/screens/business/transactions/requisition/screens/screen_requisition_select_vendor.dart';
import 'package:quickprism/presentation/screens/business/transactions/requisition/widgets/custom_common_item_widget.dart';
import 'package:quickprism/presentation/screens/business/transactions/requisition/widgets/custom_common_primary_button.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';
import 'package:quickprism/presentation/widgets/normal_dropdown/normal_dropdown.dart';
import 'package:quickprism/presentation/widgets/shop_dropdown/custom_shop_drop_down.dart';

import '../../../../../widgets/appbar/main_app_bar_business.dart';

///-------screen for selecting the items for requisition
class ScreenCreateRequisitionSelectItems extends StatefulWidget {
  const ScreenCreateRequisitionSelectItems({super.key});

  @override
  State<ScreenCreateRequisitionSelectItems> createState() =>
      _ScreenCreateRequisitionSelectItemsState();
}

class _ScreenCreateRequisitionSelectItemsState
    extends State<ScreenCreateRequisitionSelectItems> {
  AllItemsOfStore? allItemsOfStore;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _itemQuantityController = TextEditingController();

  // final TextEditingController _itemNameController = TextEditingController(text: allItemsOfStore.data);
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemUnitController = TextEditingController();
  final BusinessTransactionRequisitionBloc businessTransactionRequisitionBloc =
      getIt<BusinessTransactionRequisitionBloc>();
  final BusinessHomeBloc homeBloc = getIt<BusinessHomeBloc>();

  bool showItems = false;
  bool showAddAnother = false;
  bool showSelectItems = true;
  bool addMoreItems = false;

  List<String> itemUnits = [];
  String itemBrands = "";
  String itemCategory = "";
  int itemId = 0;

  @override
  void initState() {
    int shopId = UserConstants.currentShop?.shopId ?? 0;
    businessTransactionRequisitionBloc
        .add(RequisitionGetAllItemsEvent(shopId: shopId));
    super.initState();
  }

  @override
  void dispose() {
    _itemNameController.dispose();
    _itemQuantityController.dispose();
    _itemUnitController.dispose();
    super.dispose();
  }

  void filterUnits(AllItemsOfStore allItemsOfStore) {
    itemUnits.clear();
    allItemsOfStore.data?.forEach((element) {
      if (element.itemName!.contains(_itemNameController.text)) {
        itemBrands = element.brand.toString();
        itemCategory = element.categoryName.toString();
        itemId = element.itemId!;
        element.units?.forEach((element) {
          itemUnits.add(element.toString());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    itemUnits.log("item unitList");
    print(itemBrands);
    print(itemCategory);
    return BlocConsumer<BusinessTransactionRequisitionBloc,
            BusinessTransactionRequisitionState>(
        bloc: businessTransactionRequisitionBloc,
        listener: (context, state) {
          if (state is RequisitionInitialState) {}
          if (state is RequisitionInitialState) {}
        },
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
                actions: [
                  BlocConsumer<BusinessHomeBloc, BusinessHomeState>(
                      bloc: homeBloc,
                      listener: (context, state) {
                        businessTransactionRequisitionBloc.add(
                            RequisitionGetAllItemsEvent(
                                shopId:
                                    UserConstants.currentShop?.shopId ?? 0));
                      },
                      builder: (context, state) {
                        return CustomShopDropdown(
                          list: UserConstants.shops,
                          onChanged: (shop) {
                            setState(() {
                              homeBloc.add(BusinessHomeChangeShopEvent(
                                shop: shop!,
                              ));
                            });
                          },
                        );
                      }),
                  15.w.horizontalSpace,
                  InkWell(
                    onTap: () {
                      context.router.push(const RouteProfile());
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 15.r,
                    ),
                  ),
                  20.w.horizontalSpace,
                ],
              ),
              bottomNavigationBar: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w)
                    .copyWith(bottom: 20.h),
                child: SizedBox(
                  height: 58.h,
                  child: customCommonPrimaryButton(
                      onTap: () {
                        final String itemQuantityNumeric = _itemQuantityController.text.trim();

                        if (state.itemDetails.isEmpty ||
                            showSelectItems == true) {
                          if (_formKey.currentState!.validate()) {
                            businessTransactionRequisitionBloc
                                .add(RequisitionSelectItemSaveItemDetailsEvent(
                              itemUnit: _itemUnitController.text.trim(),
                              itemQuantity: int.parse(itemQuantityNumeric),
                              itemName: _itemNameController.text,
                              itemBrand: itemBrands,
                              itemCategory: itemCategory,
                              itemDetails: state.itemDetails,
                              itemId: itemId,
                              vendorsDetails: state.vendorDetails,
                              shippingAddress: state.shippingAddress,
                              buyersSignature: state.buyersSignature,
                              billingAddress: state.billingAddress,
                              state: state.state,
                            ));

                            setState(() {
                              showItems = true;
                              showAddAnother = true;
                              if(state.itemDetails.length<2){
                                addMoreItems = true;
                              }
                              showSelectItems = false;
                            });
                          }
                        }

                        if (state.itemDetails.isNotEmpty && showSelectItems == false && showAddAnother == true && showItems == true) {
                          ///checking purpose
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ScreenRequisitionSelectVendor(
                                  itemsList: state.itemDetails,
                                ),
                              )).then((value) {
                                // state.itemDetails=[];
                          });
                        }
                      },
                      title:
                          'Save ${showSelectItems == true ? "Item" : "and Proceed"}'),
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
                            "Create Requisition",
                            style: AppStyles.inter70018282828
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),

                      ///-----showing added items
                      Visibility(
                        visible: showItems,
                        child: Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: ListView.builder(
                            itemCount: state.itemDetails.length,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            primary: false,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.h),
                                child: customCommonItemWidget(
                                    name: state.itemDetails[index]["itemName"],
                                    category: state.itemDetails[index]["itemCategory"],
                                    brand: state.itemDetails[index]["itemBrand"],
                                    unit: state.itemDetails[index]["itemUnit"],
                                    quantity: state.itemDetails[index]["itemQuantity"].toString()),
                              );
                            },
                          ),
                        ),
                      ),

                      ///-------showing add another button
                      Visibility(
                        visible: showAddAnother,
                        child: InkWell(
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            setState(() {
                              showSelectItems = true;
                              showAddAnother = false;
                              _itemUnitController.clear();
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Material(
                              elevation: 10,
                              shadowColor: Colors.blue.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8.r),
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    vertical: 20.h, horizontal: 30.w),
                                decoration: BoxDecoration(
                                  color: AppColors.newThemeButtonColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: const Color(0xff0E4572),
                                      size: 20.h,
                                    ),
                                    5.w.horizontalSpace,
                                    Text(
                                      "Add Another Item",
                                      style: AppStyles.inter500150E4572,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Visibility(
                        visible: showSelectItems,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              15.h.verticalSpace,
                              Text(
                                "Select Items",
                                style: AppStyles.inter60018282828,
                              ),
                              10.h.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Scan Item or Select Item Name",
                                    style: AppStyles.inter500153D3A3A,
                                  ),
                                  Image.asset(
                                    AppAssets.imageBarCodeImage,
                                    height: 16.h,
                                    width: 17.h,
                                    fit: BoxFit.fill,
                                  ),
                                ],
                              ),
                              3.h.verticalSpace,
                              NormalDropDown(
                                hintText: "Select Item",
                                fillcolor: const Color(0xffDDE3E9),
                                height: 0.55.sh,
                                width: 0.85.sw,
                                onSelected: (name) {
                                  setState(() {
                                    _itemNameController.text = name.toString();
                                    if (state.allItemsOfStore != null) {
                                      filterUnits(state.allItemsOfStore!);
                                    }
                                  });
                                },
                                entries: state.allItemsOfStore?.data!
                                        .map((e) => DropdownMenuEntry(
                                            value: e.itemName,
                                            label: e.itemName.toString()))
                                        .toList() ??
                                    [],
                              ),
                              10.h.verticalSpace,
                              Text(
                                "Add Units",
                                style: AppStyles.inter500153D3A3A,
                              ),
                              3.h.verticalSpace,
                              NormalDropDown(
                                  hintText: "Add Units",
                                  enabled: true,
                                  fillcolor: const Color(0xffDDE3E9),
                                  height: 0.55.sh,
                                  width: 0.85.sw,
                                  onSelected: (unit) {
                                    _itemUnitController.text = unit.toString();
                                  },
                                  entries: itemUnits.map((e) {
                                    return DropdownMenuEntry(
                                        value: e, label: e);
                                  }).toList()),
                              10.h.verticalSpace,
                              Text(
                                "Item Quantity",
                                style: AppStyles.inter500153D3A3A,
                              ),
                              3.h.verticalSpace,
                              NormalTextField(
                                isFilled: true,
                                label: 'Add Quantity',
                                hintText: 'Add Quantity',
                                controller: _itemQuantityController,
                                inputType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter quantity of Item";
                                  }
                                },
                              ),
                              10.h.verticalSpace,
                              InkWell(
                                splashFactory: NoSplash.splashFactory,
                                onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ScreenCreateItem(),));
                                },
                                child: Text(
                                  "Cant Find the Item ? Create Item Here",
                                  style: AppStyles.inter500153D3A3A
                                      .copyWith(color: const Color(0xff1790F1)),
                                ),
                              ),
                              20.h.verticalSpace,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Scaffold();
        });
  }
}
