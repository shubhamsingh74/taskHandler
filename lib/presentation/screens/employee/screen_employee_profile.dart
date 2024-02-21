import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/employee/employee_profile/employee_profile_bloc.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/presentation/screens/employee/widgets/customAppBar.dart';
import 'package:quickprism/presentation/screens/employee/widgets/custom_drawer_bar.dart';
import 'package:quickprism/presentation/widgets/calendor/app_calendor.dart';
import 'package:quickprism/presentation/widgets/error_widget/error_widget.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';

import '../../../domain/user/user_constants.dart';
import '../../../infrastructure/auth/auth_service.dart';
import '../../../infrastructure/routing/app_router.dart';

class ScreenEmployeeProfile extends StatefulWidget {
  const ScreenEmployeeProfile({super.key});

  @override
  State<ScreenEmployeeProfile> createState() => _ScreenEmployeeProfileState();
}

class _ScreenEmployeeProfileState extends State<ScreenEmployeeProfile> {
  DateTime focusedDate = DateTime.now();
  EmployeeProfileBloc employeeProfileBloc = getIt<EmployeeProfileBloc>();
  Map<DateTime, String> mp = {};

  @override
  void initState() {
    employeeProfileBloc.add(EmployeeProfileAttendanceByMonthEvent(
      staffId: "1",
      month: "2",
      year: "2023",
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeeProfileBloc, EmployeeProfileState>(
        bloc: employeeProfileBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is EmployeeProfileAttendanceByMonthLoadingState) {
            return const Scaffold(
              body: AppLoadingWidget(),
            );
          }
          if (state is EmployeeProfileAttendanceByDayErrorState) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.white,
              ),
              body: const Center(child: AppErrorWidget()),
            );
          }
          if (state is EmployeeProfileAttendanceByMonthSuccessState) {
            for (var t in state.employeeMonthAttendanceModel.data!) {
              mp.addAll({
                DateTime.utc(t.attendanceDate!.year, t.attendanceDate!.month,
                        t.attendanceDate!.day):
                    t.attendanceStatus.toString().toUpperCase(),
              });
            }
            DateTime dateTime = DateTime.parse(UserConstants.employeeDetails?.employeeProfile?.createdAt.toString() ?? "N/A");
            int month = dateTime.month;
            int year = dateTime.year;
            return Scaffold(
              drawer: CustomDrawerBar(),
              body: Stack(
                children: [
                  Material(
                    elevation: 10,
                    shadowColor: Colors.grey.shade200.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      AppAssets.iconsEmpProfiles,
                      height: 0.42.sh,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25)
                              .copyWith(top: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///----appbar
                              const CustomAppBar(),
                              0.03.sh.verticalSpace,

                              ///---emplyoee profile details
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        Material(
                                          elevation: 10,
                                          borderRadius:
                                              BorderRadius.circular(65.r),
                                          shadowColor: Colors.grey,
                                          child: const CircleAvatar(
                                              radius: 65,
                                              backgroundColor:
                                                  Colors.transparent,
                                              backgroundImage: NetworkImage(
                                                  "https://media.istockphoto.com/id/1406197730/photo/portrait-of-a-young-handsome-indian-man.jpg?s=2048x2048&w=is&k=20&c=lDJRQWb0FtKq9R8biMKvGGZVqn0sVGlUHDPoxR83nWc=")),
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          child: Container(
                                            padding: const EdgeInsets.all(3),
                                            decoration: const BoxDecoration(
                                                color: Color(0xff0D93A6),
                                                shape: BoxShape.circle),
                                            child: const Icon(
                                              Icons.add,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    0.01.sh.verticalSpace,
                                    Text(
                                      UserConstants.employeeDetails?.employeeProfile?.empName ?? "N/A"
                                          .toString(),
                                      style: AppStyles.emplyoeeAttendanceName,
                                    ),
                                    2.h.verticalSpace,
                                    Text(
                                      "QPID : ${UserConstants.employeeDetails?.employeeProfile?.qpid}",
                                      style:
                                          AppStyles.emplyoeeAttendanceDetails,
                                    ),
                                    2.h.verticalSpace,
                                    Text(
                                      UserConstants.staffManagement?.first.role ?? "N/A",
                                      style:
                                          AppStyles.emplyoeeAttendanceDetails,
                                    ),
                                    2.h.verticalSpace,
                                    Text(
                                      "Employee since : $month,$year",
                                      style:
                                          AppStyles.emplyoeeAttendanceDetails,
                                    ),
                                  ],
                                ),
                              ),

                              ///----emplyoee profile attendance
                              Column(
                                children: [
                                  35.h.verticalSpace,
                                  Text(
                                    "Attendance Record",
                                    style: AppStyles.attendanceTitle,
                                    textAlign: TextAlign.center,
                                  ),
                                  20.h.verticalSpace,
                                  Material(
                                    elevation: 10,
                                    borderRadius: BorderRadius.circular(30),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10)
                                          .copyWith(top: 15),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          gradient:
                                              const LinearGradient(colors: [
                                            Color(0xff097382),
                                            Color(0xff0C8798),
                                          ])),
                                      child: AppCalendar(
                                        staffMemberAttendanceList: mp,

                                        // staffMemberAttendanceList: {
                                        //   DateTime.utc(2024, 02, 07): "PRESENT",
                                        //   DateTime.utc(2024, 02, 05): "HALF_DAY",
                                        //   DateTime.utc(2024, 02, 01): "PAID_LEAVE"
                                        // },

                                        onDaySelected: (p0, p1) {
                                          employeeProfileBloc.add(EmployeeProfileAttendanceByDayEvent(staffId: "1", dateTime: p0));

                                          //print(state.employeeMonthAttendanceModel.data.);
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
                                  ),
                                ],
                              ),

                              0.025.sh.verticalSpace,

                              ///----------attendance record tabs
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Material(
                                        elevation: 10,
                                        shadowColor: Colors.grey,
                                        borderRadius: BorderRadius.circular(16),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                                  vertical: 35, horizontal: 15)
                                              .copyWith(top: 5),
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
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Material(
                                        elevation: 10,
                                        shadowColor: Colors.grey,
                                        borderRadius: BorderRadius.circular(16),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                                  vertical: 15, horizontal: 15)
                                              .copyWith(top: 5),
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xffFFFAFA),
                                                  Color(0xffA6CFFF),
                                                ]),
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
                                                "21",
                                                style:
                                                    AppStyles.tabSaleTextTitle,
                                              ),
                                              Text(
                                                "Recorded Attendance \nfor January 2023",
                                                style: AppStyles
                                                    .tabSaleTextTitleSub,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              40.h.verticalSpace,
                              InkWell(
                                  splashFactory: NoSplash.splashFactory,
                                  onTap: () {},
                                  child: Text(
                                    "Employee Records",
                                    style: AppStyles.profileTabs,
                                  )),
                              10.h.verticalSpace,
                              InkWell(
                                  splashFactory: NoSplash.splashFactory,
                                  onTap: () {},
                                  child: Text(
                                    "Verification",
                                    style: AppStyles.profileTabs,
                                  )),
                              10.h.verticalSpace,
                              InkWell(
                                  splashFactory: NoSplash.splashFactory,
                                  onTap: () {},
                                  child: Text(
                                    "KYC",
                                    style: AppStyles.profileTabs,
                                  )),
                              10.h.verticalSpace,
                              InkWell(
                                  splashFactory: NoSplash.splashFactory,
                                  onTap: () async {
                                    // temporary do it with bloc
                                    context.router
                                        .replaceAll([const RouteSplashNew()]);
                                    UserConstants.currentUser =
                                        UserConstants.currentBusiness =
                                            UserConstants.currentShop = null;
                                    UserConstants.shops = [];
                                    await AuthService().clearUserId();
                                  },
                                  child: Text(
                                    "Logout",
                                    style: AppStyles.profileTabs.copyWith(
                                        color: Colors.red,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  )),
                              0.05.sh.verticalSpace,
                            ],
                          ),
                        )
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
}
