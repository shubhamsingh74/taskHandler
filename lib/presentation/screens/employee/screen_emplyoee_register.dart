import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickprism/application/employee/employee_register_user/employee_register_user_bloc.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/utils.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';


@RoutePage()
class ScreenEmployeeRegister extends StatefulWidget {
  const ScreenEmployeeRegister({super.key});

  @override
  State<ScreenEmployeeRegister> createState() => _ScreenEmployeeRegisterState();
}

class _ScreenEmployeeRegisterState extends State<ScreenEmployeeRegister> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  EmployeeRegisterUserBloc employeeRegisterUserBloc = getIt<EmployeeRegisterUserBloc>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            AppAssets.imageEmpBackss,
            height: 0.5.sh,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0.20.sh),
                  padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(53.r),
                        topRight: Radius.circular(53.r),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Welcome to \nQuickPrism",
                                style: AppStyles.emplyoeeTitleText,
                              ),
                              5.sp.verticalSpace,
                              Text(
                                "Register User",
                                style: AppStyles.emplyoeeTitleText.copyWith(
                                    fontSize: 25, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(),
                        ],
                      ),
                      30.sp.verticalSpace,
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              //
                              "Name",
                              style: AppStyles.employeeTextfieldsTitle,
                            ),
                            2.sp.verticalSpace,
                            NormalTextField(
                              isFilled: true,
                              label: "Enter Your Full Name",
                              hintText: "Enter Your Full Name",
                              controller: _nameController,
                              inputType: TextInputType.name,
                              validator: (String? value) {
                                if (_nameController.text.isEmpty ||
                                    value!.isEmpty) {
                                  return "Enter the your name";
                                }
                                return null;
                              },
                            ),
                            5.sp.verticalSpace,
                            Text(
                              "Email",
                              style: AppStyles.employeeTextfieldsTitle,
                            ),
                            2.sp.verticalSpace,
                            NormalTextField(
                              isFilled: true,
                              label: "Enter Your email",
                              hintText: "Enter Your email",
                              controller: _emailController,
                              inputType: TextInputType.emailAddress,
                              validator: (String? value) {
                                if (_emailController.text.isEmpty ||
                                    value!.isEmpty) {
                                  return "Enter the your email Id";
                                }
                                return null;
                              },
                            ),
                            5.sp.verticalSpace,
                            Text(
                              "Address",
                              style: AppStyles.employeeTextfieldsTitle,
                            ),
                            2.sp.verticalSpace,
                            NormalTextField(
                              isFilled: true,
                              label: "Enter Your Address",
                              hintText: "Enter Your Address",
                              controller: _addressController,
                              inputType: TextInputType.streetAddress,
                              validator: (String? value) {
                                if (_addressController.text.isEmpty ||
                                    value!.isEmpty) {
                                  return "Enter the your address";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      25.sp.verticalSpace,
                      InkWell(
                        splashFactory: NoSplash.splashFactory,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            employeeRegisterUserBloc.add(
                                EmployeeRegisterUserButtonEvent(
                                  name: _nameController.text.trim(),
                                  email: _emailController.text.trim(),
                                  address: _addressController.text.trim(),
                                ));
                          }
                        },
                        child: BlocConsumer<EmployeeRegisterUserBloc,EmployeeRegisterUserState>(
                            bloc: employeeRegisterUserBloc,
                            listener: (context,state){
                              if (state is EmployeeRegisterUserErrorState) {
                                Utils.errorToast(context, "check all fields must be filled");
                              }
                              if (state is EmployeeRegisterUserSuccessState) {
                                context.router.replace(const RouteEmployeePayment());
                                Utils.successToast(context, "Employee User Created");
                              }
                            },
                            builder: (context,state) {
                              if (state is EmployeeRegisterUserLoadingState) {
                                return const CircularProgressIndicator(color: Colors.white,);
                              }
                              return Material(
                                elevation: 10,
                                shadowColor: Colors.grey,
                                borderRadius: BorderRadius.circular(10.r),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff09707E),
                                      borderRadius: BorderRadius.circular(10.r)),
                                  child: Text(
                                    "Proceed",
                                    style: AppStyles.buttonTextStyle,
                                  ),
                                ),
                              );
                            }
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
