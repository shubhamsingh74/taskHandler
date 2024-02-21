import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/auth/business_signup/business_sign_up_bloc.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/utils.dart';
import 'package:quickprism/domain/auth/models/auth/signup_req_model.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';
import 'package:quickprism/presentation/widgets/form_fields/auth_text_field.dart';

GlobalKey<FormState> businessSignUpKey = GlobalKey();

@RoutePage()
class ScreenBusinessSignup extends StatefulWidget {
  const ScreenBusinessSignup({super.key, required this.phoneNumber});
  final String phoneNumber;
  @override
  State<ScreenBusinessSignup> createState() => _ScreenBusinessSignupState();
}

class _ScreenBusinessSignupState extends State<ScreenBusinessSignup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController businessController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController gstInController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  BusinessSignUpBloc businessSignUpBloc = getIt<BusinessSignUpBloc>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    panController.dispose();
    gstInController.dispose();
    streetController.dispose();
    pinCodeController.dispose();
    cityController.dispose();
    stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<BusinessSignUpBloc, BusinessSignUpState>(
        bloc: businessSignUpBloc,
        listenWhen: (prev, current) => (current is BusinessSignUpActionState),
        buildWhen: (prev, current) => (current is! BusinessSignUpActionState),
        listener: (ctx, state) {
          if (state is BusinessSignUpErrorState) {
            Utils.errorToast(ctx, '');
          }

          if (state is BusinessSignupNavigateToCategorySelection) {
            log('signup bloc is working');
            var signUpReqModel = SignUpReqModel(
              name: nameController.text,
              businessName: businessController.text,
              phone: widget.phoneNumber,
              userType: 'business',
              email: emailController.text,
              panNo: panController.text,
              gstNo: gstInController.text,
              pin: int.parse(pinCodeController.text),
              state: stateController.text,
              street: streetController.text,
              city: cityController.text,
            );

            ctx.router.push(
                RouteAuthCategorySelection(signUpReqModel: signUpReqModel));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: businessSignUpKey,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  49.verticalSpace,
                  Text(
                    'Retailer details',
                    style: AppStyles.heading,
                    textAlign: TextAlign.center,
                  ),
                  35.verticalSpace,
                  Text('Name', style: AppStyles.detailsTextFieldHead),
                  12.verticalSpace,
                  AuthTextField(
                    controller: nameController,
                    validator: _nameValidator,
                  ),
                  24.verticalSpace,
                  Text('Business name', style: AppStyles.detailsTextFieldHead),
                  12.verticalSpace,
                  AuthTextField(
                    controller: businessController,
                    validator: _nameValidator,
                  ),
                  24.verticalSpace,
                  Text('Email', style: AppStyles.detailsTextFieldHead),
                  12.verticalSpace,
                  AuthTextField(
                    hintText: 'Example: mail@example.com',
                    controller: emailController,
                    validator: _emailValidator,
                    keyboardType: TextInputType.emailAddress,

                    // inputFormatters: [EmailInputFormatter()],
                  ),
                  24.verticalSpace,
                  Text('PAN', style: AppStyles.detailsTextFieldHead),
                  12.verticalSpace,
                  AuthTextField(
                    hintText: 'Example: FTHGP7723H',
                    controller: panController,
                    maxLength: 10,
                    validator: _panValidator,
                    // inputFormatters: [PanFormatter()],
                  ),
                  24.verticalSpace,
                  Text('GST IN', style: AppStyles.detailsTextFieldHead),
                  12.verticalSpace,
                  AuthTextField(
                    hintText: 'Example: FTHGP7723H',
                    controller: gstInController,
                    validator: _gstValidator,
                  ),
                  24.verticalSpace,
                  Text('Business address',
                      style: AppStyles.detailsTextFieldHead),
                  12.verticalSpace,
                  Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                              child: AuthTextField(
                            hintText: 'Street Address',
                            controller: streetController,
                            validator: _streetValidator,
                          )),
                          10.horizontalSpace,
                          Flexible(
                              child: AuthTextField(
                            hintText: 'Pincode',
                            maxLength: 6,
                            controller: pinCodeController,
                            validator: _pinCodeValidator,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          )),
                        ],
                      ),
                      10.verticalSpace,
                      Row(
                        children: [
                          Flexible(
                              child: AuthTextField(
                            hintText: 'City',
                            controller: cityController,
                            validator: _cityValidator,
                          )),
                          10.horizontalSpace,
                          Flexible(
                              child: AuthTextField(
                            hintText: 'State',
                            controller: stateController,
                            validator: _stateValidator,
                          )),
                        ],
                      ),
                    ],
                  ),
                  74.verticalSpace,
                  AppPrimaryButton(
                    label: 'Next',
                    onTap: () {
                      if (_formValidate()) {
                        // sendOtpBloc.add(SendOtpButtonClickEvent(
                        //     phone: controller.text));

                        businessSignUpBloc
                            .add(BusinessSignUpButtonClickEvent());
                      }
                    },
                  ),
                  16.verticalSpace,
                ],
              ),
            ),
          );
        },
      )),
    );
  }

  bool _formValidate() {
    final FormState? form = businessSignUpKey.currentState;
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

  String? _emailValidator(String? text) {
    if (text != null && text.isEmpty) {
      return 'Enter your Email';
    } else if (text != null && EmailValidator.validate(text.trim())) {
      return null;
    }

    return 'Invalid Email';
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

  String? _streetValidator(String? text) {
    if (text != null && text.isEmpty) {
      return 'Enter your street';
    }

    return null;
  }

  String? _pinCodeValidator(String? text) {
    if (text != null && text.isEmpty) {
      return 'Enter your pincode';
    } else if (text != null && text.length != 6) {
      return 'Invalid pincode';
    }

    return null;
  }

  String? _cityValidator(String? text) {
    if (text != null && text.isEmpty) {
      return 'Enter your city';
    }
    return null;
  }

  String? _stateValidator(String? text) {
    if (text != null && text.isEmpty) {
      return 'Enter your State';
    }

    return null;
  }
}
