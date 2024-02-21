// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/core/utils/utils.dart';
import 'package:quickprism/presentation/widgets/back_icon_and_title/back_icon_and_title.dart';
import 'package:quickprism/presentation/widgets/button/bottom_navigation_bar.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';
import 'package:quickprism/presentation/widgets/calendor/app_calendor.dart';
import 'package:quickprism/presentation/widgets/container/shadow_container_for_tile.dart';
import 'package:quickprism/presentation/widgets/error_widget/error_widget.dart';
import 'package:quickprism/presentation/widgets/form_fields/auth_text_field.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';
import 'package:quickprism/presentation/widgets/validators/validators.dart';

import '../../../application/business/business_staff_management/business_staff_management_bloc.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/core/di/injectable.dart';
import '../../widgets/form_fields/normal_text_field.dart';
import '../../widgets/normal_dropdown/normal_dropdown.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@RoutePage()
class ScreenAddNewStaff extends StatefulWidget {
  const ScreenAddNewStaff({super.key});

  @override
  State<ScreenAddNewStaff> createState() => _ScreenAddNewStaffState();
}

class _ScreenAddNewStaffState extends State<ScreenAddNewStaff> {
  final BusinessStaffManagementBloc _businessStaffManagementBloc =
      getIt<BusinessStaffManagementBloc>();
  TextEditingController qpIdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController salaryDateController = TextEditingController();
  TextEditingController salaryAmountController = TextEditingController();
  ValueNotifier<bool> isAttendanceAndSalary = ValueNotifier<bool>(false);
  ScrollController scrollController = ScrollController();
  String? salaryInterval = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _businessStaffManagementBloc
        .add(BusinessStaffManagementAddNewStaffInitialEvent());
    isAttendanceAndSalary.addListener(() {
      scrollController.jumpTo(150.h);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessStaffManagementBloc,
        BusinessStaffManagementState>(
      listener: (context, addStaffState) {
        if (addStaffState is BusinessStaffManagementNewStaffAddedState) {
          Utils.successToast(context, "Staff added successfully");
          qpIdController.clear();
          nameController.clear();
          mobileNoController.clear();
          roleController.clear();
        }
      },
      bloc: _businessStaffManagementBloc,
      builder: (context, addStaffState) {
        if (addStaffState is BusinessStaffManagementErrorState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
            ),
            body: Center(
                child: AppErrorWidget(
              message: "Something went wrong",
            )),
          );
        }
        if (addStaffState is BusinessStaffManagementLoadingState) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Add new staff",
                style: AppStyles.appBar,
              ),
              backgroundColor: AppColors.white,
            ),
            body: AppLoadingWidget(),
          );
        }
        if (addStaffState is BusinessStaffManagementNewStaffInitialState ||
            addStaffState is BusinessStaffManagementNewStaffAddedState) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Add new staff",
                style: AppStyles.appBar,
              ),
              backgroundColor: AppColors.white,
            ),
            bottomNavigationBar: ButtonBottomNavigationBar(
              title: "Save",
              onTap: () {
                final FormState? form = _formKey.currentState;
                if (form!.validate() && roleController.text.isNotEmpty) {
                  _businessStaffManagementBloc
                      .add(BusinessStaffManagementAddNewStaffEvent(
                    qpId: qpIdController.text,
                    name: nameController.text,
                    mobileNo: mobileNoController.text,
                    role: roleController.text,
                    isAttendanceAndSalary: isAttendanceAndSalary.value,
                    salaryAmount: salaryAmountController.text,
                    salaryInterval: salaryInterval,
                    salaryStartedDate: salaryDateController.text,
                  ));
                }
              },
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        31.verticalSpace,
                        AuthTextField(
                          key: const Key('qpid'),
                          validator: AppValidators.emptyStringValidator,
                          hintText: "QPID*",
                          controller: qpIdController,
                        ),
                        15.h.verticalSpace,
                        AuthTextField(
                          key: const Key('name'),
                          hintText: "Name*",
                          controller: nameController,
                          validator: AppValidators.emptyStringValidator,
                        ),
                        15.h.verticalSpace,
                        AuthTextField(
                          key: const Key('mob No'),
                          validator: AppValidators.phoneNumberValidate,
                          // validator: phoneNumberValidate,
                          hintText: "Mobile No. *",
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          controller: mobileNoController,
                        ),
                        15.h.verticalSpace,
                        NormalDropDown(
                          hintText: "Role*",
                          onSelected: (p0) {
                            // print("object $p0");
                            roleController.text = p0;
                          },
                          entries: [
                            DropdownMenuEntry(
                                value: "Manager",
                                label: "Manager (Stock transfer and listing)"),
                            DropdownMenuEntry(
                                value: "Purchase", label: "Purchase"),
                            DropdownMenuEntry(value: "Sales", label: "Sales"),
                          ],
                        ),
                        32.h.verticalSpace,
                        //
                        //  ManageAttendanceAndSalary(),

                        // ======

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Attendance and salary',
                                      style: AppStyles.tileStyleTitle
                                          .copyWith(fontSize: 16.sp),
                                    ),
                                    Text(
                                      'Manage attendance and salary',
                                      style: AppStyles.tileStyleGray,
                                    )
                                  ],
                                ),
                                // InkWell(child: Text("Switch")),
                                AdvancedSwitch(
                                  enabled: true,
                                  height: 16.h,
                                  width: 25.w,
                                  controller: isAttendanceAndSalary,
                                  activeColor: AppColors.primaryP2,
                                  thumb: ValueListenableBuilder<bool>(
                                    valueListenable: isAttendanceAndSalary,
                                    builder: (_, value, __) {
                                      return Icon(
                                        Icons.circle,
                                        color: Colors.white,
                                        size: 12.h,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            24.h.verticalSpace,
                            Visibility(
                              visible: isAttendanceAndSalary.value,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Salary calculation start date',
                                    style: AppStyles.tileStyleGray,
                                  ),
                                  NormalTextField(
                                    prefix: Icon(
                                      Icons.calendar_month_outlined,
                                      color: AppColors.primaryP2,
                                    ),
                                    controller: salaryDateController,
                                    onPrefixTap: () async {
                                      final DateTime? picked =
                                          await showDatePicker(
                                              context: context,
                                              firstDate: DateTime(2015, 8),
                                              lastDate: DateTime(2101));
                                      salaryDateController.text =
                                          "${picked?.day ?? 0}/${picked?.month ?? 0}/${picked?.year ?? 0}";
                                    },
                                  ),
                                  24.h.verticalSpace,
                                  Text(
                                    'Salary type',
                                    style: AppStyles.tileStyleGray,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ShadowContainerForTiles(
                                        margin: EdgeInsets.zero,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Radio(
                                              fillColor: MaterialStateColor
                                                  .resolveWith(
                                                (states) => AppColors.primaryP2,
                                              ),
                                              value: "monthly",
                                              groupValue: salaryInterval,
                                              onChanged: (value) {
                                                setState(() {
                                                  salaryInterval = "monthly";
                                                });
                                              },
                                            ),
                                            Text(
                                              'Monthly',
                                              style: AppStyles.inter14600T6,
                                            ),
                                            Text(
                                              'Staff gets monthly salary',
                                              style: AppStyles.tileStyleGray,
                                            )
                                          ],
                                        ),
                                      ),
                                      ShadowContainerForTiles(
                                        margin: EdgeInsets.zero,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Radio(
                                              fillColor: MaterialStateColor
                                                  .resolveWith(
                                                (states) => AppColors.primaryP2,
                                              ),
                                              value: "daily",
                                              groupValue: salaryInterval,
                                              onChanged: (value) {
                                                setState(() {
                                                  salaryInterval = "daily";
                                                });
                                              },
                                            ),
                                            Text(
                                              'Daily',
                                              style: AppStyles.inter14600T6,
                                            ),
                                            Text(
                                              'Staff gets daily salary',
                                              style: AppStyles.tileStyleGray,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  24.h.verticalSpace,
                                  AuthTextField(
                                    key: const Key('salary'),
                                    validator:
                                        AppValidators.emptyStringValidator,
                                    hintText: "Enter monthly salary*",
                                    controller: salaryAmountController,
                                    keyboardType: TextInputType.number,
                                  ),
                                  24.h.verticalSpace,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }

  String? phoneNumberValidate(text) {
    if (text != null && text.isEmpty) {
      return 'Enter your phone number';
    } else if (text != null && text.length != 10) {
      return 'Invalid phone number';
    }

    return null;
  }
}
