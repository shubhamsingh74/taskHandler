import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/utils/utils.dart';
import 'package:quickprism/presentation/widgets/error_widget/error_widget.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';

import '../../../../application/business/business_parties_home/business_parties_home_bloc.dart';
import '../../../../core/styles/app_styles.dart';
import '../../../../domain/core/di/injectable.dart';
import '../../../widgets/button/bottom_navigation_bar.dart';
import '../../../widgets/form_fields/normal_text_field.dart';

@RoutePage()
class ScreenBusinessAddNewParty extends StatefulWidget {
  const ScreenBusinessAddNewParty({super.key});

  @override
  State<ScreenBusinessAddNewParty> createState() =>
      _ScreenBusinessAddNewPartyState();
}

class _ScreenBusinessAddNewPartyState extends State<ScreenBusinessAddNewParty> {
  final partiesBloc = getIt<BusinessPartiesHomeBloc>();

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController gstinController = TextEditingController();
  TextEditingController flatBuildingNoController = TextEditingController();
  TextEditingController areaLocalityController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  bool isGSTIN = false;
  String radioValue = "regular";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessPartiesHomeBloc, BusinessPartiesHomeState>(
      bloc: partiesBloc,
      listener: (context, state) {
        if (state is BusinessPartiesHomeNewPartySuccessState) {
          Utils.successToast(context, "Party added successfully");
          context.router.pop();
        }
      },
      builder: (context, state) {
        if (state is BusinessPartiesHomeNewPartyLoadingState) {
          return const Scaffold(
            body: AppLoadingWidget(),
          );
        }
        if (state is BusinessPartiesHomeNewPartyErrorState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
            ),
            body: const Center(
              child:   AppErrorWidget(message: "Something went wrong"),
            ),
          );
        }

        return Scaffold(
          backgroundColor: AppColors.white,
          bottomNavigationBar: ButtonBottomNavigationBar(
            title: "Add Party",
            onTap: () {
              partiesBloc.add(BusinessPartiesCreateNewPartyEvent(
                name: nameController.text,
                businessType: radioValue,
                gstNo: gstinController.text,
                mobileNo: mobileController.text,
                streetAddress:
                    "${flatBuildingNoController.text} ${areaLocalityController.text}",
                pinCode: pinCodeController.text,
                city: cityController.text,
                state: stateController.text,
              ));
            },
          ),
          appBar: AppBar(
            title: const Text("Add Party"),
            backgroundColor: AppColors.white,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  32.h.verticalSpace,
                  //
                  Text(
                    'Contact type',
                    style: AppStyles.inter50016,
                  ),
                  // radio business type
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: 0,
                          leading: Radio(
                            fillColor: MaterialStateColor.resolveWith(
                              (states) => AppColors.primaryP2,
                            ),
                            value: "Customer",
                            groupValue: radioValue,
                            onChanged: (value) {
                              setState(() {
                                // salaryInterval = "monthly";
                                radioValue = value!;
                              });
                            },
                          ),
                          title: Text(
                            'Customer',
                            style: AppStyles.inter14500T5,
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: ListTile(
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.zero,
                          leading: Radio(
                            fillColor: MaterialStateColor.resolveWith(
                              (states) => AppColors.primaryP2,
                            ),
                            value: "Vendor",
                            groupValue: radioValue,
                            onChanged: (value) {
                              setState(() {
                                // salaryInterval = "monthly";
                                radioValue = value!;
                              });
                            },
                          ),
                          title: Text(
                            'Vendor',
                            style: AppStyles.inter14500T5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //

                  32.h.verticalSpace,
                  Text(
                    'Contact details',
                    style: AppStyles.inter50016,
                  ),
                  24.h.verticalSpace,
                  NormalTextField(
                    hintText: "Party name",
                    label: "Party name",
                    controller: nameController,
                  ),
                  //
                  24.h.verticalSpace,

                  NormalTextField(
                    hintText: "Mobile*",
                    label: "Mobile*",
                    controller: mobileController,
                    maxLength: 10,
                  ),

                  24.h.verticalSpace,

                  NormalTextField(
                    hintText: "email",
                    label: "email",
                    controller: emailController,
                  ),

                  24.h.verticalSpace,
                  //

                  InkWell(
                    onTap: () {
                      isGSTIN = !isGSTIN;

                      setState(() {});
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
                        24.h.verticalSpace,
                        NormalTextField(
                          hintText: "GSTIN",
                          label: "GSTIN",
                          controller: gstinController,
                        ),
                        24.h.verticalSpace,
                        const Text("Billing Address"),
                        8.h.verticalSpace,
                        NormalTextField(
                          hintText: "Flat/ building number",
                          controller: flatBuildingNoController,
                        ),
                        8.h.verticalSpace,
                        NormalTextField(
                          hintText: "Area/locality",
                          controller: areaLocalityController,
                        ),
                        8.h.verticalSpace,
                        8.h.verticalSpace,
                        NormalTextField(
                          hintText: "Pincode",
                          controller: pinCodeController,
                          inputType: TextInputType.phone,
                          maxLength: 6,
                        ),
                        8.h.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: NormalTextField(
                                hintText: "City",
                                controller: cityController,
                              ),
                            ),
                            8.w.horizontalSpace,
                            Flexible(
                              child: NormalTextField(
                                hintText: "State",
                                controller: stateController,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  16.h.verticalSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
