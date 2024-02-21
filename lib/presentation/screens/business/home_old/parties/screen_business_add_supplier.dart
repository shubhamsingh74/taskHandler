import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_create_supplier/business_create_supplier_bloc.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/presentation/widgets/appbar/main_appbar.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';
import 'package:quickprism/presentation/widgets/form_fields/auth_text_field.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';
import 'package:quickprism/presentation/widgets/form_fields/remarks_field.dart';

GlobalKey<FormState> addSupplierKey = GlobalKey();

@RoutePage()
class ScreenBusinessAddSupplier extends StatefulWidget {
  const ScreenBusinessAddSupplier({super.key});

  @override
  State<ScreenBusinessAddSupplier> createState() =>
      ScreenBusinessAddSupplierState();
}

class ScreenBusinessAddSupplierState extends State<ScreenBusinessAddSupplier> {
  bool enabled = true;
  TextEditingController qpidController = TextEditingController();
  TextEditingController supplierController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController remarksController = TextEditingController();

  final bloc = getIt<BusinessCreateSupplierBloc>();

  int? categoryId;
  String currentCategory = '';

  @override
  void initState() {
    bloc.add(BusinessCreateSupplierInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Add supplier', context: context),
      body:
          BlocConsumer<BusinessCreateSupplierBloc, BusinessCreateSupplierState>(
        bloc: bloc,
        listenWhen: (prev, current) =>
            (current is BusinessCreateSupplierActionState),
        buildWhen: (prev, current) =>
            (current is! BusinessCreateSupplierActionState),
        listener: (context, state) {
          if (state is BusinessCreateSupplierNavigateBackState) {
            context.router.pop([state.newSupplier]);
          }
        },
        builder: (context, state) {
          if (state is BusinessCreateSupplierLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is BusinessCreateSupplierErrorState) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }

          if (state.categories.isNotEmpty && categoryId == null) {
            categoryId = state.categories[0].categoryId;
            currentCategory = state.categories[0].name;
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: addSupplierKey,
              child: ListView(
                children: [
                  24.verticalSpace,
                  NormalTextField(
                    controller: qpidController,
                    label: 'Enter QPID',
                    textSubmitted: (e) {
                      qpidController.text = e;
                    },
                    validator: _nameValidator,
                  ),
                  24.verticalSpace,
                  NormalTextField(
                    controller: supplierController,
                    label: 'Supplier name',
                    textSubmitted: (e) {
                      qpidController.text = e;
                    },
                    validator: _nameValidator,
                  ),
                  24.verticalSpace,
                  NormalTextField(
                    controller: phoneController,
                    maxLength: 10,
                    label: 'Phone',
                    suffix: const Icon(
                      Icons.contact_page_sharp,
                      color: AppColors.oldPrimaryP2,
                    ),
                    textSubmitted: (e) {
                      qpidController.text = e;
                    },
                    validator: _phoneValidator,
                    inputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  24.verticalSpace,
                  NormalTextField(
                    controller: emailController,
                    label: 'Email',
                    textSubmitted: (e) {
                      qpidController.text = e;
                    },
                    validator: _emailValidator,
                    inputType: TextInputType.emailAddress,
                  ),
                  24.verticalSpace,
                  Text('Supplier category',
                      style: AppStyles.detailsTextFieldHead),
                  12.verticalSpace,
                  DropdownButton(
                    style: AppStyles.subHeading14.copyWith(
                      color: AppColors.oldPrimaryP2,
                    ),
                    isExpanded: true,
                    value: currentCategory,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.oldPrimaryP2,
                    ),
                    items: state.categories.map((items) {
                      return DropdownMenuItem(
                        value: items.name,
                        child: Text(
                          items.name,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        categoryId = state.categories
                            .firstWhere((element) => element.name == newValue)
                            .categoryId;

                        currentCategory = newValue!;
                      });
                    },
                  ),
                  24.verticalSpace,
                  NormalTextField(
                    controller: panController,
                    maxLength: 10,
                    label: 'PAN number',
                    textSubmitted: (e) {
                      qpidController.text = e;
                    },
                    validator: _panValidator,
                  ),
                  24.verticalSpace,
                  NormalTextField(
                    controller: gstController,
                    label: 'GST',
                    textSubmitted: (e) {
                      qpidController.text = e;
                    },
                    validator: _nameValidator,
                    inputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  12.verticalSpace,
                  Text('Business address',
                      style: AppStyles.detailsTextFieldHead),
                  12.verticalSpace,
                  AuthTextField(
                    hintText: 'Street Address',
                    style: AppStyles.subHeading14.copyWith(
                      color: AppColors.textColorT1,
                    ),
                    controller: addressController,
                    validator: _streetValidator,
                  ),
                  12.verticalSpace,
                  AuthTextField(
                    hintText: 'Pincode',
                    style: AppStyles.subHeading14.copyWith(
                      color: AppColors.textColorT1,
                    ),
                    maxLength: 6,
                    controller: pinController,
                    validator: _pinCodeValidator,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  Column(
                    children: [
                      10.verticalSpace,
                      Row(
                        children: [
                          Flexible(
                              child: AuthTextField(
                            style: AppStyles.subHeading14.copyWith(
                              color: AppColors.textColorT1,
                            ),
                            hintText: 'City',
                            controller: cityController,
                            validator: _cityValidator,
                          )),
                          10.horizontalSpace,
                          Flexible(
                              child: AuthTextField(
                            style: AppStyles.subHeading14.copyWith(
                              color: AppColors.textColorT1,
                            ),
                            hintText: 'State',
                            controller: stateController,
                            validator: _stateValidator,
                          )),
                        ],
                      ),
                      12.verticalSpace,
                      RemarksTextField(controller: qpidController),
                      12.verticalSpace,
                      AppPrimaryButton(
                        onTap: categoryId != null
                            ? () {
                                if (_formValidate()) {
                                  bloc.add(BusinessCreateSupplierAddButtonEvent(
                                      createdBy: UserConstants.userId!,
                                      categoryID: categoryId!,
                                      name: supplierController.text,
                                      number: phoneController.text,
                                      email: emailController.text,
                                      pan: panController.text,
                                      gst: gstController.text,
                                      street: addressController.text,
                                      pin: pinController.text,
                                      city: cityController.text,
                                      state: stateController.text,
                                      remarks: supplierController.text,
                                      status: '1'));

                                  log('create working');
                                }
                              }
                            : null,
                        label: 'Create supplier',
                      ),
                      12.verticalSpace,
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  UnderlineInputBorder baseBorder = const UnderlineInputBorder(
    // borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide(
      width: 1,
      color: AppColors.borderColorTextField,
    ),
  );

  bool _formValidate() {
    final FormState? form = addSupplierKey.currentState;
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

  String? _phoneValidator(String? text) {
    if (text != null && text.isEmpty) {
      return 'Enter your phone number';
    } else if (text != null && text.length != 10) {
      return 'Invalid phone number';
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
