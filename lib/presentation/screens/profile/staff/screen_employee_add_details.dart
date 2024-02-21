// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/presentation/widgets/appbar/main_app_bar_business.dart';
import 'package:quickprism/presentation/widgets/error_widget/error_widget.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';

import '../../../../application/business/business_staff_management/business_staff_add_employee/business_staff_add_employee_bloc.dart';
import '../../../../core/assets/assets.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/styles/app_styles.dart';
import '../../../../domain/core/di/injectable.dart';
import '../../../../domain/user/models/sub_category_permissions/employee_sub_category_model.dart';
import '../../../widgets/normal_dropdown/normal_dropdown.dart';

@RoutePage()
class ScreenEmployeeAddDetails extends StatefulWidget {
  final int qpid;
  const ScreenEmployeeAddDetails({
    Key? key,
    required this.qpid,
  }) : super(key: key);

  @override
  State<ScreenEmployeeAddDetails> createState() =>
      _ScreenEmployeeAddDetailsState();
}

class _ScreenEmployeeAddDetailsState extends State<ScreenEmployeeAddDetails> {
  BusinessStaffAddEmployeeBloc businessStaffAddEmployeeBloc =
      getIt<BusinessStaffAddEmployeeBloc>();

  List<String> categoryPermissionsList = [];
  List<EmployeeSubCategoryData> subCategoryList = [];
  List<EmployeeSubCategoryData> selectedSubCategoryList = [];
  String? empSite;
  @override
  void initState() {
    super.initState();
    businessStaffAddEmployeeBloc
        .add(BusinessStaffAddEmployeeAddDetailsInitialEvent());
  }

  void updateSubCategoryListAccToSelectedPermission(
      List<EmployeeSubCategoryData> allSubCategoryList) {
    subCategoryList.clear();
    for (var cat in categoryPermissionsList) {
      for (var subCat in allSubCategoryList) {
        if (subCat.categoryName!.toLowerCase().contains(cat.toLowerCase())) {
          subCategoryList.add(subCat);
        }
      }
    }
    categoryPermissionsList.log("catt");
    subCategoryList.log("subCatt");
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessStaffAddEmployeeBloc,
        BusinessStaffAddEmployeeState>(
      bloc: businessStaffAddEmployeeBloc,
      listener: (context, state) {
        // TODO: implement listener
        if (state is BusinessStaffAddEmployeeDetailsState) {
          state.categoryPermissions.toString().log("statee categoryy");
        }
      },
      builder: (context, state) {
        if (state is BusinessStaffAddEmployeeLoadingState) {
          return const Scaffold(
            body: AppLoadingWidget(),
          );
        }
        if (state is BusinessStaffAddEmployeeErrorState) {
          return const Scaffold(
            body: AppErrorWidget(message: "Something went wrong"),
          );
        }
        return Scaffold(
          appBar: MainAppBarBusiness(isLoading: false),
          body: Stack(
            children: [
              SvgPicture.asset(
                AppAssets.imageEmplyoeeBack,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Team Management",
                        style: AppStyles.purchaseTextAddMoreTitle,
                        textAlign: TextAlign.start,
                      ),
                      10.h.verticalSpace,
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              context.popRoute();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 30,
                            ),
                          ),
                          5.h.horizontalSpace,
                          Text(
                            "Add Employee",
                            style: AppStyles.totalEmplyoeeNumberTextTitle,
                          ),
                          const Spacer(),
                          Text(
                            "QPID ${widget.qpid}",
                            style: AppStyles.emplyoeeTextfieldTitle,
                          ),
                          15.h.horizontalSpace,
                        ],
                      ),
                      15.h.verticalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Is your employee working onsite \nor offsite?",
                            style: AppStyles.emplyoeeTextfieldTitleMain,
                          ),
                          4.h.verticalSpace,
                          NormalDropDown(
                            fillcolor: AppColors.itemtextfieldColor,
                            height: 55.sp,
                            onSelected: (p0) {
                              empSite = p0.toString();
                            },
                            // width: 0.75.sw,
                            //  width: double.infinity,
                            hintText: "Onsite/Offsite",
                            entries: [
                              const DropdownMenuEntry(
                                  value: "onsite", label: "Onsite"),
                              const DropdownMenuEntry(
                                  value: "offsite", label: "Offsite"),
                            ],
                          ),
                          10.h.verticalSpace,
                          Text(
                            "Select Category of Permission",
                            style: AppStyles.emplyoeeTextfieldTitleMain,
                          ),
                          4.h.verticalSpace,
                          NormalDropDown(
                            fillcolor: AppColors.itemtextfieldColor,
                            height: 55.sp,
                            hintText: "Select Category ",
                            entries: state
                                    is BusinessStaffAddEmployeeDetailsState
                                ? state.categoryPermissions!
                                    .map((e) =>
                                        DropdownMenuEntry(value: e, label: e))
                                    .toList()
                                : [],
                            onSelected: (p0) {
                              setState(() {
                                if (state
                                    is BusinessStaffAddEmployeeDetailsState) {
                                  categoryPermissionsList.add(p0);
                                  updateSubCategoryListAccToSelectedPermission(
                                      state.subCategoryData!);
                                }
                              });
                            },
                          ),
                          10.h.verticalSpace,
                          Wrap(
                            children: [
                              for (int i = 0;
                                  i < categoryPermissionsList.length;
                                  i++)
                                ShowPermissions(
                                  permissionName: categoryPermissionsList[i],
                                  onTap: () {
                                    setState(() {
                                      if (state
                                          is BusinessStaffAddEmployeeDetailsState) {
                                        categoryPermissionsList.removeAt(i);
                                        updateSubCategoryListAccToSelectedPermission(
                                            state.subCategoryData!);
                                      }
                                    });
                                  },
                                ),
                            ],
                          ),
                          10.h.verticalSpace,
                          Text(
                            "Select Employee Permissions",
                            style: AppStyles.emplyoeeTextfieldTitleMain,
                          ),
                          4.h.verticalSpace,
                          NormalDropDown(
                            fillcolor: AppColors.itemtextfieldColor,
                            height: 55.sp,
                            onSelected: (p0) {
                              setState(() {
                                selectedSubCategoryList.add(p0);
                              });
                            },
                            // width: 0.75.sw,
                            hintText: "Select Permissions",
                            entries: subCategoryList
                                .map((e) => DropdownMenuEntry(
                                    value: e, label: e.subCatName ?? "N/A"))
                                .toList(),
                          ),
                          15.h.verticalSpace,
                          Wrap(
                            children: [
                              for (int i = 0;
                                  i < selectedSubCategoryList.length;
                                  i++)
                                ShowPermissions(
                                  permissionName:
                                      selectedSubCategoryList[i].subCatName ??
                                          "N/A",
                                  onTap: () {
                                    setState(() {
                                      selectedSubCategoryList.removeAt(i);
                                    });
                                  },
                                ),
                            ],
                          ),
                          20.h.verticalSpace,
                          InkWell(
                            splashFactory: NoSplash.splashFactory,
                            onTap: () {
                              ///----testing purpose
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           ScreenEmplyoeeAddedSuccessFully(),
                              //     ));
                              List<int> per = [];
                              for (var element in selectedSubCategoryList) {
                                per.add(element.subCatId ?? 0);
                              }
                              if (empSite != null) {
                                businessStaffAddEmployeeBloc.add(
                                    BusinessStaffAddEmployeeAddDetailsEvent(
                                  empRole: "",
                                  empSite: empSite!,
                                  permissions: per,
                                  qpid: widget.qpid
                                ));
                              }
                            },
                            child: Material(
                              elevation: 10,
                              shadowColor: Colors.blue.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10.r),
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    vertical: 15.sp, horizontal: 20.sp),
                                decoration: BoxDecoration(
                                  color: AppColors.newThemePrimaryColor,
                                  gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xff125D99),
                                        Color(0xff1276C6),
                                      ]),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppAssets.imageGroupAdd,
                                      height: 24.sp,
                                      width: 25.5.sp,
                                      fit: BoxFit.fill,
                                    ),
                                    10.h.horizontalSpace,
                                    Text(
                                      "Add Employee",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          10.h.verticalSpace,
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class ShowPermissions extends StatelessWidget {
  final String permissionName;
  final VoidCallback onTap;
  const ShowPermissions({
    Key? key,
    required this.permissionName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6.w, top: 10.h),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20.r),
        shadowColor: Colors.blue.withOpacity(0.6),
        child: Container(
          // alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.grey, width: 0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                permissionName,
                style: AppStyles.staffNameTextButton,
              ),
              5.h.horizontalSpace,
              InkWell(
                onTap: onTap,
                child: Icon(
                  Icons.close,
                  color: Colors.grey,
                  size: 16.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
