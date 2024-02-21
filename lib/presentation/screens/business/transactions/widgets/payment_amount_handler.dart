import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../widgets/form_fields/normal_text_field.dart';
import 'payment_reference_bottom_sheet.dart';

class PaymentAmountHandler extends StatelessWidget {
  const PaymentAmountHandler({
    super.key,
    required this.notesReferenceNoController,
    required this.amountReceivedController,
    this.label = "Received",
    required this.paymentMode,
    required this.labelColor,
  });
  final TextEditingController notesReferenceNoController;
  final TextEditingController amountReceivedController;
  final String paymentMode;
  final Color labelColor;

  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            InkWell(
              onTap: () async {
                await showModalBottomSheet(
                  scrollControlDisabledMaxHeightRatio: 0.4,
                  context: context,
                  builder: (context) {
                    return PaymentReferenceBottomSheet(
                      notesReferenceNoController: notesReferenceNoController,
                      paymentType: paymentMode,
                    );
                  },
                );
              },
              child: Text(
                '+ $paymentMode Notes / Reference No',
                style: AppStyles.inter12600T7,
              ),
            ),
          ],
        ),
        20.w.horizontalSpace,
        Flexible(
          child: NormalTextField(
            label: label,
            hintText: label,
            labelColor: labelColor,
            borderColor: labelColor,
            inputType: TextInputType.number,
            controller: amountReceivedController,
          ),
        ),
      ],
    );
  }
}
