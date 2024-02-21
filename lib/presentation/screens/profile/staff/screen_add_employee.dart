import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/presentation/widgets/appbar/main_app_bar_business.dart';
import 'package:quickprism/presentation/widgets/button/common_primary_button_business.dart';
import 'package:quickprism/presentation/widgets/svg_icon_widget/svg_icon_widget.dart';

import '../../../../application/business/business_staff_management/business_staff_add_employee/business_staff_add_employee_bloc.dart';
import '../../../../core/assets/assets.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/styles/app_styles.dart';
import '../../../../infrastructure/routing/app_router.dart';
import '../../../widgets/form_fields/normal_text_field.dart';

class ScreenAddEmployee extends StatefulWidget {
  const ScreenAddEmployee({super.key});

  @override
  State<ScreenAddEmployee> createState() => _ScreenAddEmployeeState();
}

class _ScreenAddEmployeeState extends State<ScreenAddEmployee> {
  BusinessStaffAddEmployeeBloc businessStaffAddEmployeeBloc =
      getIt<BusinessStaffAddEmployeeBloc>();
  final TextEditingController _enterQPIDController = TextEditingController();
  bool nextButtonIsActive = false;
  int count = 0;
  @override
  void dispose() {
    // TODO: implement dispose
    _enterQPIDController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessStaffAddEmployeeBloc,
        BusinessStaffAddEmployeeState>(
      bloc: businessStaffAddEmployeeBloc,
      listener: (context, state) {
         if (state is BusinessStaffAddEmployeeVerifiedState) {
          context.router.push(  RouteEmployeeAddDetails(qpid: int.parse(_enterQPIDController.text)));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: MainAppBarBusiness(isLoading: false),
          body: Stack(
            children: [
              SvgPicture.asset(
                AppAssets.imageEmplyoeeBack,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //customAppBarStaffManagement(context: context),
                      Image.asset(
                        AppAssets.imageStaffOfficeTime,
                      ),
                      15.h.verticalSpace,
                      Text(
                        "Team Management",
                        style: AppStyles.purchaseTextAddMoreTitle,
                        textAlign: TextAlign.start,
                      ),
                      10.h.verticalSpace,
                      Text(
                        "Ask Your Employees to create QPID and add them to your business QP",
                        style: AppStyles.requisitionTextModeCategoryText,
                        textAlign: TextAlign.start,
                      ),
                      20.h.verticalSpace,
                      Material(
                        elevation: 10,
                        color: Colors.white,
                        shadowColor: Colors.blue.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(15.r),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.sp, vertical: 35.sp),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Add Employee",
                                style: AppStyles.totalEmplyoeeNumberText,
                              ),
                              10.h.verticalSpace,
                              Text(
                                "Employee QPID",
                                style: AppStyles.emplyoeeTextfield,
                              ),
                              3.h.verticalSpace,
                              SizedBox(
                                height: 55.sp,
                                child: NormalTextField(
                                    onChanged: (p0) {
                                      if (p0.isEmpty) {
                                        setState(() {
                                          nextButtonIsActive = false;
                                          count = 0;
                                        });
                                      } else {
                                        if (count == 0) {
                                          setState(() {
                                            nextButtonIsActive = true;
                                            count++;
                                          });
                                        }
                                      }
                                    },
                                    isFilled: true,
                                    hintText: "Enter Employee QPID",
                                    inputType: TextInputType.number,
                                    controller: _enterQPIDController,
                                    suffix: const AppSvgIconWidget(
                                      iconPath: AppAssets.iconScarQRSquare,
                                      color: AppColors.primaryBlue125D99,
                                    )
                                    // CustomPaint(
                                    //   size: Size(50, 50),
                                    //   painter: RPSCustomPainter(),),
                                    ),
                              ),
                              5.h.verticalSpace,
                              Text(
                                state is BusinessStaffAddEmployeeNotVerifiedState
                                    ? "* Please Ask Employee to Complete Verification"
                                    : state is BusinessStaffAddEmployeeNotRegisteredState
                                        ? "* Please Ask Employee for registration"
                                        : "",
                                style: AppStyles.errorText,
                              ),
                              10.h.verticalSpace,
                              InkWell(
                                  splashFactory: NoSplash.splashFactory,
                                  onTap: () {
                                    ///check flow
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const ScreenEmployeeAddDetails(),
                                    //     ));
                                    // =============
                                    businessStaffAddEmployeeBloc.add(
                                        BusinessStaffAddEmployeeVerifyQPIDEvent(
                                            qpid: _enterQPIDController.text));
                                  },
                                  child:
                                      //
                                      CommonPrimaryButton(
                                    title: "Next",
                                    isActive: nextButtonIsActive,
                                    isLoading: state
                                        is BusinessStaffAddEmployeeLoadingState,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      10.h.verticalSpace,
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

// import 'dart:ui' as ui;

// //Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(12, 12),
//     painter: RPSCustomPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(1.33333, 0.833333);
    path_0.lineTo(0.833333, 0.833333);
    path_0.lineTo(0.833333, 1.33333);
    path_0.lineTo(0.833333, 3.5);
    path_0.lineTo(0.5, 3.5);
    path_0.lineTo(0.5, 0.5);
    path_0.lineTo(3.5, 0.5);
    path_0.lineTo(3.5, 0.833333);
    path_0.lineTo(1.33333, 0.833333);
    path_0.close();
    path_0.moveTo(1.33333, 11.1667);
    path_0.lineTo(3.5, 11.1667);
    path_0.lineTo(3.5, 11.5);
    path_0.lineTo(0.5, 11.5);
    path_0.lineTo(0.5, 8.5);
    path_0.lineTo(0.833333, 8.5);
    path_0.lineTo(0.833333, 10.6667);
    path_0.lineTo(0.833333, 11.1667);
    path_0.lineTo(1.33333, 11.1667);
    path_0.close();
    path_0.moveTo(11.1667, 1.33333);
    path_0.lineTo(11.1667, 0.833333);
    path_0.lineTo(10.6667, 0.833333);
    path_0.lineTo(8.5, 0.833333);
    path_0.lineTo(8.5, 0.5);
    path_0.lineTo(11.5, 0.5);
    path_0.lineTo(11.5, 3.5);
    path_0.lineTo(11.1667, 3.5);
    path_0.lineTo(11.1667, 1.33333);
    path_0.close();
    path_0.moveTo(11.1667, 10.6667);
    path_0.lineTo(11.1667, 8.5);
    path_0.lineTo(11.5, 8.5);
    path_0.lineTo(11.5, 11.5);
    path_0.lineTo(8.5, 11.5);
    path_0.lineTo(8.5, 11.1667);
    path_0.lineTo(10.6667, 11.1667);
    path_0.lineTo(11.1667, 11.1667);
    path_0.lineTo(11.1667, 10.6667);
    path_0.close();
    path_0.moveTo(4.83333, 3.16667);
    path_0.lineTo(4.83333, 4.83333);
    path_0.lineTo(3.16667, 4.83333);
    path_0.lineTo(3.16667, 3.16667);
    path_0.lineTo(4.83333, 3.16667);
    path_0.close();
    path_0.moveTo(4.83333, 7.16667);
    path_0.lineTo(4.83333, 8.83333);
    path_0.lineTo(3.16667, 8.83333);
    path_0.lineTo(3.16667, 7.16667);
    path_0.lineTo(4.83333, 7.16667);
    path_0.close();
    path_0.moveTo(7.16667, 4.83333);
    path_0.lineTo(7.16667, 3.16667);
    path_0.lineTo(8.83333, 3.16667);
    path_0.lineTo(8.83333, 4.83333);
    path_0.lineTo(7.16667, 4.83333);
    path_0.close();
    path_0.moveTo(8.83333, 7.16667);
    path_0.lineTo(8.83333, 8.83333);
    path_0.lineTo(7.16667, 8.83333);
    path_0.lineTo(7.16667, 7.16667);
    path_0.lineTo(8.83333, 7.16667);
    path_0.close();

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint_0_stroke.color = const Color(0xff125D99).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_stroke);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xff125D99).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
