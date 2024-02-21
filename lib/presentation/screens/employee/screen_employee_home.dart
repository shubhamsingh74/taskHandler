import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickprism/application/employee/employee_dashboard_tasks/employee_dashboard_bloc.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/user/models/employee_checkin_checkout/employee_checkin_checkout_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/presentation/screens/business/transactions/screen_transactions_purchase.dart';
import 'package:quickprism/presentation/screens/employee/screen_employee_profile.dart';
import 'package:quickprism/presentation/screens/employee/screen_employee_task.dart';
import 'package:quickprism/presentation/screens/employee/screen_emplyoee_attendance.dart';
import 'package:quickprism/presentation/screens/employee/widgets/custom_drawer_bar.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class ScreenEmployeeHome extends StatefulWidget {
  const ScreenEmployeeHome({super.key});

  @override
  State<ScreenEmployeeHome> createState() => _ScreenEmployeeHomeState();
}

class _ScreenEmployeeHomeState extends State<ScreenEmployeeHome> {
  EmployeeDashboardBloc employeeDashboardBloc = getIt<EmployeeDashboardBloc>();

  @override
  void initState() {
    employeeDashboardBloc.add(EmployeeGetAllTaskEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeeDashboardBloc, EmployeeDashboardState>(
        bloc: employeeDashboardBloc,
        listener: (context, state) {
          if (state is EmployeeDashboardSuccessState) {
            // state.employeeDashboardStatusModel
            //     .toJson()
            //     .toString()
            //     .log("statee");
          }
          state.toString().log("statee");
        },
        builder: (context, state) {
          if (state is EmployeeDashboardLoadingState) {
            return const Scaffold(
              body: AppLoadingWidget(),
            );
          }
          if (state is EmployeeDashboardSuccessState) {
            //
            // int upComingTasks = 0;
            // int workingTasks = 0;
            // int finishTasks = 0;
            // int dueTasks =0;
            // for (var t in state.employeeDashboardStatusModel.employeeTaskData!) {
            //   if(t.deadline!.isBefore(DateTime.now()) && (t.taskStatus == "Working" || t.taskStatus == "Upcoming")){
            //     dueTasks = dueTasks+1;
            //   }
            //
            //   if(t.taskStatus == "Upcoming"){
            //     upComingTasks = upComingTasks+1;
            //   }else if(t.taskStatus == "Working"){
            //     workingTasks = workingTasks+1;
            //   }else if(t.taskStatus == "Finished"){
            //     finishTasks = finishTasks+1;
            //   }
            // }

            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: const Text("Transparent"),
                elevation: 0,
              ),
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      child: Column(
                        children: [
                          50.h.verticalSpace,
                          Container(
                            // width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 20.h),
                            margin: EdgeInsets.symmetric(
                              vertical: 40.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white, width: 2),
                              color: Colors.grey.shade200.withOpacity(0.5),
                            ),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hey Aligator ,",
                                          style:
                                              AppStyles.activeTabStyleDashText,
                                        ),
                                        Text(
                                          "QPID: ${UserConstants.employeeDetails?.employeeProfile?.qpid}",
                                          style: AppStyles
                                              .activeTabStyleDashTextsub,
                                        ),
                                      ],
                                    ),
                                    customButtonWidget(
                                        onTap: () {
                                          employeeDashboardBloc.add(
                                              EmployeeCheckInCheckOutEvent(
                                                  attendanceStatus: 'present',
                                                  checkInTime: DateTime.now().toString(),
                                                  checkOutTime: DateTime.now().toString(),
                                                  date: Date(date: DateTime.now().toString()),
                                                  employeeCheckInCheckOutModel:
                                                      EmployeeCheckInCheckOutModel()));
                                        },
                                        title: "   Check-in   "),
                                  ],
                                ),
                                10.h.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: customContainerWidgets(
                                        onTap: () {},
                                        number: state.upcomingTasks.length ?? 0,
                                        title: 'Upcoming Tasks',
                                      ),
                                    ),
                                    Flexible(
                                      child: customContainerWidgets(
                                        onTap: () {},
                                        number: state.workingTasks.length ?? 0,
                                        title: 'Currently Working',
                                      ),
                                    ),
                                  ],
                                ),
                                15.h.verticalSpace,
                                customContainerLongWidgets(
                                    onTap: () {},
                                    number: 30,
                                    title: 'Transactions By ${UserConstants.employeeDetails?.employeeProfile?.empName}'),
                                15.h.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: customContainerGradientsWidgets(
                                        onTap: () {},
                                        number: state.dueTasks.length ?? 0 ,
                                        title: 'Tasks Due          ',
                                        color: [
                                          const Color(0xffFFA1A1)
                                              .withOpacity(0.2),
                                          const Color(0xffEE5E5E)
                                              .withOpacity(0.2),
                                        ],
                                        numberColor: const Color(0xffED1616),
                                        titleColor: const Color(0xffFF554A),
                                      ),
                                    ),
                                    Flexible(
                                      child: customContainerGradientsWidgets(
                                          onTap: () {},
                                          number: state.finishedTasks.length ?? 0,
                                          title: 'Tasks Finished  ',
                                          color: [
                                            const Color(0xffBCF9B7)
                                                .withOpacity(0.2),
                                            const Color(0xff19DC08)
                                                .withOpacity(0.2),
                                          ],
                                          numberColor: const Color(0xff097E15),
                                          titleColor: const Color(0xff097E15)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          15.h.verticalSpace,
                          Material(
                            elevation: 10,
                            borderRadius: BorderRadius.circular(30),
                            shadowColor: Colors.grey,
                            child: Container(
                              //padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                              decoration: BoxDecoration(
                                color: const Color(0xffFDFDFD),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 20, bottom: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "CREATE ITEMS",
                                              style: AppStyles.tabSaleText,
                                            ),
                                            2.h.verticalSpace,
                                            Text(
                                              "Purchased Lots",
                                              style: AppStyles.tabSaleSubText,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  AppAssets.imageBagEmp,
                                                  height: 17,
                                                  width: 11,
                                                  fit: BoxFit.fill,
                                                ),
                                                5.h.horizontalSpace,
                                                Text(
                                                  "B-Name",
                                                  style: AppStyles.empTaskbox,
                                                ),
                                                10.h.horizontalSpace,
                                                Image.asset(
                                                  AppAssets.imageBagEmp,
                                                  height: 17,
                                                  width: 11,
                                                  fit: BoxFit.fill,
                                                ),
                                                5.h.horizontalSpace,
                                                Text(
                                                  "Store1",
                                                  style: AppStyles.empTaskbox,
                                                ),
                                              ],
                                            ),
                                            2.h.verticalSpace,
                                            Text(
                                              "Meet : 9:30-11:00 am ",
                                              style:
                                                  AppStyles.tabSaleSubTextMini,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Image.asset(
                                        AppAssets.iconsContainerHand,
                                        height: 131,
                                        width: 112,
                                        fit: BoxFit.fill,
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    right: 100,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 20,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: const Color(0xff53A8F3),
                                              width: 1)),
                                      child: Text(
                                        "Online",
                                        style: AppStyles.tabSaleTexts,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          30.h.verticalSpace
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Scaffold();
        });
  }

  ///----------dashboard work show containers
  customContainerWidgets(
      {required VoidCallback onTap,
      required int number,
      required String title}) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(15.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: const Color(0xffFDFDFD),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number.toString(),
                style: AppStyles.tileStyleTitleDash,
              ),
              FittedBox(
                child: Text(
                  title,
                  style: AppStyles.tileStyleTitleDashText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///----------dashboard work show long containers
  customContainerLongWidgets(
      {required VoidCallback onTap,
      required int number,
      required String title}) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Material(
        elevation: 10,
        color: const Color(0xffFDFDFD),
        borderRadius: BorderRadius.circular(15.r),
        shadowColor: Colors.grey,
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 15.h),
          decoration: BoxDecoration(
            color: const Color(0xffFDFDFD),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                number.toString(),
                style: AppStyles.tileStyleTitleDash,
              ),
              FittedBox(
                child: Text(
                  title,
                  style: AppStyles.tileStyleTitleDashText
                      .copyWith(fontSize: 15.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///----------dashboard work show containers with linear gradients
  customContainerGradientsWidgets(
      {required VoidCallback onTap,
      required int number,
      required String title,
      required Color numberColor,
      required Color titleColor,
      required List<Color> color}) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Material(
        elevation: 10,
        color: const Color(0xffFDFDFD),
        borderRadius: BorderRadius.circular(15.r),
        shadowColor: Colors.grey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: const Color(0xffFDFDFD),
            gradient: LinearGradient(
                colors: color,
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number.toString(),
                style:
                    AppStyles.tileStyleTitleDash.copyWith(color: numberColor),
              ),
              FittedBox(
                child: Text(
                  title,
                  style: AppStyles.tileStyleTitleDashText
                      .copyWith(color: titleColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///check-in  button
  customButtonWidget({required VoidCallback onTap, required String title}) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Material(
        elevation: 5,
        shadowColor: Colors.grey,
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 28.sp),
          decoration: BoxDecoration(
              color: const Color(0xff0D8698),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            title,
            style: AppStyles.activeTabStylebutton,
          ),
        ),
      ),
    );
  }
}

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key, this.isLoading = false});

  final bool isLoading;

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedTab = 0;

  final List _pages = [
    const ScreenEmployeeHome(),
    const ScreenEmployeeTasks(),
    const ScreenEmployeeAttendance(),
    const ScreenEmployeeProfile(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: widget.isLoading
          ? loadingWidget
          : BottomNavigationBar(
              elevation: 10,
              currentIndex: _selectedTab,
              onTap: (index) => _changeTab(index),
              backgroundColor: AppColors.white,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppAssets.iconsEmHome,
                    height: 25,
                    width: 25,
                    fit: BoxFit.fill,
                    color: _selectedTab==0?const Color(0xff4F4F53): const Color(0xff4F4F53).withOpacity(0.5),
                  ),
                  label: 'My lists',
                ),
                 BottomNavigationBarItem(
                  icon: Image(
                    image: const AssetImage(
                      AppAssets.iconsTask,
                    ),
                    height: 28,
                    width: 32,
                    fit: BoxFit.fill,
                    color: _selectedTab==1?const Color(0xff4F4F53): const Color(0xff4F4F53).withOpacity(0.5),
                  ),
                  label: 'Transactions',
                ),
                 BottomNavigationBarItem(
                  icon: Image(
                    image: const AssetImage(
                      AppAssets.iconsAttendance,
                    ),
                    height: 30,
                    width: 28,
                    fit: BoxFit.fill,
                    color: _selectedTab==2?const Color(0xff4F4F53): const Color(0xff4F4F53).withOpacity(0.5),
                  ),
                  label: 'Discover',
                ),
                 BottomNavigationBarItem(
                  icon: Image(
                    image: const AssetImage(
                      AppAssets.iconsProfiles,
                    ),
                    height: 28,
                    width: 32,
                    fit: BoxFit.fill,
                    color: _selectedTab==3?const Color(0xff4F4F53): const Color(0xff4F4F53).withOpacity(0.5),
                  ),
                  label: 'Parties',
                ),
              ],
              selectedItemColor: const Color(0xff454343),
              unselectedItemColor: const Color(0xff454343),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              // unselectedItemColor: AppColors.unselectedItemColor,
              // selectedLabelStyle: AppStyles.navigationStyleSelected.copyWith(fontSize: 12,fontWeight: FontWeight.w600,color: const Color(0xff454343)),
              // unselectedLabelStyle: AppStyles.navigationStyleUnSelected.copyWith(fontSize: 12,fontWeight: FontWeight.w600,color:const Color(0xff454343)),
            ),
    );
  }

  Widget get loadingWidget => SizedBox(
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            4,
            (index) => Shimmer.fromColors(
                baseColor: AppColors.shimmerGrey,
                highlightColor: AppColors.white,
                child: const CircleAvatar()),
          ),
        ),
      );
}
