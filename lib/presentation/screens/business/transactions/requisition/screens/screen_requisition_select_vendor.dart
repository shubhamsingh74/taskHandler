import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_transactions/requisition/transaction_requisition_bloc.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/dealings/models/create_requisition/create_requisition_model.dart';
import 'package:quickprism/presentation/screens/business/transactions/requisition/screens/screen_requisition_review.dart';
import 'package:quickprism/presentation/screens/business/transactions/requisition/widgets/custom_common_item_widget.dart';
import 'package:quickprism/presentation/screens/business/transactions/requisition/widgets/custom_common_primary_button.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';
import 'package:quickprism/presentation/widgets/normal_dropdown/normal_dropdown.dart';

import '../../../../../widgets/appbar/main_app_bar_business.dart';

///------select vendors screen
class ScreenRequisitionSelectVendor extends StatefulWidget {
  final List<Map<String, dynamic>> itemsList;

  const ScreenRequisitionSelectVendor({super.key, required this.itemsList});

  @override
  State<ScreenRequisitionSelectVendor> createState() =>
      _ScreenRequisitionSelectVendorState();
}

class _ScreenRequisitionSelectVendorState
    extends State<ScreenRequisitionSelectVendor> {
  List<String> indianStates = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal'
  ];

  final _formKey = GlobalKey<FormState>();
  final BusinessTransactionRequisitionBloc businessTransactionRequisitionBloc =
      getIt<BusinessTransactionRequisitionBloc>();
  final TextEditingController _vendorController = TextEditingController();
  final TextEditingController _buyersSignatureController =
      TextEditingController();
  final TextEditingController _indianStatesController = TextEditingController();
  final TextEditingController _billingAddress1Controller =
      TextEditingController();
  final TextEditingController _billingAddress2Controller =
      TextEditingController();
  final TextEditingController _billingAddress3Controller =
      TextEditingController();
  final TextEditingController _shippingAddress1Controller =
      TextEditingController();
  final TextEditingController _shippingAddress2Controller =
      TextEditingController();
  final TextEditingController _shippingAddress3Controller =
      TextEditingController();

  bool showItems = false;
  List<Map<String, dynamic>> vendorsList = [];

   List<RequisitionItemData> itemsListsModelType = [];
   List<VendorData> vendorsListModelType =[];

  @override
  void dispose() {
    _billingAddress1Controller.dispose();
    _billingAddress2Controller.dispose();
    _billingAddress3Controller.dispose();
    _shippingAddress1Controller.dispose();
    _shippingAddress2Controller.dispose();
    _shippingAddress3Controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    businessTransactionRequisitionBloc.add(GetAllVendors());
    setState(() {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessTransactionRequisitionBloc,
            BusinessTransactionRequisitionState>(
        bloc: businessTransactionRequisitionBloc,
        listener: (context, state) {},
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
              ),
              bottomNavigationBar: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w)
                    .copyWith(bottom: 20.h),
                child: SizedBox(
                  height: 58.h,
                  child: customCommonPrimaryButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          businessTransactionRequisitionBloc
                              .add(RequisitionSelectItemSaveItemDetailsEvent(
                            itemUnit: state.itemUnit,
                            itemQuantity: state.itemQuantity,
                            itemName: state.itemName,
                            itemBrand: state.itemBrand,
                            itemCategory: state.itemCategory,
                            itemDetails: widget.itemsList,
                            itemId: state.itemId,
                            vendorsDetails: vendorsList,
                            shippingAddress:
                                "${_shippingAddress1Controller.text}, ${_shippingAddress2Controller.text}, ${_shippingAddress3Controller.text}",
                            buyersSignature: _buyersSignatureController.text,
                            billingAddress:
                                "${_billingAddress1Controller.text}, ${_billingAddress2Controller.text}, ${_billingAddress3Controller.text}",
                            state: _indianStatesController.text,
                          ));

                          ///checking purpose
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScreenRequisitionReview(
                                  itemsLists: widget.itemsList,
                                  vendorsList: vendorsList,
                                  buyersSignature:
                                      _buyersSignatureController.text,
                                  shippingAddress:
                                      "${_shippingAddress1Controller.text}, ${_shippingAddress2Controller.text}, ${_shippingAddress3Controller.text}",
                                  billingAddress:
                                      "${_billingAddress1Controller.text}, ${_billingAddress2Controller.text}, ${_billingAddress3Controller.text}",
                                  itemsListsModelType: itemsListsModelType,
                                  vendorsListModelType: vendorsListModelType,
                                ),
                              ));
                        }
                      },
                      title: 'Review Requisition'),
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
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: ListView.builder(
                          itemCount: widget.itemsList.length,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {

                             itemsListsModelType.add(RequisitionItemData(
                                 itemUnits: widget.itemsList[index]["itemUnit"],
                                 itemId: widget.itemsList[index]["itemId"],
                                 itemQuantity: widget.itemsList[index]["itemQuantity"]
                             ));

                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: customCommonItemWidget(
                                  name: widget.itemsList[index]["itemName"],
                                  category: widget.itemsList[index]
                                      ["itemCategory"],
                                  brand: widget.itemsList[index]["itemBrand"],
                                  unit: widget.itemsList[index]["itemUnit"],
                                  quantity: widget.itemsList[index]["itemQuantity"].toString()),
                            );
                          },
                        ),
                      ),
                      10.h.verticalSpace,
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            15.h.verticalSpace,
                            Text(
                              "Select Vendors",
                              style: AppStyles.inter60016282828,
                            ),
                            3.h.verticalSpace,
                            NormalDropDown(
                                hintText: "Select Vendor",
                                fillcolor: const Color(0xffDDE3E9),
                                height: 0.50.sh,
                                width: 0.85.sw,
                                onSelected: (unit) {
                                  _vendorController.text = unit.toString();
                                  setState(() {
                                    state.vendorsModel?.data
                                        ?.forEach((element) {
                                      if (element.businessName!
                                          .contains(_vendorController.text)) {
                                        vendorsList.add({
                                          'vendorsId': element.businessId,
                                          'vendorsName': element.businessName,
                                        });
                                        vendorsListModelType.add(VendorData(
                                          businessId: element.businessId,
                                        ));
                                      }
                                    });
                                    _vendorController.clear();
                                  });
                                },
                                entries: state.vendorsModel?.data
                                        ?.map((e) => DropdownMenuEntry(
                                            value: e.businessName,
                                            label: e.businessName.toString()))
                                        .toList() ??
                                    []),
                            10.h.verticalSpace,
                            GridView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: vendorsList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 50.h,
                                      mainAxisSpacing: 20.h,
                                      crossAxisSpacing: 30.h,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return customVendorsContainerWidget(
                                    title: vendorsList[index]['vendorsName'],
                                    onTap: () {
                                      setState(() {
                                        vendorsList.removeAt(index);
                                      });
                                    });
                              },
                            ),
                            25.h.verticalSpace,
                            Text(
                              "Buyer’s Signatory ",
                              style: AppStyles.inter60016282828,
                            ),
                            3.h.verticalSpace,
                            NormalTextField(
                              isFilled: true,
                              label: 'Buyer’s Signatory',
                              hintText: 'Buyer’s Signatory',
                              controller: _buyersSignatureController,
                              inputType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter your full name";
                                }
                              },
                            ),
                            25.h.verticalSpace,
                            Text(
                              "Billing Address",
                              style: AppStyles.inter60016282828,
                            ),
                            7.h.verticalSpace,
                            NormalTextField(
                              isFilled: true,
                              label: 'Address Line 1',
                              hintText: 'Address Line 1',
                              controller: _billingAddress1Controller,
                              inputType: TextInputType.streetAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Address Line 1";
                                }
                              },
                            ),
                            3.h.verticalSpace,
                            NormalTextField(
                              isFilled: true,
                              label: 'Address Line 2',
                              hintText: 'Address Line 2',
                              controller: _billingAddress2Controller,
                              inputType: TextInputType.streetAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Address Line 2";
                                }
                              },
                            ),
                            3.h.verticalSpace,
                            NormalTextField(
                              isFilled: true,
                              label: 'Address Line 3',
                              hintText: 'Address Line 3',
                              controller: _billingAddress3Controller,
                              inputType: TextInputType.streetAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Address Line 3";
                                }
                              },
                            ),
                            30.h.verticalSpace,
                            Text(
                              "Shipping Address",
                              style: AppStyles.inter60016282828,
                            ),
                            7.h.verticalSpace,
                            NormalTextField(
                              isFilled: true,
                              label: 'Address Line 1',
                              hintText: 'Address Line 1',
                              controller: _shippingAddress1Controller,
                              inputType: TextInputType.streetAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Address Line 1";
                                }
                              },
                            ),
                            3.h.verticalSpace,
                            NormalTextField(
                              isFilled: true,
                              label: 'Address Line 2',
                              hintText: 'Address Line 2',
                              controller: _shippingAddress2Controller,
                              inputType: TextInputType.streetAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Address Line 2";
                                }
                              },
                            ),
                            3.h.verticalSpace,
                            NormalTextField(
                              isFilled: true,
                              label: 'Address Line 3',
                              hintText: 'Address Line 3',
                              controller: _shippingAddress3Controller,
                              inputType: TextInputType.streetAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Address Line 3";
                                }
                              },
                            ),
                            3.h.verticalSpace,
                            NormalDropDown(
                              hintText: "State",
                              fillcolor: const Color(0xffDDE3E9),
                              height: 0.50.sh,
                              width: 0.85.sw,
                              onSelected: (unit) {
                                _indianStatesController.text = unit.toString();
                              },
                              entries: indianStates.map((e) {
                                return DropdownMenuEntry(value: e, label: e);
                              }).toList(),
                            ),
                            25.h.verticalSpace,
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return const Scaffold();
        });
  }

  ///-------custom vendor widget
  customVendorsContainerWidget(
      {required VoidCallback onTap, required String title}) {
    return Material(
      elevation: 10,
      shadowColor: Colors.blue.shade200,
      borderRadius: BorderRadius.circular(25.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.r),
            border: Border.all(color: Colors.grey, width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppStyles.inter40011585555,
            ),
            InkWell(
              splashFactory: NoSplash.splashFactory,
              onTap: onTap,
              child: Icon(
                Icons.clear,
                size: 17.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}
