// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/utils.dart';
import 'package:quickprism/presentation/widgets/button/bottom_navigation_bar.dart';
import 'package:quickprism/presentation/widgets/container/shadow_container_for_tile.dart';
import 'package:quickprism/presentation/widgets/error_widget/error_widget.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';
import 'package:quickprism/presentation/widgets/normal_dropdown/normal_dropdown.dart';

import '../../../application/business/business_staff_management/business_staff_management_bloc.dart';
import '../../../domain/core/di/injectable.dart';

@RoutePage()
class ScreenStaffMemberDayAttendance extends StatefulWidget {
  BusinessStaffManagementBloc businessStaffManagementBloc;

  ScreenStaffMemberDayAttendance({
    Key? key,
    required this.businessStaffManagementBloc,
  }) : super(key: key);
  @override // attendanceState
  State<ScreenStaffMemberDayAttendance> createState() => _ScreenStaffMemberDayAttendanceState();
}

class _ScreenStaffMemberDayAttendanceState extends State<ScreenStaffMemberDayAttendance> {
  TextEditingController _checkInTimeController = TextEditingController();
  TextEditingController _checkOutTimeController = TextEditingController();
  TextEditingController _attendanceStatusController = TextEditingController();
  TextEditingController _checkInStateController = TextEditingController();
  TextEditingController _checkInCityController = TextEditingController();
  TextEditingController _checkInPinCodeController = TextEditingController();
  TextEditingController _checkInStreetAddressController = TextEditingController();
  TextEditingController _checkOutStateController = TextEditingController();
  TextEditingController _checkOutCityController = TextEditingController();
  TextEditingController _checkOutPinCodeController = TextEditingController();
  TextEditingController _checkOutStreetAddressController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _checkInTimeController.dispose();
    _checkOutTimeController.dispose();
    _attendanceStatusController.dispose();
    _checkInStateController.dispose();
    _checkInCityController.dispose();
    _checkInPinCodeController.dispose();
    _checkInStreetAddressController.dispose();
    _checkOutStateController.dispose();
    _checkOutCityController.dispose();
    _checkOutPinCodeController.dispose();
    _checkOutStreetAddressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      // bloc: _businessStaffManagementBloc,
      bloc: widget.businessStaffManagementBloc,
      buildWhen: (previous, current) {
        if (current is BusinessStaffManagementStaffAttendanceByDaySuccessState ||
            current
                is BusinessStaffManagementStaffAttendanceByDayLoadingState ||
            current is BusinessStaffManagementStaffAttendanceByDayErrorState ||
            current
                is BusinessStaffManagementUpdateStaffAttendanceDataLoadingState) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state
            is BusinessStaffManagementUpdateStaffAttendanceDataLoadingState) {
          Utils.successToast(context, "Updating");
        }
        if (state
            is BusinessStaffManagementUpdateStaffAttendanceDataErrorState) {
          Utils.errorToast(context, "Something went wrong");
        }
        if (state
            is BusinessStaffManagementUpdateStaffAttendanceDataSuccessState) {
          Utils.successToast(context, "Updated Successfully");
          // context.router.pop();
          widget.businessStaffManagementBloc.add(
              BusinessStaffManagementGetStaffAttendanceByDayEvent(
                  dateTime: state.date, staffId: state.staffId));
        }
      },
      builder: (context, state) {
        if (state is BusinessStaffManagementStaffAttendanceByDayLoadingState ||
            state
                is BusinessStaffManagementUpdateStaffAttendanceDataLoadingState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
            ),
            body: const AppLoadingWidget(),
          );
        }
        if (state is BusinessStaffManagementStaffAttendanceByDayErrorState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
            ),
            body: const Center(
                child: AppErrorWidget(
              message: "Something went wrong",
            )),
          );
        }
        if (state is BusinessStaffManagementStaffAttendanceByDaySuccessState) {
          final data = state.staffAttendanceByDayModel!.data;
          _attendanceStatusController.text = data?.attendanceStatus ?? "";
          _checkInTimeController.text = data?.checkIn ?? "";
          _checkOutTimeController.text = data?.checkOut ?? "";
          _checkInStreetAddressController.text =
              data?.checkInAddress?.streetAddress ?? "";
          _checkInCityController.text = data?.checkInAddress?.city ?? "";
          _checkInStateController.text = data?.checkInAddress?.state ?? "";
          _checkInPinCodeController.text =
              data?.checkInAddress?.pincode.toString() ?? "";
          _checkOutStreetAddressController.text =
              data?.checkOutAddress?.streetAddress ?? "";
          _checkOutCityController.text = data?.checkOutAddress?.city ?? "";
          _checkOutStateController.text = data?.checkOutAddress?.state ?? "";
          _checkOutPinCodeController.text =
              data?.checkOutAddress?.pincode.toString() ?? "";
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              title: Text(
                  "${data!.attendanceDate!.day}-${data.attendanceDate!.month}-${data.attendanceDate!.year}"),
            ),
            bottomNavigationBar: ButtonBottomNavigationBar(
              title: "Update",
              onTap: () {
                widget.businessStaffManagementBloc
                    // _businessStaffManagementBloc
                    .add(BusinessStaffManagementUpdateStaffAttendanceDataEvent(
                  checkInTime: _checkInTimeController.text,
                  checkOutTime: _checkOutTimeController.text,
                  attendanceStatus: _attendanceStatusController.text,
                  checkInState: _checkInStateController.text,
                  checkInCity: _checkInCityController.text,
                  checkInPinCode: _checkInPinCodeController.text,
                  checkInStreetAddress: _checkInStreetAddressController.text,
                  checkOutState: _checkOutStateController.text,
                  checkOutCity: _checkOutCityController.text,
                  checkOutPinCode: _checkOutPinCodeController.text,
                  checkOutStreetAddress: _checkOutStreetAddressController.text,
                  date: state.staffAttendanceByDayModel!.data!.attendanceDate!,
                  staffId: state.staffAttendanceByDayModel!.data!.staffId!,
                ));
              },
            ),
            body: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(children: [
                      20.h.verticalSpace,
                      ShadowContainerForTiles(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.w,
                        ),
                        child: Row(
                          children: [
                            const Spacer(),
                            Column(
                              children: [
                                Text(
                                  "Attendance Status",
                                  style: AppStyles.inter14400T5,
                                ),
                                10.w.verticalSpace,
                                NormalDropDown(
                                  entries: [
                                    const DropdownMenuEntry(
                                        value: "present", label: "present"),
                                    const DropdownMenuEntry(
                                        value: "paid_leave",
                                        label: "Paid Leave"),
                                    const DropdownMenuEntry(
                                        value: "half_day", label: "Half Day"),
                                  ],
                                  hintText: _attendanceStatusController.text,
                                  width: 250.w,
                                  onSelected: (p0) {
                                    _attendanceStatusController.text = p0;
                                  },
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      // ========== check in check out ====================

                      20.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShadowContainerForTiles(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.w, horizontal: 10.w),
                            child: Column(
                              children: [
                                Text("Check In ",
                                    // textColorGreen
                                    style: AppStyles.inter14400T2.copyWith(
                                      color: AppColors.textColorGreen,
                                    )),
                                10.w.verticalSpace,
                                // Text(
                                //   _checkInTimeController.text,
                                //   style: TextStyle(
                                //     fontSize: 20.sp,
                                //     fontFamily: 'Inter',
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // ),
                                SizedBox(
                                    width: 140.w,
                                    child: TextField(
                                      controller: _checkInTimeController,
                                    )),
                              ],
                            ),
                          ),
                          ShadowContainerForTiles(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 10.w,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Check out",
                                  style: AppStyles.inter14400T2.copyWith(
                                    color: AppColors.textColorRed,
                                  ),
                                ),
                                10.w.verticalSpace,
                                // Text(
                                //   _checkOutTimeController.text,
                                //   style: TextStyle(
                                //     fontSize: 18.sp,
                                //     fontFamily: 'Inter',
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // ),
                                SizedBox(
                                    width: 140.w,
                                    child: TextField(
                                      controller: _checkOutTimeController,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // ================

                      20.h.verticalSpace,
                      // check in address

                      ShadowContainerForTiles(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.w, horizontal: 10.w),
                        child: Column(
                          children: [
                            Text(
                              "Check In Address",
                              style: AppStyles.inter14400T2.copyWith(
                                color: AppColors.textColorGreen,
                              ),
                            ),
                            10.w.verticalSpace,
                            // Text(
                            //   "${data.checkInAddress!.streetAddress}, ${data.checkInAddress!.city},\n ${data.checkInAddress!.state}, ${data.checkInAddress!.pincode}",
                            //   style: TextStyle(
                            //     fontSize: 20.sp,
                            //     fontFamily: 'Inter',
                            //     fontWeight: FontWeight.w400,
                            //   ),
                            // ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: NormalTextField(
                                  controller: _checkInStreetAddressController,
                                  label: "Street",
                                )),
                                20.w.horizontalSpace,
                                Flexible(
                                    child: NormalTextField(
                                  controller: _checkInCityController,
                                  label: "City",
                                )),
                              ],
                            ),
                            10.h.verticalSpace,
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: NormalTextField(
                                  controller: _checkInPinCodeController,
                                  inputType: TextInputType.number,
                                  label: "PIN",
                                )),
                                20.w.horizontalSpace,
                                Flexible(
                                    child: NormalTextField(
                                  controller: _checkInStateController,
                                  label: "State",
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // ================

                      20.h.verticalSpace,
                      // checkout address

                      ShadowContainerForTiles(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.w, horizontal: 10.w),
                        child: Column(
                          children: [
                            Text(
                              "Check Out Address",
                              style: AppStyles.inter14400T2.copyWith(
                                color: AppColors.textColorRed,
                              ),
                            ),
                            10.w.verticalSpace,
                            // Text(
                            //   "${data.checkOutAddress!.streetAddress}, ${data.checkOutAddress!.city},\n ${data.checkOutAddress!.state}, ${data.checkOutAddress!.pincode}",
                            //   style: TextStyle(
                            //     fontSize: 20.sp,
                            //     fontFamily: 'Inter',
                            //     fontWeight: FontWeight.w400,
                            //   ),
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: NormalTextField(
                                  controller: _checkOutStreetAddressController,
                                  label: "Street",
                                )),
                                20.w.horizontalSpace,
                                Flexible(
                                    child: NormalTextField(
                                  controller: _checkOutCityController,
                                  label: "City",
                                )),
                              ],
                            ),
                            10.h.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: NormalTextField(
                                  controller: _checkOutPinCodeController,
                                  label: "PIN",
                                  inputType: TextInputType.number,
                                )),
                                20.w.horizontalSpace,
                                Flexible(
                                    child: NormalTextField(
                                  controller: _checkOutStateController,
                                  label: "State",
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // =======================
                    ]),
                  ),
                ),
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
          ),
        );
      },
    );
  }
}

class InfoRow extends StatelessWidget {
  InfoRow({
    super.key,
    required this.title,
    required this.subtitle,
  });
  String? title;
  String? subtitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title ?? "N/A"), Text(subtitle ?? "N/A")],
    );
  }
}

/**
 Scaffold(
      appBar: AppBar(
        title: Text("Attendence Detail"),
      ),
      body: CircularProgressIndicator(),
    )
 */
