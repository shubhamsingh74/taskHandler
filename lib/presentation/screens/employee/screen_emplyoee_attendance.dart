import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickprism/application/employee/employee_attendance/employee_attendance_bloc.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/presentation/screens/employee/widgets/customAppBar.dart';
import 'package:quickprism/presentation/screens/employee/widgets/custom_drawer_bar.dart';
import 'package:quickprism/presentation/widgets/calendor/app_calendor.dart';
import 'package:quickprism/presentation/widgets/error_widget/error_widget.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';

class ScreenEmployeeAttendance extends StatefulWidget {
  const ScreenEmployeeAttendance({super.key});

  @override
  State<ScreenEmployeeAttendance> createState() =>
      _ScreenEmployeeAttendanceState();
}

class _ScreenEmployeeAttendanceState extends State<ScreenEmployeeAttendance> {
  DateTime focusedDate = DateTime.now();
  List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July',
    'August', 'September', 'October', 'November', 'December'
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  EmployeeAttendanceBloc employeeAttendanceBloc = getIt<EmployeeAttendanceBloc>();

  @override
  void initState() {
    employeeAttendanceBloc.add(EmployeeGetAttendanceByMonthEvent(
      staffId: "1",
      month: "2",
      year: "2023",
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeeAttendanceBloc, EmployeeAttendanceState>(
        bloc: employeeAttendanceBloc,
        buildWhen: (previous, current) {
          if (current is EmployeeAttendanceByMonthLoadingState ||
              current is EmployeeAttendanceByDayErrorState ||
              current is EmployeeAttendanceByMonthSuccessState) {
            return true;
          } else {
            return false;
          }
        },
        listener: (context, state) {
          state.toString().log("stateeStaff");
        },
        builder: (context, state) {
          if (state is EmployeeAttendanceByMonthLoadingState) {
            return const Scaffold(
              body: AppLoadingWidget(),
            );
          }
          if (state is EmployeeAttendanceByDayErrorState) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.white,
              ),
              body: const Center(child: AppErrorWidget()),
            );
          }

          if (state is EmployeeAttendanceByMonthSuccessState) {
            return Scaffold(
              key: _scaffoldKey,
              drawer: CustomDrawerBar(),
              body: Stack(
                children: [
                  SvgPicture.asset(
                    AppAssets.iconsEmpDash,
                    height: 1.sh,
                    width: 1.sw,
                    fit: BoxFit.fill,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w)
                              .copyWith(top: 40.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///----appbar
                              CustomAppBar(
                                onTap: () {
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                              ),
                              15.verticalSpace,
                              Text(
                                "Attendance Records",
                                style: AppStyles.inter6002206032B,
                              ),
                              15.verticalSpace,

                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Material(
                                        elevation: 10,
                                        shadowColor: Colors.grey,
                                        borderRadius: BorderRadius.circular(16),
                                        child: Container(
                                          padding:  EdgeInsets.symmetric(
                                                  vertical: 12.h, horizontal: 15.w)
                                              .copyWith(top: 5.h),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.totalDaysEmployeeWorks.toString()??"",
                                                style:
                                                    AppStyles.tabSaleTextTitle,
                                              ),
                                              Text(
                                                "Recorded Attendance for\n${months[focusedDate.month-1]} ${focusedDate.year}",
                                                style: AppStyles
                                                    .tabSaleTextTitleSub,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Material(
                                        elevation: 10,
                                        shadowColor: Colors.grey,
                                        borderRadius: BorderRadius.circular(16),
                                        child: Container(
                                          padding:  EdgeInsets.symmetric(
                                                  vertical: 40.h, horizontal: 15.w)
                                              .copyWith(top: 5.h),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              gradient: const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color(0xffF29090),
                                                    Color(0xffFB6A6A),
                                                  ])),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "3",
                                                style:
                                                    AppStyles.tabSaleTextTitle,
                                              ),
                                              Text(
                                                "Recorded Leaves",
                                                style: AppStyles
                                                    .tabSaleTextTitleSub,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        0.015.sh.verticalSpace,

                        ///----attendance record
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 25),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Record Attendance",
                                  style: AppStyles.activeTabStyleAttendanceText,
                                ),
                                0.02.sh.verticalSpace,
                                Material(
                                  elevation: 10,
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        gradient: const LinearGradient(colors: [
                                          Color(0xff097382),
                                          Color(0xff0C8798),
                                        ])),
                                    child: AppCalendar(
                                      joinedDay: UserConstants.employeeDetails?.employeeProfile?.createdAt,
                                      staffMemberAttendanceList:
                                          state.attendanceMap,
                                      onDaySelected: (p0, p1) {
                                        employeeAttendanceBloc.add(
                                            EmployeeGetAttendanceByDayEvent(
                                                staffId: "1", dateTime: p0));

                                        print("Donee");
                                      },
                                      // onPageChanged: (p0) {
                                      //   focusedDate = p0;
                                      //   employeeAttendanceBloc.add(
                                      //       EmployeeGetAttendanceByMonthEvent(
                                      //           staffId: "1",
                                      //           month: p0.month.toString(),
                                      //           year: p0.year.toString()));
                                      // },
                                      focusedDay: focusedDate,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        ///----textfields of this screens
                        BlocBuilder(
                            bloc: employeeAttendanceBloc,
                            builder: (context, state) {
                              if (state
                                  is EmployeeAttendanceByDayLoadingState) {
                                return const SizedBox();
                              }
                              if (state is EmployeeAttendanceByDayErrorState) {
                                return const SizedBox();
                              }
                              if (state
                                  is EmployeeAttendanceByDaySuccessState) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 25)
                                          .copyWith(top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Date",
                                          style: AppStyles.activeTabText),
                                      customDateTextfieldWidget(
                                          title: state
                                                  .employeeDayAttendanceModel
                                                  .data
                                                  ?.attendanceDate
                                                  .toString() ??
                                              ""),
                                      Text("Check In Time",
                                          style: AppStyles.activeTabText),
                                      customDateTextfieldWidget(
                                          title: state.employeeDayAttendanceModel.data?.checkIn.toString() ??""),
                                      Text("Check Out Time",
                                          style: AppStyles.activeTabText),
                                      customDateTextfieldWidget(
                                          title: state.employeeDayAttendanceModel.data?.checkOut.toString()??""),
                                      Text("Onsite/Offsite",
                                          style: AppStyles.activeTabText),
                                      customDateTextfieldWidget(
                                          title: "Onsite"),
                                      Text("Location",
                                          style: AppStyles.activeTabText),
                                      InkWell(
                                        splashFactory: NoSplash.splashFactory,
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, bottom: 25),
                                          child: Material(
                                            elevation: 10,
                                            shadowColor: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15,
                                                      horizontal: 20),
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                    colors: [
                                                      Color(0xff09707E),
                                                      Color(0xff0D8EA0),
                                                    ]),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Text(
                                                "Record Location",
                                                style: AppStyles
                                                    .activeTabTimingText
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return const SizedBox();
                            })
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          return const Scaffold();
        });
  }

  customDateTextfieldWidget({required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 5).copyWith(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffEDEFF1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: AppStyles.activeTabTimingText,
      ),
    );
  }
}
