// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quickprism/application/business/business_staff_management/business_staff_management_bloc.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/user/models/staff/staff_model.dart';
import 'package:quickprism/presentation/widgets/error_widget/error_widget.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/utils/utils.dart';
import '../../../domain/core/di/injectable.dart';
import '../../../infrastructure/routing/app_router.dart';
import '../../widgets/button/bottom_navigation_bar.dart';
import '../../widgets/container/shadow_container_for_tile.dart';
import '../../widgets/form_fields/search_text_field.dart';

@RoutePage()
class ScreenStaffManagement extends StatefulWidget {
  const ScreenStaffManagement({super.key});

  @override
  State<ScreenStaffManagement> createState() => _ScreenStaffManagementState();
}

class _ScreenStaffManagementState extends State<ScreenStaffManagement> {
  final BusinessStaffManagementBloc _businessStaffManagementBloc =
      getIt.get<BusinessStaffManagementBloc>();
  // getIt<BusinessStaffManagementBloc>();

  @override
  void initState() {
    super.initState();
    _businessStaffManagementBloc.add(BusinessStaffManagementInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // bool noStaff = false;
    return BlocConsumer<BusinessStaffManagementBloc,
        BusinessStaffManagementState>(
      bloc: _businessStaffManagementBloc,
      listener: (context, staffState) async {
        if (staffState is BusinessStaffManagementProfileIncompleteState) {
          Utils.successToast(context, 'First setup your business profile!');
          context.router.pop();

          await context.router.push(const RouteMyBusinessProfile());
        }
        // if (staffState
        //     is BusinessStaffManagementStaffAttendanceByMonthLoadingState) {
        //   await context.router.push(const RouteStaffMemberProfile()).then(
        //       (value) => _businessStaffManagementBloc
        //           .add((BusinessStaffManagementInitialEvent())));
        // }
      },
      builder: (context, staffState) {
        if (staffState is BusinessStaffManagementLoadingState ||
            staffState
                is BusinessStaffManagementStaffAttendanceByMonthLoadingState) {
          return const Scaffold(body: AppLoadingWidget());
          // return Scaffold(body: CircularProgressIndicator());
        }

        if (staffState is BusinessStaffManagementErrorState) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.white,
              ),
              body: const Center(
                child: AppErrorWidget(
                  message: "Check your connection",
                ),
              ));
        }

        if (staffState is BusinessStaffManagementSuccessState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Staff Management"),
              backgroundColor: Colors.white,
            ),
            bottomNavigationBar:
                // !noStaff  ?
                ButtonBottomNavigationBar(
              title: "Add Staff",
              onTap: () async {
                await context.router
                    .push(const RouteAddNewStaff())
                    .then((value) {
                  _businessStaffManagementBloc
                      .add(BusinessStaffManagementInitialEvent());
                });
              },
            ),
            // : null,
            body: SafeArea(
                child: Column(
              children: [
                Column(
                  children: [
                    32.h.verticalSpace,
                    // if(_scrollController.position.atEdge)
                    MainSearchTextField(
                      hintText: "Search staff",
                      borderRadiusGeometry: BorderRadius.circular(8.r),
                    ),
                    // 32.h.verticalSpace,
                    SizedBox(
                      height: size.height * 0.6,
                      child: ListView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: staffState.staffModel?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final staffMember =
                              staffState.staffModel?.data?[index];
                          final date = DateTime.now();
                          return InkWell(
                            onTap: () async {
                              _businessStaffManagementBloc.add(
                                  BusinessStaffManagementGetStaffAttendanceByMonthEvent(
                                      qpId:
                                          staffMember?.qpid.toString() ?? "N/A",
                                      staffId:
                                          staffMember?.staffId.toString() ??
                                              "1",
                                      month: date.month.toString(),
                                      year: date.year.toString(),
                                      staffName: staffMember?.name ?? "N/A"));

                              await context.router
                                  .push(RouteStaffMemberProfile(
                                      bloc: _businessStaffManagementBloc))
                                  .then((value) => _businessStaffManagementBloc.add(
                                      (BusinessStaffManagementInitialEvent())));
                            },
                            child: StaffMemberDetails(
                              staffMember: staffMember,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )),
          );
        }
        if (staffState is BusinessStaffManagementNoStaffState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Staff Management"),
              backgroundColor: Colors.white,
            ),
            body: NoStaffYet(bloc: _businessStaffManagementBloc),
          );
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
          ),
          body: Text(staffState.toString()),
        );
      },
    );
  }
}

class StaffMemberDetails extends StatelessWidget {
  final StaffDatum? staffMember;
  const StaffMemberDetails({
    Key? key,
    required this.staffMember,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadowContainerForTiles(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Column(
        children: [
          // Text(data.toString()),
          // salary qpid
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // 'Gaurav',
                staffMember?.name ?? "N/A",
                style: AppStyles.inter16600T1,
              ),
              Text(
                'QPID: ${staffMember?.qpid}',
                // staffMember?.qpid.toString() ?? "N/A",
                style:
                    AppStyles.detailsTextFieldLabel.copyWith(fontSize: 14.sp),
              )
            ],
          ),
          10.h.verticalSpace,
          // name due
          Visibility(
            visible: staffMember?.salaryStartDate == null ? false : true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    // 'Daily salary',
                    staffMember?.salaryInterval ?? "N/A",
                    style: AppStyles.tileStyleGray.copyWith(
                      fontSize: 14.sp,
                    )),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '₹${staffMember?.salaryAmount ?? 0} ',
                          style: AppStyles.inter50016.copyWith(
                            color: AppColors.textColorRed,
                          )),
                      TextSpan(
                        text: 'Salary Due',
                        style: AppStyles.tileStyleGray.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          10.h.verticalSpace,
          //   sales manager today attandnvce
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // 'Sales manager',
                staffMember?.role ?? "N/A",
                style: AppStyles.inter14400T6,
              ),
              Column(
                children: [
                  Text(
                    "Today's attendance",
                    style: AppStyles.tileStyleGray,
                  ),
                  // AttendanceDropDown(list: [
                  //   "present",
                  //   "absent",
                  // ], controller: DropdownController())
                  Text(staffMember?.todaysAttendance ?? "N/A"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NoStaffYet extends StatelessWidget {
  final BusinessStaffManagementBloc bloc;
  const NoStaffYet({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          40.h.verticalSpace,
          Image.asset(
            "assets/images/no_staff.jpg",
          ),
          16.h.verticalSpace,
          Text(
            'No staff added yet',
            style: AppStyles.inter16600T1.copyWith(
              fontSize: 18.sp,
            ),
          ),
          8.h.verticalSpace,
          SizedBox(
            width: 310.w,
            child: Text(
              'Add your staff and invite them to manage your shop',
              textAlign: TextAlign.center,
              style: AppStyles.inter12400T2.copyWith(
                fontSize: 14.sp,
              ),
            ),
          ),
          16.h.verticalSpace,
          ButtonBottomNavigationBar(
            title: "Add Staff",
            onTap: () async {
              await context.router.push(const RouteAddNewStaff()).then((value) {
                bloc.add(BusinessStaffManagementInitialEvent());
              });
            },
          ),
        ],
      ),
    );
  }
}
