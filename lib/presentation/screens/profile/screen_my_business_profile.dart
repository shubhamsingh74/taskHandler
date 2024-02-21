// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_my_profile/my_business_profile_bloc.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/utils.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/presentation/widgets/button/bottom_navigation_bar.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';
import '../../widgets/normal_dropdown/normal_dropdown.dart';

GlobalKey<FormState> businessProfileKey = GlobalKey();

@RoutePage()
class ScreenMyBusinessProfile extends StatefulWidget {
  const ScreenMyBusinessProfile({super.key});

  @override
  State<ScreenMyBusinessProfile> createState() =>
      _ScreenMyBusinessProfileState();
}

class _ScreenMyBusinessProfileState extends State<ScreenMyBusinessProfile> {
  final bloc = getIt<MyBusinessProfileBloc>();
  TextEditingController typeController = TextEditingController();
  TextEditingController cinController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController gstinController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool editMode = false;
  @override
  void initState() {
    var businessDetails = UserConstants.currentUser!.data!.businessDetails;

    if (businessDetails == null) {
      editMode = true;
    } else {
      typeController.text = businessDetails.businessProfile!.businessType!;
      cinController.text = businessDetails.businessProfile!.cin ?? '';
      panController.text = businessDetails.businessProfile!.pan!;
      gstinController.text = businessDetails.businessProfile!.gstIn!;
      nameController.text = businessDetails.businessProfile!.businessName!;
    }

    bloc.add(MyBusinessProfileInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // log(editMode.toString());

    return BlocConsumer<MyBusinessProfileBloc, MyBusinessProfileState>(
      bloc: bloc,
      listenWhen: (prev, current) => (current is MyBusinessProfileActionState),
      buildWhen: (prev, current) => (current is! MyBusinessProfileActionState),
      listener: (context, state) {
        if (state is MyBusinessProfileNavigateBackState) {
          context.router.pop();
        }
        if (state is MyBusinessProfileErrorSnackBarState) {
          Utils.errorToast(context, 'Business creation failed');
        }
      },
      builder: (context, state) {
        if (state is MyBusinessProfileLoadingState) {
          return Scaffold(body: AppLoadingWidget());
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "My business",
              style: AppStyles.inter50016.copyWith(
                fontSize: 18.sp,
              ),
            ),
            actions: [
              state.newUser!
                  ? 1.horizontalSpace
                  : TextButton.icon(
                      onPressed: () {
                        setState(() {
                          editMode = !editMode;
                        });
                      },
                      label: Text(
                        'Edit',
                        style: AppStyles.inter50016.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.secondary,
                        ),
                      ),
                      icon: Icon(
                        editMode ? Icons.edit : Icons.edit_off,
                        size: 16.sp,
                        color: AppColors.secondary,
                      ),
                    )
            ],
          ),
          backgroundColor: AppColors.white,
          bottomNavigationBar: ButtonBottomNavigationBar(
              isActive: editMode,
              title: state.newUser! ? "Save" : "Update",
              onTap: () {
                if (_formValidate()) {
                  bloc.add(MyBusinessProfileSaveEvent(
                    userId: UserConstants.userId!,
                    type: typeController.text,
                    pan: panController.text,
                    cin: cinController.text,
                    gst: gstinController.text,
                    bName: nameController.text,
                  ));
                }
              }),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Form(
                  key: businessProfileKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       32.h.verticalSpace,
                      Text('Are you a  ',
                          style: AppStyles.inter16600T1.copyWith(
                            color: AppColors.black,
                            fontSize: 18.sp,
                          )),
                      //Text("Drop Down"),
                      24.h.verticalSpace,
                      NormalDropDown(
                        enabled: editMode,
                        controller: typeController,
                        hintText: "Business Type",
                        onSelected: (p0) {
                          bloc.add(MyBusinessProfileChangeBusinessTypeEvent(
                            type: p0,
                          ));
                        },
                        // entries: [
                        //   DropdownMenuEntry(
                        //       value: "Private Ltd", label: "Private Ltd"),
                        //   DropdownMenuEntry(value: "LLP", label: "LLP"),
                        //   DropdownMenuEntry(
                        //       value: "Partnership", label: "Partnership"),
                        //   DropdownMenuEntry(
                        //       value: "Proprietorship", label: "Proprietorship"),
                        // ],

                        entries: state.businessTypes
                            .map(
                              (e) => DropdownMenuEntry(
                                  value: e.businessType,
                                  label: e.businessType!),
                            )
                            .toList(),
                      ),
                      27.h.verticalSpace,
                      state.isCINvisible!
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                NormalTextField(
                                  enabled: editMode,
                                  controller: cinController,
                                  label: "Enter CIN*",
                                  validator: _nameValidator,
                                ),
                                16.h.verticalSpace,
                              ],
                            )
                          : 1.horizontalSpace,
                      NormalTextField(
                        maxLength: 10,
                        enabled: editMode,
                        controller: panController,
                        label: "Enter PAN*",
                        validator: _panValidator,
                      ),
                      16.h.verticalSpace,
                      NormalTextField(
                        enabled: editMode,
                        controller: gstinController,
                        label: "Enter GSTIN*",
                        validator: _gstValidator,
                      ),
                      16.h.verticalSpace,
                      NormalTextField(
                        enabled: editMode,
                        controller: nameController,
                        label: "Enter Business name*",
                        validator: _nameValidator,
                      ),
                      16.h.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  bool _baseNullCheck() {
    var businessDetails = UserConstants.currentUser!.data!.businessDetails;

    if (businessDetails == null) {
      return true;
    } else {
      return businessDetails.businessProfile!.cin != null;
    }
  }

  bool _formValidate() {
    final FormState? form = businessProfileKey.currentState;
    if (form != null && form.validate()) {
      return true;
    }

    return false;
  }

  String? _nameValidator(String? text) {
    if (text != null && text.isEmpty) {
      return 'Enter your Name';
    }

    return null;
  }

  String? _panValidator(String? text) {
    if (text != null && text.isEmpty) {
      return 'Enter your PAN number';
    } else if (text != null && text.length != 10) {
      return 'Invalid PAN number';
    }

    return null;
  }

  String? _gstValidator(String? text) {
    if (text != null && text.isEmpty) {
      return 'Enter your gst number';
    }

    return null;
  }
}
