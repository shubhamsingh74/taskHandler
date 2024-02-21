import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';

import '../../../application/auth/user_selection/user_selection_bloc.dart';
import '../../../infrastructure/auth/auth_service.dart';
import '../../../infrastructure/routing/app_router.dart';
import '../employee/screen_employee_home.dart';

@RoutePage()
class ScreenUserSelectionNew extends StatefulWidget {
  const ScreenUserSelectionNew({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  State<ScreenUserSelectionNew> createState() => _ScreenUserSelectionNewState();
}

class _ScreenUserSelectionNewState extends State<ScreenUserSelectionNew> {
  UserSelectionBloc userSelectionBloc = getIt<UserSelectionBloc>();
  String userType = "";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserSelectionBloc, UserSelectionState>(
      bloc: userSelectionBloc,
      listener: (context, state) {
        // TODO: implement listener
         if (state is UserSelectionBusinessSelectedState) {
          context.router.replaceAll([RouteBusinessHome()]);
        }
        if (state is UserSelectionEmployeeSelectedRegisteredState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomBottomBar(),
              ));
        }
        if (state is UserSelectionEmployeeSelectedNotRegisteredState) {
          context.router.push(const RouteEmployeeRegister());
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    AppAssets.iconsNewUserBack,
                    height: 0.75.sh,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    width: double.infinity,
                    height: 0.53.sh,
                    decoration: const BoxDecoration(
                        color: Color(0xffFBFBFB),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(58),
                          topRight: Radius.circular(58),
                        )),
                  )
                ],
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      0.24.sh.verticalSpace,
                      Text(
                        "Welcome to \nQuickPrism",
                        style: AppStyles.welcomeText,
                      ),
                      0.033.sh.verticalSpace,
                      Text(
                        "Select User Type",
                        style: AppStyles.letsGetText,
                      ),
                      0.027.sh.verticalSpace,
                      customContainerLeftTextWidget(
                          onTap: () {
                            // context.router.replace(RouteBusinessHome());
                            setState(() {
                              userType = "business";
                            });
                          },
                          title: 'Business',
                          imageUrl: AppAssets.iconsBusinessShop),
                      customContainerRightTextWidget(
                        onTap: () {
                          //  context.router.push(const RouteEmployeeRegister());
                          setState(() {
                            userType = "employee";
                          });
                        },
                      ),
                      customContainerLeftTextWidget(
                          onTap: () {
                            setState(() {
                              userType = "customer";
                            });
                          },
                          title: 'Customer',
                          imageUrl: AppAssets.iconsCustomerLogo),
                      0.05.sh.verticalSpace,
                      AppPrimaryButtonNew(
                        isLoading: state is UserSelectionLoadingState,
                        onTap: () async {
                          // context.router.replaceAll([RouteBusinessHome()]);
                          // await AuthService().saveUserType(userType);
                          userSelectionBloc.add(UserSelectionTypeSelectedEvent(
                              userType: userType));
                        },
                        title: 'Proceed',
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

  customContainerLeftTextWidget(
      {required VoidCallback onTap,
      required String title,
      required String imageUrl}) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          //border: Border.all(color: const Color(0xff0CAE4D),width: 3),
          color: const Color(0xffFDFDFD),
          border: userType.contains(title.toLowerCase())
              ? Border.all(color: const Color(0xff0CAE4D), width: 3)
              : null,
          boxShadow: [
            BoxShadow(
              color: const Color(0xff5E3A68).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                title,
                style: AppStyles.userNameText,
              ),
            ),
            Image.asset(
              imageUrl,
              height: 64,
              width: 109,
            )
          ],
        ),
      ),
    );
  }

  customContainerRightTextWidget({
    required VoidCallback onTap,
  }) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: userType.contains("emp")
              ? Border.all(color: const Color(0xff0CAE4D), width: 3)
              : null,
          color: const Color(0xffFDFDFD),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff5E3A68).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.iconsEmplyoeeLogo,
              height: 64,
              width: 109,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                "Employee",
                style: AppStyles.userNameText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
