import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_create_customer/business_create_customer_bloc.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/presentation/widgets/appbar/main_appbar.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';
import 'package:quickprism/presentation/widgets/form_fields/auth_text_field.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';

GlobalKey<FormState> addCustomerKey = GlobalKey();

@RoutePage()
class ScreenBusinessAddCustomer extends StatefulWidget {
  const ScreenBusinessAddCustomer({
    super.key,
  });

  @override
  State<ScreenBusinessAddCustomer> createState() =>
      ScreenBusinessAddCustomerState();
}

class ScreenBusinessAddCustomerState extends State<ScreenBusinessAddCustomer> {
  bool enabled = true;
  TextEditingController customerNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController customerTypeController = TextEditingController();

  // Initial Selected Value
  String customerType = 'Regular';

  int? categoryId;
  String currentCategory = '';
  // List of items in our dropdown menu
  var items = [
    'Regular',
    'Business',
  ];

  final bloc = getIt<BusinessCreateCustomerBloc>();

  @override
  void initState() {
    bloc.add(BusinessCreateCustomerInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessCreateCustomerBloc,
        BusinessCreateCustomerState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is BusinessCreateCustomerNavigateBackState) {
          context.router.pop(state.newCustomer);
        }
      },
      builder: (context, state) {
        if (state is BusinessCreateCustomerLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is BusinessCreateCustomerErrorState) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }

        if (state.categories.isNotEmpty && categoryId == null) {
          categoryId = state.categories[0].categoryId;
          currentCategory = state.categories[0].name;
        }

        return Scaffold(
          appBar: MainAppBar(title: 'Add customer', context: context),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: addCustomerKey,
              child: ListView(
                children: [
                  24.verticalSpace,
                  NormalTextField(
                    controller: customerNameController,
                    label: 'Customer name',
                    textSubmitted: (e) {
                      customerNameController.text = e;
                    },
                  ),
                  24.verticalSpace,
                  NormalTextField(
                    controller: phoneController,
                    label: 'Phone',
                    suffix: const Icon(
                      Icons.contact_page_sharp,
                      color: AppColors.oldPrimaryP2,
                    ),
                    textSubmitted: (e) {
                      phoneController.text = e;
                    },
                  ),
                  24.verticalSpace,
                  NormalTextField(
                    controller: emailController,
                    label: 'Email (optional)',
                    textSubmitted: (e) {
                      emailController.text = e;
                    },
                  ),
                  24.verticalSpace,
                  Text('Customer address',
                      style: AppStyles.detailsTextFieldHead),
                  10.verticalSpace,
                  Row(
                    children: [
                      Flexible(
                          child: AuthTextField(
                        style: AppStyles.subHeading14.copyWith(
                          color: AppColors.textColorT1,
                        ),
                        hintText: 'Street Address',
                        controller: addressController,
                        // validator: _cityValidator,
                      )),
                      10.horizontalSpace,
                      Flexible(
                          child: AuthTextField(
                        style: AppStyles.subHeading14.copyWith(
                          color: AppColors.textColorT1,
                        ),
                        hintText: 'Pincode',
                        maxLength: 6,
                        controller: pinController,
                        // validator: _pinCodeValidator,
                        keyboardType: TextInputType.number,
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.digitsOnly,
                        // ],
                      )),
                    ],
                  ),
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
                        // validator: _cityValidator,
                      )),
                      10.horizontalSpace,
                      Flexible(
                          child: AuthTextField(
                        style: AppStyles.subHeading14.copyWith(
                          color: AppColors.textColorT1,
                        ),
                        hintText: 'State',
                        controller: stateController,
                        // validator: _stateValidator,
                      )),
                    ],
                  ),
                  24.verticalSpace,
                  Row(
                    children: [
                      Text('Customer type',
                          style: AppStyles.detailsTextFieldHead),
                    ],
                  ),
                  DropdownButton(
                    style: AppStyles.subHeading14.copyWith(
                      color: AppColors.oldPrimaryP2,
                    ),
                    isExpanded: true,
                    value: customerType,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.oldPrimaryP2,
                    ),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        customerType = newValue!;
                      });
                    },
                  ),
                  24.verticalSpace,
                  customerType == 'Regular'
                      ? regularInformationWidget(state)
                      : businessInformationWidget(state),
                  24.verticalSpace,
                  AppPrimaryButton(
                    label: 'Done',
                    onTap: () {
                      bloc.add(BusinessCreateCustomerAddButtonEvent(
                        createdBy: UserConstants.userId!,
                        cagetoryID: categoryId ?? 0,
                        name: customerNameController.text,
                        email: emailController.text,
                        number: phoneController.text,
                        street: streetController.text,
                        pin: pinController.text,
                        city: cityController.text,
                        companyName: companyNameController.text,
                        state: stateController.text,
                        dob: dobController.text,
                        category: currentCategory,
                        type: customerType,
                        pan: panController.text,
                        gst: gstController.text,
                      ));
                    },
                  ),
                  24.verticalSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget businessInformationWidget(BusinessCreateCustomerState state) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text('Business Information',
                  style: AppStyles.detailsTextFieldHead),
            ],
          ),
          12.verticalSpace,
          NormalTextField(
            controller: companyNameController,
            label: 'Company name',
            textSubmitted: (e) {
              companyNameController.text = e;
            },
          ),
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
          12.verticalSpace,
          NormalTextField(
            controller: gstController,
            label: 'GST',
            textSubmitted: (e) {
              gstController.text = e;
            },
          ),
          12.verticalSpace,
          NormalTextField(
            controller: panController,
            label: 'PAN number',
            textSubmitted: (e) {
              panController.text = e;
            },
          ),
        ],
      );
  Widget regularInformationWidget(BusinessCreateCustomerState state) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text('Customer Information',
                  style: AppStyles.detailsTextFieldHead),
            ],
          ),
          12.verticalSpace,
          NormalTextField(
            controller: dobController,
            label: 'DOB',
            textSubmitted: (e) {
              dobController.text = e;
            },
          ),
          12.verticalSpace,
          // NormalTextField(
          //   controller: addressController,
          //   label: 'Other fields',
          //   textSubmitted: (e) {
          //     addressController.text = e;
          //   },
          // ),
        ],
      );

  UnderlineInputBorder baseBorder = const UnderlineInputBorder(
    // borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide(
      width: 1,
      color: AppColors.borderColorTextField,
    ),
  );
}
