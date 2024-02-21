// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/presentation/widgets/back_icon_and_title/back_icon_and_title.dart';

import '../../../infrastructure/routing/app_router.dart';
import '../../widgets/button/bottom_navigation_bar.dart';

@RoutePage()
class ScreenBankAccount extends StatelessWidget {
  const ScreenBankAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.white,
         appBar: AppBar(
          title: Text(
            "Bank Account",
            style: AppStyles.appBar,
          ),
          backgroundColor: AppColors.white,
        ),
      bottomNavigationBar: ButtonBottomNavigationBar(
        title: "Add bank account",
        onTap: () async {
          await context.router.push(RouteAddBankAccount());
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
           
            BankInfoTile(
              bankName: 'Paytm payments bank',
              accountNo: "13423242342324",
            ),
            BankInfoTile(
              bankName: 'Paytm payments bank',
              accountNo: "13423242342324",
              isVerified: false,
            ),
          ],
        ),
      ),
    );
  }
}

class BankInfoTile extends StatelessWidget {
  final String bankName;
  final String accountNo;
  final bool isVerified;
  const BankInfoTile({
    Key? key,
    required this.bankName,
    required this.accountNo,
    this.isVerified = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(color: AppColors.supportUI6),
          top: BorderSide(color: AppColors.supportUI6),
          right: BorderSide(color: AppColors.supportUI6),
          bottom: BorderSide(width: 1, color: AppColors.supportUI6),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            // radius: 50.sp,
            backgroundColor: AppColors.black,
            child: Icon(Icons.business_outlined),
          ),
          8.w.horizontalSpace,
          Column(
            children: [
              Text(
                bankName,
                style:AppStyles.inter16600T1.copyWith(
                  fontSize: 18.sp
                ),  
              ),
              Text(
                'Account number $accountNo',
                style: TextStyle(
                  color: Color(0xFF8D8D8D),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Spacer(),
          isVerified
              ? Icon(
                  Icons.check_circle,
                  color: AppColors.supportSP5,
                  size: 32.sp,
                )
              : Icon(
                  Icons.check_circle,
                  color: AppColors.textColorRed,
                  size: 32.sp,
                ),
        ],
      ),
    );
  }
}
