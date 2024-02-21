
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickprism/presentation/screens/business/transactions/widgets/add_new_party.dart';

import '../../../../../application/business/business_parties_home/business_parties_home_bloc.dart';
import '../../../../../application/business/transactions_purchase_invoice/transaction_purchase_invoice_bloc.dart';
import '../../../../../core/assets/assets.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/styles/app_styles.dart';
import '../../../../../domain/core/di/injectable.dart';
import '../../../../widgets/form_fields/search_text_field.dart';

class BillToWidgetPurchase extends StatelessWidget {
  BillToWidgetPurchase(
      {super.key,
      this.onTap,
      required this.transactionInvoiceBloc,
      required this.partyType,
      required this.addNew});
  final Function()? onTap;
  final String partyType;
  final String addNew;

  TransactionPurchaseInvoiceBloc transactionInvoiceBloc;

  @override
  Widget build(BuildContext context) {
    final partiesBloc = getIt<BusinessPartiesHomeBloc>();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      color: AppColors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Bill to', style: AppStyles.inter12400T212500),
              SvgPicture.asset(AppAssets.qrCode),
            ],
          ),
          16.h.verticalSpace,
          BlocConsumer<BusinessPartiesHomeBloc, BusinessPartiesHomeState>(
            bloc: partiesBloc,
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  MainSearchTextField(
                    margin: EdgeInsets.zero,
                    borderRadiusGeometry: BorderRadius.circular(8.r),
                    hintText: "Search from your ${addNew}s",
                    onChanged: (searchWord) {
                      partiesBloc.add(BusinessPartiesHomeSearchPartyEvent(
                          searchText: searchWord));
                    },
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state is BusinessPartiesHomeSuccessState
                        ? state.parties.length
                        : 0,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          transactionInvoiceBloc
                              .add(TransactionPurchaseInvoiceSelectPartyEvent(
                            partyDetail: state.parties[index],
                          ));
                        },
                        child: ListTile(
                          title: Text(state.parties[index].name ?? "N/A"),
                          subtitle:
                              Text(state.parties[index].mobileNumber ?? "N/A"),
                        ),
                      );
                    },
                  )
                ],
              );
            },
          ),
          16.h.verticalSpace,
          AddNewParty(isSales: false,),
          // =========== vendor selected
          16.h.verticalSpace,
        ],
      ),
    );
  }
}
