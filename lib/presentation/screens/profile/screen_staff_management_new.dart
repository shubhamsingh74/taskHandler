import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/presentation/widgets/appbar/main_app_bar_business.dart';
import 'package:quickprism/presentation/widgets/floating_action_button/app_floating_action_button.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';
import 'package:quickprism/presentation/widgets/form_fields/search_text_field.dart';
import 'package:quickprism/presentation/widgets/normal_dropdown/normal_dropdown.dart';
import 'package:quickprism/presentation/widgets/svg_icon_widget/svg_icon_widget.dart';

import 'staff/screen_add_employee.dart';

class ScreenStaffManagementNew extends StatefulWidget {
  const ScreenStaffManagementNew({super.key});

  @override
  State<ScreenStaffManagementNew> createState() =>
      _ScreenStaffManagementNewState();
}

class _ScreenStaffManagementNewState extends State<ScreenStaffManagementNew> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBarBusiness(isLoading: false),
      floatingActionButton: AppFloatingActionButtonEmployee(
        onTap: () async {
          ///------testing purpose
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenAddEmployee(),
              ));
        },
        icon: const Icon(Icons.add),
        label: 'Add Employee',
      ),
      body: Stack(
        children: [
          SvgPicture.asset(
            AppAssets.imageEmplyoeeBack,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(70.r),
                  color: Colors.transparent,
                  shadowColor: Colors.blue.withOpacity(0.4),
                  child: MainSearchTextFieldStaffManagementDashBord(
                    controller: _searchController,
                    margin: EdgeInsets.zero,
                    hintText: "Search Items",
                  ),
                ),
                25.h.verticalSpace,
                Text(
                  "Welcome to the Team Management \nSection of your Business.",
                  style: AppStyles.emplyoeeText,
                  textAlign: TextAlign.center,
                ),
                25.h.verticalSpace,
                Material(
                  elevation: 10,
                  color: Colors.white,
                  shadowColor: Colors.blue.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10.r),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 25.sp, vertical: 30.sp),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "1500",
                          style: AppStyles.totalEmplyoeeNumber,
                        ),
                        Text(
                          "Total Employees",
                          style: AppStyles.emplyoeeTotal,
                        ),
                      ],
                    ),
                  ),
                ),
                20.h.verticalSpace,
                Image.asset(
                  AppAssets.imageStaffOfficeTime,
                  height: 273.sp,
                  width: 331.sp,
                  fit: BoxFit.fill,
                ),
                20.h.verticalSpace,
                Text(
                  "Add your staff and invite them to \nmanage your stores.",
                  style: AppStyles.staffManagementText,
                  textAlign: TextAlign.center,
                ),
                15.h.verticalSpace,
                20.h.verticalSpace,
              ],
            ),
          )
        ],
      ),
    );
  }
}

///---------screen add QPID Emplyoee staff management
///


///---------screen add emplyoee details staff management
///


///-------------screen emplyoee added succcessfully
class ScreenEmplyoeeAddedSuccessFully extends StatefulWidget {
  ScreenEmplyoeeAddedSuccessFully({super.key});

  @override
  State<ScreenEmplyoeeAddedSuccessFully> createState() =>
      _ScreenEmplyoeeAddedSuccessFullyState();
}

class _ScreenEmplyoeeAddedSuccessFullyState
    extends State<ScreenEmplyoeeAddedSuccessFully> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AppFloatingActionButtonEmployee(
        label: 'Create Task',
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onTap: () {
          ///---check the flow
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenTaksAddedSuccessFully(),
              ));
        },
      ),
      body: Stack(
        children: [
          SvgPicture.asset(
            AppAssets.imageEmplyoeeBack,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp)
                      .copyWith(top: 40.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customAppBarStaffManagement(context: context),
                      30.h.verticalSpace,
                      Text(
                        "Team Management",
                        style: AppStyles.purchaseTextAddMoreTitle,
                        textAlign: TextAlign.start,
                      ),
                      5.h.verticalSpace,
                      Text(
                        "Employee Added Succesfully!",
                        style: AppStyles.staffNameTextSubHeadingText,
                      ),
                      10.h.verticalSpace,

                      ///----search bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            elevation: 10,
                            borderRadius: BorderRadius.circular(74.r),
                            color: Colors.transparent,
                            shadowColor: Colors.blue.withOpacity(0.3),
                            child: MainSearchTextFieldStaffManagement(
                              controller: _searchController,
                              margin: EdgeInsets.zero,
                              hintText: "Search Employees",
                            ),
                          ),
                          InkWell(
                              splashFactory: NoSplash.splashFactory,
                              onTap: () {},
                              child: Image.asset(
                                AppAssets.imageFilterList,
                                height: 24.sp,
                                width: 24.sp,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                      20.h.verticalSpace,
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.sp, horizontal: 20.sp),
                          child: Material(
                            elevation: 10,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                            shadowColor: Colors.blue.withOpacity(0.6),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.sp, vertical: 20.sp),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 3.sp),
                                    child: Material(
                                      elevation: 10,
                                      shadowColor: Colors.blue.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(100),
                                      child: CircleAvatar(
                                        radius: 20.r,
                                        backgroundImage: const NetworkImage(
                                            "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                                      ),
                                    ),
                                  ),
                                  10.h.horizontalSpace,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Gaurav ",
                                        style: AppStyles.staffNameText,
                                      ),
                                      5.h.verticalSpace,
                                      Row(
                                        children: [
                                          Text(
                                            "Manager",
                                            style: AppStyles
                                                .staffNameTextSubHeadingDown,
                                          ),
                                          7.h.horizontalSpace,
                                          Image.asset(
                                            AppAssets.imageStoreImage,
                                            height: 11,
                                            width: 11,
                                            color: AppColors
                                                .primaryBlue125D99,
                                            fit: BoxFit.fill,
                                          ),
                                          3.h.horizontalSpace,
                                          Text(
                                            "Store 1",
                                            style: AppStyles
                                                .staffNameTextSubHeadingDown,
                                          ),
                                        ],
                                      ),
                                      5.h.verticalSpace,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                AppAssets.imageEventAvailable,
                                                height: 16,
                                                width: 16,
                                                fit: BoxFit.fill,
                                              ),
                                              2.h.horizontalSpace,
                                              Text(
                                                "90/110",
                                                style: AppStyles
                                                    .staffNameTextSubHeading
                                                    .copyWith(fontSize: 12.sp),
                                              ),
                                            ],
                                          ),
                                          5.h.horizontalSpace,
                                          Row(
                                            children: [
                                              Image.asset(
                                                AppAssets.imageSplitSCreen,
                                                height: 13.5.sp,
                                                width: 13.5.sp,
                                                fit: BoxFit.fill,
                                              ),
                                              2.h.horizontalSpace,
                                              Text(
                                                "5 Tasks done / 12 Assigned",
                                                style: AppStyles
                                                    .staffNameTextSubHeading
                                                    .copyWith(fontSize: 12.sp),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      10.h.verticalSpace,
                                      customRowButtonWidget(),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget customRowButtonWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () {},
          child: Material(
            elevation: 10,
            shadowColor: Colors.blue.withOpacity(0.6),
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 12.sp),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue125D99,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.imageBadgeEmployee,
                    height: 19.sp,
                    width: 20.sp,
                    fit: BoxFit.fill,
                  ),
                  5.h.horizontalSpace,
                  Text(
                    "Manage Employee",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        10.h.horizontalSpace,
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () {},
          child: Material(
            elevation: 10,
            shadowColor: Colors.blue.withOpacity(0.6),
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 12.sp),
              decoration: BoxDecoration(
                color: const Color(0xffDDEFFE),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.imageEditEmplyoee,
                    height: 10.sp,
                    width: 10.sp,
                    fit: BoxFit.fill,
                  ),
                  5.h.horizontalSpace,
                  Text(
                    "Edit",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryBlue125D99,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

///-------------screen task added succcessfully
class ScreenTaksAddedSuccessFully extends StatefulWidget {
  const ScreenTaksAddedSuccessFully({super.key});

  @override
  State<ScreenTaksAddedSuccessFully> createState() =>
      _ScreenTaksAddedSuccessFullyState();
}

class _ScreenTaksAddedSuccessFullyState
    extends State<ScreenTaksAddedSuccessFully> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            AppAssets.imageEmplyoeeBack,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp)
                      .copyWith(top: 40.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customAppBarStaffManagement(context: context),
                      30.h.verticalSpace,
                      Text(
                        "Team Management",
                        style: AppStyles.purchaseTextAddMoreTitle,
                        textAlign: TextAlign.start,
                      ),
                      5.h.verticalSpace,
                      Text(
                        "Task Assigned Successfully!",
                        style: AppStyles.staffNameTextSubHeadingText,
                      ),
                      10.h.verticalSpace,

                      ///----search bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            elevation: 10,
                            borderRadius: BorderRadius.circular(74.r),
                            color: Colors.transparent,
                            shadowColor: Colors.blue.withOpacity(0.3),
                            child: MainSearchTextFieldStaffManagement(
                              controller: _searchController,
                              margin: EdgeInsets.zero,
                              hintText: "Search Tasks",
                            ),
                          ),
                          InkWell(
                              splashFactory: NoSplash.splashFactory,
                              onTap: () {},
                              child: Image.asset(
                                AppAssets.imageFilterList,
                                height: 24.sp,
                                width: 24.sp,
                                fit: BoxFit.fill,
                              ))
                        ],
                      ),
                      20.h.verticalSpace,
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.sp, horizontal: 20.sp),
                          child: Material(
                            elevation: 10,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            shadowColor: Colors.blue.withOpacity(0.3),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.sp, vertical: 20.sp),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 3.sp),
                                    child: Material(
                                      elevation: 10,
                                      shadowColor: Colors.blue.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(100),
                                      child: CircleAvatar(
                                        radius: 12.r,
                                        backgroundColor: index == 0
                                            ? Colors.red
                                            : index == 1
                                                ? Colors.orange
                                                : Colors.yellow,
                                      ),
                                    ),
                                  ),
                                  10.h.horizontalSpace,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Update Inventory",
                                        style: AppStyles.staffNameText,
                                      ),
                                      5.h.verticalSpace,
                                      Row(
                                        children: [
                                          Text(
                                            "Assigned to Gaurav",
                                            style: AppStyles
                                                .staffNameTextSubHeadingDown,
                                          ),
                                          10.h.horizontalSpace,
                                          Image.asset(
                                            AppAssets.imageStoreImage,
                                            height: 11,
                                            width: 11,
                                            color: AppColors
                                                .primaryBlue125D99,
                                            fit: BoxFit.fill,
                                          ),
                                          3.h.horizontalSpace,
                                          Text(
                                            "Store 1",
                                            style: AppStyles
                                                .staffNameTextSubHeadingDown,
                                          ),
                                        ],
                                      ),
                                      5.h.verticalSpace,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                AppAssets.imageLowPriority2,
                                                height: 13,
                                                width: 14,
                                                fit: BoxFit.fill,
                                              ),
                                              2.h.horizontalSpace,
                                              Text(
                                                "Inventory",
                                                style: AppStyles
                                                    .staffNameTextSubHeading,
                                              ),
                                            ],
                                          ),
                                          35.h.horizontalSpace,
                                          Row(
                                            children: [
                                              Image.asset(
                                                AppAssets.imageLowPriority,
                                                height: 14.sp,
                                                width: 14.sp,
                                                fit: BoxFit.fill,
                                              ),
                                              2.h.horizontalSpace,
                                              Text(
                                                index == 0
                                                    ? "High Priority"
                                                    : index == 1
                                                        ? "Intermediate"
                                                        : "Low",
                                                style: AppStyles
                                                    .staffNameTextSubHeading,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      10.h.verticalSpace,
                                      customRowButtonWidget(onTap: () {
                                        ///----testing purpose
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ScreenManageEmployee(),
                                            ));
                                      }),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget customRowButtonWidget({required VoidCallback onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: onTap,
          child: Material(
            elevation: 10,
            shadowColor: Colors.blue.withOpacity(0.6),
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 12.sp),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue125D99,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.imageBadgeEmployee,
                    height: 19.sp,
                    width: 20.sp,
                    fit: BoxFit.fill,
                  ),
                  5.h.horizontalSpace,
                  Text(
                    "Manage Employee",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        10.h.horizontalSpace,
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () {},
          child: Material(
            elevation: 10,
            shadowColor: Colors.blue.withOpacity(0.7),
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 12.sp),
              decoration: BoxDecoration(
                color: const Color(0xffDDEFFE),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.imageEditEmplyoee,
                    height: 10.sp,
                    width: 10.sp,
                    fit: BoxFit.fill,
                  ),
                  5.h.horizontalSpace,
                  Text(
                    "Edit",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryBlue125D99,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

///---------screen manage employee
class ScreenManageEmployee extends StatefulWidget {
  const ScreenManageEmployee({super.key});

  @override
  State<ScreenManageEmployee> createState() => _ScreenManageEmployeeState();
}

class _ScreenManageEmployeeState extends State<ScreenManageEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imageAddEmployeeBack,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 40.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customAppBarStaffManagement(context: context),
                20.h.verticalSpace,
                Text(
                  "Manage Employee",
                  style: AppStyles.barlow700203A3838,
                  textAlign: TextAlign.start,
                ),
                7.h.verticalSpace,
                Row(
                  children: [
                    Image.asset(
                      AppAssets.imageArrowLeft,
                      height: 28.h,
                      width: 30.h,
                      fit: BoxFit.fill,
                    ),
                    10.w.horizontalSpace,
                    Text(
                      "Employee Profile",
                      style: AppStyles.inter60018282828,
                    ),
                  ],
                ),
                20.h.verticalSpace,

                ///-------employee profile tab
                Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 3.sp),
                        child: Material(
                          elevation: 10,
                          shadowColor: Colors.blue.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(100.r),
                          child: CircleAvatar(
                            radius: 18.r,
                            backgroundImage: const NetworkImage(
                                "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                          ),
                        ),
                      ),
                      10.h.horizontalSpace,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Gaurav ",
                                style: AppStyles.inter60017242323,
                              ),
                              110.w.horizontalSpace,
                              customPresentButtonWidget(onTap: () {}),
                            ],
                          ),
                          5.h.verticalSpace,
                          Row(
                            children: [
                              Text(
                                "Manager",
                                style: AppStyles.staffNameTextSubHeadingDown,
                              ),
                              10.h.horizontalSpace,
                              Image.asset(
                                AppAssets.imageStoreImage,
                                height: 11,
                                width: 11,
                                color: AppColors.primaryBlue125D99,
                                fit: BoxFit.fill,
                              ),
                              3.h.horizontalSpace,
                              Text(
                                "Store 1",
                                style: AppStyles.staffNameTextSubHeadingDown,
                              ),
                            ],
                          ),
                          5.h.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                AppAssets.imageEventAvailable,
                                height: 16,
                                width: 16,
                                fit: BoxFit.fill,
                              ),
                              2.h.horizontalSpace,
                              Text(
                                "90/110",
                                style: AppStyles.staffNameTextSubHeadingDown,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    AppAssets.imageSplitSCreen,
                                    height: 13.5.sp,
                                    width: 13.5.sp,
                                    fit: BoxFit.fill,
                                  ),
                                  2.h.horizontalSpace,
                                  Text(
                                    "5 Tasks done/12",
                                    style:
                                        AppStyles.staffNameTextSubHeadingDown,
                                  ),
                                ],
                              ),
                              7.w.horizontalSpace,
                              customCreateButtonWidget(onTap: () {}),
                            ],
                          ),
                          10.h.verticalSpace,
                        ],
                      )
                    ],
                  ),
                ),
                10.h.verticalSpace,

                ///---employee attendance tab
                Column(
                  children: [
                    Text(
                      "Attendance Record",
                      style: AppStyles.attendanceTitle,
                      textAlign: TextAlign.center,
                    ),
                    10.h.verticalSpace,
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(30.r),
                      shadowColor: Colors.blue.withOpacity(0.5),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 10.h)
                            .copyWith(top: 15.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            gradient: const LinearGradient(colors: [
                              Color(0xff125D99),
                              Color(0xff1C73B9),
                            ])),
                        child: Column(
                          children: [
                            Text(
                              "JANUARY 2024",
                              style: AppStyles.monthText,
                            ),
                            2.h.verticalSpace,
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: 31,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 7,
                                mainAxisSpacing: 2.0,
                                crossAxisSpacing: 2.0,
                              ),
                              itemBuilder: (context, index) {
                                index = index + 1;
                                return InkWell(
                                  splashFactory: NoSplash.splashFactory,
                                  onTap: () {},
                                  child: Material(
                                    elevation: (index == 16 ||
                                            index == 10 ||
                                            index == 11 ||
                                            index == 25)
                                        ? 10
                                        : 0,
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.transparent,
                                    child: Container(
                                        margin: const EdgeInsets.all(2),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: index == 25
                                              ? Colors.white
                                              : (index == 16 ||
                                                      index == 10 ||
                                                      index == 11)
                                                  ? Colors.red
                                                  : null,
                                        ),
                                        child: Text(
                                          index.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11.sp,
                                            color: index == 25
                                                ? const Color(0xff063540)
                                                    .withOpacity(0.7)
                                                : Colors.white,
                                          ),
                                        )),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                15.h.verticalSpace,

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
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      const Color(0xffEA1B1B).withOpacity(0.2),
                                      const Color(0xffD65555).withOpacity(0.2),
                                    ])),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "3",
                                  style: AppStyles.tabSaleTextTitle,
                                ),
                                Text(
                                  "Recorded Leaves",
                                  style: AppStyles.tabSaleTextTitleSub,
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
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "21",
                                  style: AppStyles.tabSaleTextTitle,
                                ),
                                Text(
                                  "Recorded Attendance \nfor January 2023",
                                  style: AppStyles.tabSaleTextTitleSub,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget customCreateButtonWidget({required VoidCallback onTap}) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Material(
        elevation: 10,
        shadowColor: Colors.blue.withOpacity(0.6),
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
          decoration: BoxDecoration(
            color: AppColors.primaryBlue125D99,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Image.asset(
                AppAssets.imageDocsAddOn,
                height: 19.h,
                width: 19.w,
                fit: BoxFit.fill,
              ),
              5.h.horizontalSpace,
              Text(
                "Create Task",
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  customPresentButtonWidget({required VoidCallback onTap}) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Material(
        elevation: 10,
        shadowColor: Colors.green.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xff78FA7D),
                  const Color(0xff08C610).withOpacity(0.54),
                ]),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            "Present",
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xff034109),
            ),
          ),
        ),
      ),
    );
  }
}

///-------appbar for this screen.
customAppBarStaffManagement({required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(100.r),
        shadowColor: Colors.blue.withOpacity(0.8),
        child: Container(
          padding: EdgeInsets.all(8.sp),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff125D99),
          ),
          child: AppSvgIconWidget(
            iconPath: AppAssets.imageAppBarLines,
            size: 50,
            color: Colors.white,
            onTap: () {
              context.router.back();
            },
          ),
        ),
      ),
      10.horizontalSpace,
      Text(
        "B-Name",
        style: AppStyles.createITemTitleSTyle.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 25,
            color: const Color(0xff2E4251)),
      ),
      const Spacer(),
      InkWell(
        splashFactory: NoSplash.splashFactory,
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppColors.itemstoreColor2, width: 1)),
          child: Row(
            children: [
              const AppSvgIconWidget(
                iconPath: AppAssets.storeIcon,
                size: 15,
                color: AppColors.storeColor1,
              ),
              Text(
                "Store1",
                style: AppStyles.storeTitle,
              ),
              15.horizontalSpace,
              const AppSvgIconWidget(
                iconPath: AppAssets.iconsDown,
                size: 10,
              )
            ],
          ),
        ),
      ),
      10.horizontalSpace,
      InkWell(
          onTap: () {},
          splashFactory: NoSplash.splashFactory,
          child: const CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(
              AppAssets.imageGirlImage,
            ),
          )),
      // AppSvgIconWidget(
      //   onTap: () {},
      //   iconPath: AppAssets.iconsSetting,
      //   size: 24,
      //   color: Colors.black45,
      // )
    ],
  );
}
