import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../application/business/transactions_purchase_invoice/transaction_purchase_invoice_bloc.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/styles/app_styles.dart';
import '../../../../../domain/user/models/parties/parties_model.dart';

class SelectedPartyDetailsPurchase extends StatelessWidget {
  const SelectedPartyDetailsPurchase(
      {super.key,
      required this.partyDetail,
      required this.transactionInvoiceBloc});
  final PartiesListDatum? partyDetail;
  final TransactionPurchaseInvoiceBloc transactionInvoiceBloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bill to', style: AppStyles.inter12400T212500),
          10.h.verticalSpace,
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(
              backgroundColor: Color(0xFFE8F4FF),
              child: Icon(
                Icons.person_2_outlined,
                color: AppColors.primaryP2,
              ),
            ),
            title: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${partyDetail?.name ?? "N/A"}\n',
                    style: AppStyles.inter14600T6,
                  ),
                  TextSpan(
                      text: partyDetail?.mobileNumber ?? "N/A",
                      style: AppStyles.inter14400T5),
                ],
              ),
            ),
            trailing: CloseButton(
              onPressed: () {
                transactionInvoiceBloc.add(
                    TransactionPurchaseInvoiceSelectPartyEvent(
                        partyDetail: null));
              },
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(AppColors.supportUI12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}