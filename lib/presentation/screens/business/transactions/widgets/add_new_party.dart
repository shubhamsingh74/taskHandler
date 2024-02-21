// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../application/business/business_parties_home/business_parties_home_bloc.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../domain/core/di/injectable.dart';
import '../../../../widgets/button/bottom_navigation_bar.dart';
import '../../../../widgets/form_fields/normal_text_field.dart';

class AddNewParty extends StatefulWidget {
  final bool isSales;
  const AddNewParty({
    Key? key,
    required this.isSales,
  }) : super(key: key);

  @override
  State<AddNewParty> createState() => _AddNewPartyState();
}

class _AddNewPartyState extends State<AddNewParty> {
  bool isGSTIN = false;
  double ratio = 0.7;
  ScrollController _scrollController = ScrollController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobNoController = TextEditingController();
  TextEditingController gstinController = TextEditingController();
  TextEditingController Controller = TextEditingController();
  TextEditingController flatBuildingNoController = TextEditingController();
  TextEditingController areaLocalityController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  final partiesBloc = getIt<BusinessPartiesHomeBloc>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            scrollControlDisabledMaxHeightRatio: ratio,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, sheetSetState) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                      ),
                    ),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          16.h.verticalSpace,
                          const Row(
                            children: [Spacer(), CloseButton()],
                          ),
                          8.h.verticalSpace,
                          Text(
                            'Add ${widget.isSales ? "Party" : "Vendor"}',
                            style: AppStyles.itemTitle.copyWith(
                                fontSize: 18.sp, fontWeight: FontWeight.w600),
                          ),
                          16.h.verticalSpace,
                          //

                          NormalTextField(
                            hintText:
                                "${widget.isSales ? "Party" : "Vendor"} name",
                            label:
                                "${widget.isSales ? "Party" : "Vendor"} name",
                            controller: nameController,
                          ),
                          //
                          12.h.verticalSpace,

                          NormalTextField(
                            hintText: "Phone No.",
                            label: "Phone No",
                            maxLength: 10,
                            inputType: TextInputType.number,
                            controller: mobNoController,
                            
                          ),
                          12.h.verticalSpace,

                          32.h.verticalSpace,

                          InkWell(
                            onTap: () {
                              isGSTIN = !isGSTIN;
                              _scrollController.jumpTo(250.h);
                              sheetSetState(() {});
                            },
                            child: Text(
                              isGSTIN
                                  ? '- Add GSTIN & Add address (optional)'
                                  : '+ Add GSTIN & Add address (optional)',
                              style: AppStyles.styleInter14500T7,
                            ),
                          ),
                          Visibility(
                            visible: isGSTIN,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                16.h.verticalSpace,
                                NormalTextField(
                                  label: "GSTIN",
                                  hintText: "GSTIN",
                                  controller: gstinController,
                                ),
                                16.h.verticalSpace,
                                const Text("Billing Address"),
                                16.h.verticalSpace,
                                NormalTextField(
                                  hintText: "Flat/ building number",
                                  label: "Flat/ building number",
                                  controller: flatBuildingNoController,
                                ),
                                8.h.verticalSpace,
                                NormalTextField(
                                  hintText: "Area/locality",
                                  label: "Area/locality",
                                  controller: areaLocalityController,
                                ),
                                8.h.verticalSpace,
                                8.h.verticalSpace,
                                NormalTextField(
                                  hintText: "Pincode",
                                  label: "Pincode",
                                  inputType: TextInputType.number,
                                  maxLength: 6,
                                  controller: pinCodeController,
                                ),
                                8.h.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: NormalTextField(
                                        hintText: "City",
                                        label: "City",
                                        controller: cityController,
                                      ),
                                    ),
                                    10.w.horizontalSpace,
                                    Flexible(
                                      child: NormalTextField(
                                        hintText: "State",
                                        label: "State",
                                        controller: stateController,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          16.h.verticalSpace,

                          BlocConsumer<BusinessPartiesHomeBloc,
                              BusinessPartiesHomeState>(
                            bloc: partiesBloc,
                            listener: (context, state) {
                              if (state
                                  is BusinessPartiesHomeNewPartySuccessState) {
                                context.router.pop();
                                Utils.successToast(context,
                                    "${widget.isSales ? "Party" : "Vendor"} added successfully");
                              }
                              if (state
                                  is BusinessPartiesHomeNewPartyErrorState) {
                                context.router.pop();
                                Utils.errorToast(context, "Try again");
                              }
                            },
                            builder: (context, state) {
                              if (state
                                  is BusinessPartiesHomeNewPartyLoadingState) {
                                return const CircularProgressIndicator(
                                  color: AppColors.primaryP2,
                                );
                              }
                              return ButtonBottomNavigationBar(
                                title:
                                    "Add ${widget.isSales ? "Party" : "Vendor"}",
                                onTap: () {
                                  partiesBloc
                                      .add(BusinessPartiesCreateNewPartyEvent(
                                    name: nameController.text,
                                    businessType:
                                        "${widget.isSales ? "Customer" : "Vendor"}",
                                    gstNo: gstinController.text,
                                    mobileNo: mobNoController.text,
                                    streetAddress:
                                        "${flatBuildingNoController.text} ${areaLocalityController.text}",
                                    pinCode: pinCodeController.text,
                                    city: cityController.text,
                                    state: stateController.text,
                                  ));
                                },
                              );
                            },
                          ),

                          16.h.verticalSpace,
                        ],
                      ),
                    ),
                  );
                },
              );
            });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '+ Add new ${widget.isSales ? "Party" : "Vendor"}',
            style: AppStyles.inter12400T212500
                .copyWith(color: AppColors.oldPrimaryP2, fontSize: 14.sp),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
