import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';

class AmountCalculateWidget extends StatefulWidget {
  const AmountCalculateWidget({super.key, required this.gstController});
  final TextEditingController gstController;
  @override
  State<AmountCalculateWidget> createState() => _AmountCalculateWidgetState();
}

class _AmountCalculateWidgetState extends State<AmountCalculateWidget> {
  var isAmountOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: <Widget>[
            Text(
              'Total amount',
              style: AppStyles.subHeading16,
            ),
            const Spacer(),
            Text(
              '₹ totalAmount',
              style:
                  AppStyles.subHeading14.copyWith(color: AppColors.textColorT1),
            ),
          ],
        ),
        8.verticalSpace,
        Row(
          children: <Widget>[
            // Text(
            //   '0% GST',
            //   style: AppStyles.subHeading12
            //       .copyWith(color: AppColors.textColorT1),
            // ),
            SizedBox(
                width: 50.w,
                child: NormalTextField(
                  // maxLength: 2,
                  style: AppStyles.subHeading12700,
                  inputType: TextInputType.number,
                  hintText: 'gst',
                  controller: widget.gstController,
                  textSubmitted: (e) {},
                  onChanged: (_) {
                    _calculateAmount();
                  },
                  // inputFormatters: [
                  // FilteringTextInputFormatter.digitsOnly,
                  // ],
                )),
            Text(
              '% GST',
              style: AppStyles.subHeading12700,
            ),
            const Spacer(),
            Text(
              '₹ gstAmount',
              style:
                  AppStyles.subHeading12.copyWith(color: AppColors.textColorT1),
            ),
          ],
        ),
        8.verticalSpace,
        InkWell(
          onTap: () {
            setState(() {
              isAmountOpen = !isAmountOpen;
            });
          },
          child: Row(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Amount received',
                    style: AppStyles.subHeading14
                        .copyWith(color: AppColors.textColorT1),
                  ),
                  4.horizontalSpace,
                  Icon(
                    isAmountOpen
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    // color: AppColors.primaryP2,
                  )
                ],
              ),
              const Spacer(),
              Text(
                '₹ totalAmount',
                style: AppStyles.subHeading14
                    .copyWith(color: AppColors.textColorT1),
              ),
            ],
          ),
        ),
        8.verticalSpace,
        isAmountOpen
            ? Column(
                children: [
                  Row(
                    children: <Widget>[
                      Text(
                        'Cash',
                        style: AppStyles.subHeading12
                            .copyWith(color: AppColors.textColorT1),
                      ),
                      const Spacer(),
                      Text(
                        '₹ 0',
                        style: AppStyles.subHeading12
                            .copyWith(color: AppColors.textColorT1),
                      ),
                    ],
                  ),
                  8.verticalSpace,
                  Row(
                    children: <Widget>[
                      Text(
                        'Online',
                        style: AppStyles.subHeading12
                            .copyWith(color: AppColors.textColorT1),
                      ),
                      const Spacer(),
                      Text(
                        '₹ totalAmount',
                        style: AppStyles.subHeading12
                            .copyWith(color: AppColors.textColorT1),
                      ),
                    ],
                  ),
                  8.verticalSpace,
                  Row(
                    children: <Widget>[
                      Text(
                        'Due amount',
                        style: AppStyles.subHeading12
                            .copyWith(color: AppColors.primaryP1),
                      ),
                      const Spacer(),
                      Text(
                        '₹ 0',
                        style: AppStyles.subHeading12
                            .copyWith(color: AppColors.primaryP1),
                      ),
                    ],
                  ),
                ],
              )
            : 1.verticalSpace,
      ],
    );
  }

  void _calculateAmount() {}

}
