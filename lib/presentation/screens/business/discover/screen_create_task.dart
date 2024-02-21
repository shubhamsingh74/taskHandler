import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/assets/svg_canvas/barcode_canvas.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/utils.dart';
import 'package:quickprism/domain/stocks/models/create_task/create_task_request_model.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';
import 'package:quickprism/presentation/widgets/normal_dropdown/normal_dropdown.dart';
import 'package:quickprism/presentation/widgets/svg_icon_widget/svg_icon_widget.dart';

import '../../../../application/business/business_create_task/business_create_task_bloc.dart';
import '../../../../domain/core/di/injectable.dart';

class ScreenCreateTask extends StatefulWidget {
  const ScreenCreateTask({super.key});

  @override
  State<ScreenCreateTask> createState() => _ScreenCreateTaskState();
}

class _ScreenCreateTaskState extends State<ScreenCreateTask> {
  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _divisionDepartmentController =
      TextEditingController();
  String priorityLevel = "";
  final TextEditingController _deadlineDateController = TextEditingController();
  DateTime? deadlineDate;

  // final TextEditingController _Controller = TextEditingController();
  BusinessCreateTaskBloc businessCreateTaskBloc =
      getIt<BusinessCreateTaskBloc>();

  @override
  void dispose() {
    // TODO: implement dispose
    _deadlineDateController.dispose();
    _divisionDepartmentController.dispose();
    _taskTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.all(8.h),
          child: Material(
            elevation: 5,
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
        ),
        title: Text(
          "B-Name",
          style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff125D99)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              7.h.verticalSpace,
              Row(
                children: [
                  // CustomPaint(
                  //   size: Size(50,50),
                  //   painter: BarCodeCanvasPainter(),
                  // ),

                  Image.asset(
                    AppAssets.imageArrowLeft,
                    height: 28.h,
                    width: 30.h,
                    fit: BoxFit.fill,
                  ),
                  10.w.horizontalSpace,
                  Text(
                    "Create Task",
                    style: AppStyles.inter60018282828.copyWith(fontSize: 16.sp),
                  ),
                ],
              ),
              10.h.verticalSpace,
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(11.r),
                shadowColor: Colors.blue.shade200,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffFDFDFD),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Business Name",
                        style: AppStyles.taskName,
                      ),
                      5.sp.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "GSTIN",
                            style: AppStyles.taskName.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                          50.w.horizontalSpace,
                          Row(
                            children: [
                              Image.asset(
                                AppAssets.imageStoreImage,
                                height: 11,
                                width: 11,
                                color: AppColors.primaryBlue125D99,
                                fit: BoxFit.fill,
                              ),
                              3.h.horizontalSpace,
                              Text("Store 1",
                                  style: AppStyles.taskName.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              20.sp.verticalSpace,
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(11.r),
                shadowColor: Colors.blue.shade200,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffFDFDFD),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Division(Department)*",
                        style: AppStyles.taskTitleText,
                      ),
                      2.h.verticalSpace,
                      NormalTextField(
                        isFilled: true,
                        label: "Add your Division",
                        hintText: "Add your Division",
                        controller: _divisionDepartmentController,
                      ),
                      5.h.verticalSpace,
                      Text(
                        "Task Title",
                        style: AppStyles.taskTitleText,
                      ),
                      2.h.verticalSpace,
                      NormalTextField(
                        isFilled: true,
                        label: "Meeting with Clients",
                        hintText: "Meeting with Clients",
                        controller: _taskTitleController,
                      ),
                      5.h.verticalSpace,
                      Text(
                        "Assigned to",
                        style: AppStyles.taskTitleText,
                      ),
                      2.h.verticalSpace,
                      NormalDropDown(
                        fillcolor: AppColors.textFieldFilledColor,
                        width: 0.74.sw,
                        height: 55.sp,
                        hintText: "Select Emplyoee Name",
                        entries: const [],
                      ),
                      5.h.verticalSpace,
                      Text(
                        "Priority Level",
                        style: AppStyles.taskTitleText,
                      ),
                      2.h.verticalSpace,
                      NormalDropDown(
                        fillcolor: AppColors.textFieldFilledColor,
                        width: 0.74.sw,
                        height: 55.sp,
                        hintText: "Select Priority Level",
                        entries: const [
                          DropdownMenuEntry(value: "ASAP", label: "ASAP"),
                          DropdownMenuEntry(value: "High", label: "High"),
                          DropdownMenuEntry(value: "Medium", label: "Medium"),
                          DropdownMenuEntry(value: "Low", label: "Low"),
                        ],
                        onSelected: (p0) {
                          priorityLevel = p0.toString();
                        },
                      ),
                      5.h.verticalSpace,
                      Text(
                        "Deadline(Date)",
                        style: AppStyles.taskTitleText,
                      ),
                      2.h.verticalSpace,
                      NormalTextField(
                        isFilled: true,
                        enabled: false,
                        hintText: "Set Deadline",
                        controller: _deadlineDateController,
                        suffix: const Icon(Icons.arrow_drop_down),
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            firstDate: DateTime.utc(2020),
                            lastDate: DateTime.utc(2040),
                          );
                          _deadlineDateController.text =
                              date.toString().substring(0, 10);
                          deadlineDate = date;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              20.sp.verticalSpace,
              InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  businessCreateTaskBloc.add(BusinessCreateTaskRequestEvent(
                      createTaskRequestModel: CreateTaskRequestModel(
                    deadline: deadlineDate,
                    taskTitle: _taskTitleController.text,
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                    division: _divisionDepartmentController.text,
                    priorityLevel: priorityLevel,
                    assignedTo: 120,
                  )));
                },
                child: Material(
                  elevation: 10,
                  shadowColor: Colors.blue.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(8.r),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue125D99,
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff125D99),
                            Color(0xff1276C6),
                          ]),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: BlocConsumer<BusinessCreateTaskBloc,
                        BusinessCreateTaskState>(
                      bloc: businessCreateTaskBloc,
                      listener: (context, state) {
                        if (state is BusinessCreateTaskErrorState) {
                          Utils.errorToast(context, "check all fields");
                        }
                        if (state is BusinessCreateTaskSuccessState) {
                          context.popRoute();
                          Utils.successToast(context, "Task created");
                        }
                      },
                      builder: (context, state) {
                        if (state is BusinessCreateTaskLoadingState) {
                          return CircularProgressIndicator();
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.imageDocsAddOn,
                              height: 24.h,
                              width: 24.w,
                              fit: BoxFit.fill,
                            ),
                            5.h.horizontalSpace,
                            Text(
                              "Create Task",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              45.sp.verticalSpace
            ],
          ),
        ),
      ),
    );
  }

  ///-------appbar for this screen.
  Widget customAppBar({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppSvgIconWidget(
          iconPath: AppAssets.iconsBack,
          size: 45,
          onTap: () {
            context.router.back();
          },
        ),
        10.horizontalSpace,
        Text(
          "Create Task",
          style: AppStyles.createITemTitleSTyle,
        ),
        const Spacer(),
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
                color: AppColors.white,
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
                5.horizontalSpace,
                const AppSvgIconWidget(
                  iconPath: AppAssets.iconsDown,
                  size: 10,
                )
              ],
            ),
          ),
        ),
        7.horizontalSpace,
        InkWell(
            onTap: () {},
            splashFactory: NoSplash.splashFactory,
            child: Image.asset(
              AppAssets.iconsSettings,
              height: 24,
              width: 24,
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
}
