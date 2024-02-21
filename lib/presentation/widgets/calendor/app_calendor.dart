import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:table_calendar/table_calendar.dart';


class AppCalendar extends StatelessWidget {
  AppCalendar({
    super.key,
    this.staffMemberAttendanceList,
    this.onDaySelected,
    this.selectedDay,
    this.focusedDay,
     this.joinedDay,
    this.onPageChanged,
  });

  final Map<DateTime, String>? staffMemberAttendanceList;
  void Function(DateTime, DateTime)? onDaySelected;
  DateTime? selectedDay;
  DateTime? focusedDay;
  DateTime? joinedDay;
  void Function(DateTime)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      selectedDayPredicate: (day) {
        return isSameDay(selectedDay, day);
      },

      onDaySelected: onDaySelected,

      calendarFormat: CalendarFormat.month,
      onPageChanged: onPageChanged,
      focusedDay: focusedDay ?? DateTime.now(),
      firstDay: DateTime.utc(2021),
      lastDay: DateTime.utc(2040),
      // availableGestures: AvailableGestures.horizontalSwipe,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronPadding: EdgeInsets.all(0),
        rightChevronPadding: EdgeInsets.all(0),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: AppStyles.subHeading14500.copyWith(
          fontWeight: FontWeight.w700,
          color: Colors.red
        ),
        weekdayStyle: AppStyles.subHeading14500.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.white
        ),
      ),
      startingDayOfWeek: StartingDayOfWeek.monday,
      pageAnimationCurve: Curves.bounceIn,
      calendarStyle: CalendarStyle(
        weekendTextStyle: AppStyles.detailsTextFieldLabel.copyWith(
          fontSize: 14.sp,
          color: Colors.white
        ),
        isTodayHighlighted: true,
        defaultTextStyle: AppStyles.detailsTextFieldLabel.copyWith(
          fontSize: 14.sp,
          color: Colors.white
        ),
      ),
      calendarBuilders: CalendarBuilders(
        selectedBuilder: (context, day, focusedDay) {
          return Center(
            child: Container(
              height: 30.w,
              width: 30.w,
              decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,),
              child: Center(child: Text(focusedDay.day.toString())),
            ),
          );
        },
        headerTitleBuilder: (context, day) {
          // print(day);
          final month = DateFormat.LLLL().format(day);
          final year = DateFormat.y().format(day);
          return Row(
            children: [
              const Spacer(),
              Text(
                staffMemberAttendanceList != null
                    ? 'Attendance $month $year'
                    : '$month $year',
                style: AppStyles.subHeading14500.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 13.sp
                ),
              ),
              const Spacer(),
            ],
          );
        },
        
        markerBuilder: (context, day, events) {
          String dayDate = day.day.toString();
         if( day.microsecondsSinceEpoch > DateTime.now().microsecondsSinceEpoch || day.microsecondsSinceEpoch < joinedDay!.microsecondsSinceEpoch ){
          return null;
         }
          if (staffMemberAttendanceList != null) {
            if (staffMemberAttendanceList!.containsKey(day.toUtc())) {
              if (staffMemberAttendanceList![day.toUtc()] == "HALF_DAY") {
                return HalfDay(
                  day: dayDate,
                );
              } else {
                return PresentAbsentPaidLeave(
                    day: dayDate,
                    leaveType: staffMemberAttendanceList![day.toUtc()] ?? "");
              }
            }
            return PresentAbsentPaidLeave(
              day: day.day.toString(),
              leaveType: "leaveType",
            );
          }
          return null;
        },
      ),
    );
  }
}

class PresentAbsentPaidLeave extends StatelessWidget {
  final String day;
  final String leaveType;
  const PresentAbsentPaidLeave({
    super.key,
    required this.day,
    required this.leaveType,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(100.r),
        shadowColor: Colors.blue,
        child: Container(
          width: 30.w,
          height: 30.h,
          decoration: ShapeDecoration(
            color:
                //  leaveType == ""
                //     ? AppColors.employeeAbsent
                //     : leaveType == 1
                //         ? AppColors.textFieldBorder
                //         : leaveType == 3
                //             ? AppColors.supportUI11
                //             : AppColors.employeeAbsent,


                // leaveType == "PRESENT"
                //     ? AppColors.supportUI11
                //     : leaveType == "PAID_LEAVE"
                //         ? AppColors.textFieldBorder
                //         : AppColors.employeeAbsent,



            leaveType == "PRESENT"
                ? AppColors.supportUI11
                : leaveType == "PAID_LEAVE"
                    ? AppColors.textFieldBorder
                    : AppColors.employeeAbsent,

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
          ),
          child: Center(child: Text(day,style:  TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.w600),)),
        ),
      ),
    );
  }
}

class HalfDay extends StatelessWidget {
  final String day;
  const HalfDay({
    super.key,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 30.w,
        height: 30.h,
        decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: 14.5.w,
                  decoration: BoxDecoration(
                      color: AppColors.shadeColorRed,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100.r),
                        topLeft: Radius.circular(100.r),
                      )),
                ),
                Container(
                  width: 14.5.w,
                  decoration: BoxDecoration(
                      color: AppColors.supportUI11,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(100.r),
                        topRight: Radius.circular(100.r),
                      )),
                ),
              ],
            ),
            Center(child: Text(day,style:  TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.w600),)),
          ],
        ),
      ),
    );
  }
}
