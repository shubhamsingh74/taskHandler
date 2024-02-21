import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/user/user_constants.dart';

class CustomDrawerBar extends StatelessWidget {
   CustomDrawerBar({super.key});

  List profileAction=[
    {
      'icon': AppAssets.iconsNotificationProfile,
      'title': "Tasks",
    },
    {
      'icon': AppAssets.iconsBell,
      'title': "Notifications",
    },
    {
      'icon': AppAssets.iconsManCheck,
      'title': "Attendance",
    },
    {
      'icon': AppAssets.iconsUserMan,
      'title': "Profile",
    },
    {
      'icon': AppAssets.iconsVerifyProfile,
      'title': "Verification",
    },
    {
      'icon': AppAssets.iconsKYC,
      'title': "KYC",
    },
    {
      'icon': AppAssets.iconsNotificationProfile,
      'title': "Logout",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 0.75.sw,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 35).copyWith(top: 60),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffBCF3FF),
                        Color(0xffF2FDFF),
                        Color(0xffF9FAFA),
                      ])
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(65),
                          shadowColor: Colors.grey,
                          child: const CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                  "https://media.istockphoto.com/id/1406197730/photo/portrait-of-a-young-handsome-indian-man.jpg?s=2048x2048&w=is&k=20&c=lDJRQWb0FtKq9R8biMKvGGZVqn0sVGlUHDPoxR83nWc=")),
                        ),
                        Positioned(
                          bottom: 5,
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                                color: Color(0xff0D93A6),
                                shape: BoxShape.circle
                            ),
                            child: const Icon(Icons.add,size: 20,color: Colors.white,),
                          ),
                        )

                      ],
                    ),
                    0.01.sh.verticalSpace,
                    Text(
                      UserConstants.employeeDetails?.employeeProfile?.empName.toString() ?? "",
                      style: AppStyles.emplyoeeAttendanceName,
                    ),
                    2.h.verticalSpace,
                    Text(
                      "QPID : ${UserConstants.employeeDetails?.employeeProfile?.qpid.toString()??0}",
                      style: AppStyles.emplyoeeAttendanceDetails,
                    ),
                    2.h.verticalSpace,
                    Text(
                      "Logistics Specialist",
                      style: AppStyles.emplyoeeAttendanceDetails,
                    ),
                    2.h.verticalSpace,
                    Text(
                      "Employee since : February 2023",
                      style: AppStyles.emplyoeeAttendanceDetails,
                    ),
                  ],
                ),
              ),
            ),
            ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: profileAction.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Material(
                  elevation: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
                    decoration: const BoxDecoration(
                      color: Color(0xffFDFDFD),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        10.w.horizontalSpace,
                        Image.asset(profileAction[index]['icon'],height: 21,width: 24,color: index == 6 ?const Color(0xffF6456F): const Color(0xff323234)),
                        15.w.horizontalSpace,
                        Text(profileAction[index]['title'],style: TextStyle(color: index == 6 ?const Color(0xffF6456F): const Color(0xff323234),fontWeight: FontWeight.w500,fontSize: 18),),
                      ],
                    ),
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) {
              return  Divider(
                height: 0,
                color: Colors.grey.shade200.withOpacity(0.8),thickness: 2,);
            },)
          ],
        ),
      ),
    );
  }
}
