import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickprism/application/employee/employee_upcoming_tasks/employee_upcoming_tasks_bloc.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/presentation/screens/employee/widgets/customAppBar.dart';
import 'package:quickprism/presentation/screens/employee/widgets/custom_drawer_bar.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';

class ScreenEmployeeTasks extends StatefulWidget {
  const ScreenEmployeeTasks({super.key});

  @override
  State<ScreenEmployeeTasks> createState() => _ScreenEmployeeTasksState();
}

class _ScreenEmployeeTasksState extends State<ScreenEmployeeTasks> {
  EmployeeTasksBloc employeeUpcomingTasksBloc = getIt<EmployeeTasksBloc>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    employeeUpcomingTasksBloc.add(EmployeeGetAllUpcomingTasksEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeeTasksBloc, EmployeeUpcomingTasksState>(
        bloc: employeeUpcomingTasksBloc,
        listener: (context, state) {
          if (state is EmployeeStartWorkingTaskSuccessState) {
            employeeUpcomingTasksBloc.add(EmployeeGetAllUpcomingTasksEvent());
          }
          state.toString().log("state");
        },
        builder: (context, state) {
          if (state is EmployeeTasksLoadingState) {
            return const AppLoadingWidget();
          }
          if (state is EmployeeTasksUpcomingSuccessState) {
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20)
                              .copyWith(top: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///----appbar
                               CustomAppBar(onTap: (){
                                 _scaffoldKey.currentState!.openDrawer();
                               },),
                              0.03.sh.verticalSpace,
                              SizedBox(
                                height: 0.81.sh,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Center(
                                          child: Text(
                                        "Employee Upcoming Tasks",
                                        style: AppStyles.tabSaleTextTab,
                                      )),
                                      0.03.sh.verticalSpace,

                                      ///-----sales division
                                      if (state.salesDivision.isNotEmpty) ...[
                                        Container(
                                          //height: 0.5.sh,
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 20),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            color: Colors.grey.shade200
                                                .withOpacity(0.5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Sales Division",
                                                style: AppStyles
                                                    .activeTabStyleDashTexts,
                                              ),
                                              0.01.sh.verticalSpace,
                                              //Sales Division
                                              ListView.builder(
                                                itemCount: state
                                                        .salesDivision.length ??
                                                    0,
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                scrollDirection: Axis.vertical,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5.sp),
                                                    child:
                                                        customContainerWidget(
                                                            shopId: state
                                                                .salesDivision[
                                                                    index]
                                                                .shopId
                                                                .toString(),
                                                            taskTitle: state
                                                                .salesDivision[
                                                                    index]
                                                                .taskTitle
                                                                .toString(),
                                                            department: 'Sales',
                                                            onTap: () {
                                                              employeeUpcomingTasksBloc
                                                                  .add(
                                                                EmployeeStartWorkingTaskEvent(
                                                                    newStatus:
                                                                        'Working',
                                                                    taskId: state
                                                                        .salesDivision[
                                                                            index]
                                                                        .taskId!
                                                                        .toInt()),
                                                              );
                                                            }),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        20.h.verticalSpace,
                                      ],

                                      ///---------purchase division
                                      if (state
                                          .purchaseDivision.isNotEmpty) ...[
                                        Container(
                                          //height: 0.5.sh,
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 20),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            color: Colors.grey.shade200
                                                .withOpacity(0.5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Purchase Division",
                                                style: AppStyles
                                                    .activeTabStyleDashTexts,
                                              ),
                                              0.01.sh.verticalSpace,
                                              //Sales Division
                                              ListView.builder(
                                                itemCount: state
                                                        .purchaseDivision
                                                        .length ??
                                                    0,
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                scrollDirection: Axis.vertical,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5.sp),
                                                    child:
                                                        customeContainerStockAndAddWidget(
                                                            shopId: state
                                                                .purchaseDivision[
                                                                    index]
                                                                .shopId
                                                                .toString(),
                                                            taskTitle: state
                                                                .purchaseDivision[
                                                                    index]
                                                                .taskTitle
                                                                .toString(),
                                                            department:
                                                                'ADD ITEM LOTS',
                                                            onTap: () {
                                                              employeeUpcomingTasksBloc
                                                                  .add(
                                                                EmployeeStartWorkingTaskEvent(
                                                                    newStatus:
                                                                        'Working',
                                                                    taskId: state
                                                                        .purchaseDivision[
                                                                            index]
                                                                        .taskId!
                                                                        .toInt()),
                                                              );
                                                            }),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        20.h.verticalSpace,
                                      ],

                                      ///---------stock division
                                      if (state.stockDivision.isNotEmpty) ...[
                                        Container(
                                          //height: 0.5.sh,
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 20),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            color: Colors.grey.shade200
                                                .withOpacity(0.5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Stock Divisions",
                                                style: AppStyles
                                                    .activeTabStyleDashTexts,
                                              ),
                                              0.01.sh.verticalSpace,
                                              //Sales Division
                                              ListView.builder(
                                                itemCount: state
                                                        .stockDivision.length ??
                                                    0,
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                scrollDirection: Axis.vertical,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5.sp),
                                                    child:
                                                        customeContainerStockAndAddWidget(
                                                            shopId: state
                                                                .stockDivision[
                                                                    index]
                                                                .shopId
                                                                .toString(),
                                                            taskTitle: state
                                                                .stockDivision[
                                                                    index]
                                                                .taskTitle
                                                                .toString(),
                                                            department:
                                                                'STOCK UPDATE',
                                                            onTap: () {
                                                              employeeUpcomingTasksBloc
                                                                  .add(
                                                                EmployeeStartWorkingTaskEvent(
                                                                    newStatus:
                                                                        'Working',
                                                                    taskId: state
                                                                        .stockDivision[
                                                                            index]
                                                                        .taskId!
                                                                        .toInt()),
                                                              );
                                                            }),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              )
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

  customContainerWidget(
      {required String shopId,
      required String taskTitle,
      required VoidCallback onTap,
      required String department}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(32.r),
        shadowColor: Colors.grey,
        child: Container(
          //padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          decoration: BoxDecoration(
            color: const Color(0xffFDFDFD),
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.sp, top: 20.sp, bottom: 10.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          department,
                          style: AppStyles.tabSaleText,
                        ),
                        2.h.verticalSpace,
                        Text(
                          taskTitle,
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
                              "Store $shopId",
                              style: AppStyles.empTaskbox,
                            ),
                          ],
                        ),
                        2.h.verticalSpace,
                        Text(
                          "Meet : 9:30-11:00 am ",
                          style: AppStyles.tabSaleSubTextMini,
                        ),
                        5.h.verticalSpace,
                        customButtonWidget(
                            onTap: onTap, title: 'Start Working'),
                      ],
                    ),
                  ),
                  Image.asset(
                    AppAssets.iconsContainerHand,
                    height: 155.sp,
                    width: 93.sp,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              Positioned(
                right: 90.sp,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: const Color(0xff53A8F3), width: 1)),
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
    );
  }

  customeContainerStockAndAddWidget(
      {required String shopId,
      required String taskTitle,
      required VoidCallback onTap,
      required String department}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(32.r),
        shadowColor: Colors.grey,
        child: Container(
          //padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          decoration: BoxDecoration(
            color: const Color(0xffFDFDFD),
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 20.sp, top: 20.sp, bottom: 10.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      department,
                      style: AppStyles.tabSaleText,
                    ),
                    2.h.verticalSpace,
                    Text(
                      taskTitle,
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
                          "Store $shopId",
                          style: AppStyles.empTaskbox,
                        ),
                      ],
                    ),
                    2.h.verticalSpace,
                    Text(
                      "Meet : 9:30-11:00 am ",
                      style: AppStyles.tabSaleSubTextMini,
                    ),
                    5.h.verticalSpace,
                    customButtonWidget(onTap: onTap, title: 'Start Working'),
                  ],
                ),
              ),
              Image.asset(
                AppAssets.iconsContainerHand,
                height: 155.sp,
                width: 100.sp,
                fit: BoxFit.fill,
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
      child: Padding(
        padding: EdgeInsets.only(left: 10.sp),
        child: Material(
          elevation: 5,
          shadowColor: Colors.grey,
          borderRadius: BorderRadius.circular(10.r),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
            decoration: BoxDecoration(
                color: const Color(0xff0D8698),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              title,
              style: AppStyles.activeTabStylebutton,
            ),
          ),
        ),
      ),
    );
  }
}
