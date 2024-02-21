// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/extensions.dart';
// import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/presentation/widgets/container/shadow_container_for_tile.dart';
import 'package:quickprism/presentation/widgets/error_widget/error_widget.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';
import 'package:quickprism/presentation/widgets/svg_icon_widget/svg_icon_widget.dart';

import '../../../application/business/business_staff_management/business_staff_management_bloc.dart';
import '../../../infrastructure/routing/app_router.dart';
import '../../widgets/calendor/app_calendor.dart';

@RoutePage()
class ScreenStaffMemberProfile extends StatefulWidget {
  final BusinessStaffManagementBloc bloc;
  const ScreenStaffMemberProfile({super.key, required this.bloc});

  @override
  State<ScreenStaffMemberProfile> createState() =>
      _ScreenStaffMemberProfileState();
}

class _ScreenStaffMemberProfileState extends State<ScreenStaffMemberProfile> {
  DateTime focusedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessStaffManagementBloc,
        BusinessStaffManagementState>(
      // bloc: _businessStaffManagementBloc,
      bloc: widget.bloc,
      buildWhen: (previous, current) {
        if (current is BusinessStaffManagementStaffAttendanceByMonthLoadingState ||
            current is BusinessStaffManagementStaffAttendanceByMonthErrorState ||
            current is BusinessStaffManagementStaffAttendanceByMonthSuccessState) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, attendanceState) {
        if (attendanceState
            is BusinessStaffManagementStaffAttendanceByMonthLoadingState) {}
      },
      builder: (context, attendanceState) {
        if (attendanceState
            is BusinessStaffManagementStaffAttendanceByMonthLoadingState) {
          return Scaffold(
            body: AppLoadingWidget(),
          );
        }
        if (attendanceState
            is BusinessStaffManagementStaffAttendanceByMonthErrorState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
            ),
            body: Center(child: AppErrorWidget()),
          );
        }
        if (attendanceState
            is BusinessStaffManagementStaffAttendanceByMonthSuccessState) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                attendanceState.staffName ?? "N/A",
                style: AppStyles.appBar,
              ),
              actions: [
                Text(
                  'QPID: ${attendanceState.qpId}',
                  style: AppStyles.inter50016.copyWith(
                    fontSize: 18.sp,
                  ),
                ),
                8.w.horizontalSpace,
              ],
              backgroundColor: AppColors.white,
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    // DueCard(
                    //   onTap: () async {
                    //     await context.router.push(RoutePaymentStaffMember());
                    //   },
                    // ),
                    AppCalendar(
                      // staffMemberAttendanceList: staffMemberAttendanceList,
                      staffMemberAttendanceList: attendanceState.attendanceMap,
                      onDaySelected: (p0, p1) async {
                        widget.bloc.add(
                            BusinessStaffManagementGetStaffAttendanceByDayEvent(
                                dateTime: p0,
                                staffId: attendanceState.staffId));
                        await context.router
                            .push(RouteStaffMemberDayAttendance(
                                businessStaffManagementBloc: widget.bloc))
                            .then((value) {
                          widget.bloc.add(
                              BusinessStaffManagementGetStaffAttendanceByMonthEvent(
                                  qpId: attendanceState.qpId,
                                  staffId: attendanceState.staffId,
                                  month: focusedDate.month.toString(),
                                  year: focusedDate.year.toString(),
                                  staffName: attendanceState.staffName));
                        });
                      },
                      onPageChanged: (p0) {
                        focusedDate = p0;
                        widget.bloc.add(
                            BusinessStaffManagementGetStaffAttendanceByMonthEvent(
                                month: p0.month.toString(),
                                qpId: attendanceState.qpId,
                                staffId: attendanceState.staffId,
                                staffName: attendanceState.staffName,
                                year: p0.year.toString()));
                      },
                      focusedDay: focusedDate,
                    ),
                    10.h.verticalSpace,
                    LeaveInformationIndicators(),
                    24.h.verticalSpace,
                    EditDetails(),
                  ],
                ),
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: Text(attendanceState.toString()),
          ),
          body: Text(attendanceState.toString()),
        );
      },
    );
  }
}

class LeaveInformationIndicators extends StatelessWidget {
  const LeaveInformationIndicators({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            LeaveIndicator(leaveType: 3),
            3.horizontalSpace,
            Text(
              'Present',
              style: AppStyles.tileStyleSubTitle,
            ),
          ],
        ),
        Row(
          children: [
            LeaveIndicator(leaveType: 0),
            3.horizontalSpace,
            Text(
              'Absent',
              style: AppStyles.tileStyleSubTitle,
            ),
          ],
        ),
        Row(
          children: [
            LeaveIndicator(leaveType: 2),
            3.horizontalSpace,
            Text(
              'Half day',
              style: AppStyles.tileStyleSubTitle,
            ),
          ],
        ),
        Row(
          children: [
            LeaveIndicator(leaveType: 1),
            3.horizontalSpace,
            Text(
              'Paid leave',
              style: AppStyles.tileStyleSubTitle,
            ),
          ],
        ),
      ],
    );
  }
}

class LeaveIndicator extends StatelessWidget {
  final int leaveType;
  const LeaveIndicator({
    Key? key,
    required this.leaveType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return leaveType == 2
        ? Row(
            children: [
              Container(
                width: 7.5.w,
                height: 16.w,
                decoration: BoxDecoration(
                    color: AppColors.employeeAbsent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4.r),
                      topLeft: Radius.circular(4.r),
                    )),
              ),
              Container(
                width: 7.5.w,
                height: 16.w,
                decoration: BoxDecoration(
                    color: AppColors.supportUI11,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(4.r),
                      topRight: Radius.circular(4.r),
                    )),
              ),
            ],
          )
        : Container(
            width: 16.w,
            height: 16.h,
            decoration: ShapeDecoration(
              color: leaveType == 0
                  ? AppColors.employeeAbsent
                  : leaveType == 1
                      ? AppColors.textFieldBorder
                      : leaveType == 3
                          ? AppColors.supportUI11
                          : AppColors.black,
              //
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r)),
            ),
          );
  }
}

class EditDetails extends StatelessWidget {
  const EditDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShadowContainerForTiles(
        padding: EdgeInsets.all(16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Edit details',
              style: AppStyles.inter50016,
            ),
            // SvgPicture.asset(AppAssets.editIcon)
            AppSvgIconWidget(
              iconPath: AppAssets.editIcon,
              color: AppColors.primaryP2,
              onTap: () async {},
            )
          ],
        ));
  }
}

class DueCard extends StatelessWidget {
  final Function()? onTap;
  const DueCard({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ShadowContainerForTiles(
        margin: EdgeInsets.symmetric(vertical: 16.w),
        padding: EdgeInsets.all(12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Total due',
                  style: AppStyles.inter14400T2,
                ),
                Text('₹1500',
                    style: AppStyles.inter16600T1.copyWith(
                      color: Color(0xFFC13831),
                    ))
              ],
            ),
            InkWell(
              onTap: onTap,
              child: Text(
                '+ Payment',
                style: AppStyles.styleInter14500T7,
              ),
            )
          ],
        ));
  }
}
