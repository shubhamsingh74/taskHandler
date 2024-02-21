import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/presentation/screens/employee/screen_employee_home.dart';


@RoutePage()
class ScreenEmployeePayment extends StatefulWidget {
  const ScreenEmployeePayment({super.key});

  @override
  State<ScreenEmployeePayment> createState() => _ScreenEmployeePaymentState();
}

class _ScreenEmployeePaymentState extends State<ScreenEmployeePayment> {
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
                  margin: EdgeInsets.only(top: 0.30.sh),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(53.r),
                        topRight: Radius.circular(53.r),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              10.sp.verticalSpace,
                              Text(
                                "Welcome to \nQuickPrism",
                                style: AppStyles.emplyoeeTitleText,
                              ),
                              10.sp.verticalSpace,
                              Text(
                                "Register QPID",
                                style: AppStyles.emplyoeeTitleText.copyWith(
                                    fontSize: 25, fontWeight: FontWeight.w500),
                              ),
                              10.sp.verticalSpace,
                              Text(
                                "Pay Via UPI",
                                style: AppStyles.employeeTextfieldsTitle
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: const Color(0xff5E5C5C)),
                              ),
                            ],
                          ),
                          const SizedBox(),
                        ],
                      ),
                      25.sp.verticalSpace,
                      customPaymentContainerWidget(onTap: () {  }, title: 'Paytm', image: AppAssets.imagePaytm, border: true,),
                      5.sp.verticalSpace,
                      customPaymentContainerWidget(onTap: () {  }, title: 'GPay', image: AppAssets.imageGooglePay, border: false),
                      25.sp.verticalSpace,
                      InkWell(
                        splashFactory: NoSplash.splashFactory,
                        onTap: () {
                          ///-----------testing purpose
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CustomBottomBar(),
                              ));
                        },
                        child: Material(
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

  customPaymentContainerWidget({required VoidCallback onTap,required String title,required String image,required bool border}) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: border==true ?Border.all(color: const Color(0xff45A6DC), width: 3):null,
          color: const Color(0xffFDFDFD),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppStyles.userNameText.copyWith(fontSize: 19,fontWeight: FontWeight.w600,color: const Color(0xff6C6A6A)),
              ),
              Image.asset(
                image,
                height: 50,
                width: 56,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
