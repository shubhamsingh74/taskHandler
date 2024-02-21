import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/styles/app_styles.dart';
  import 'package:quickprism/domain/core/di/injectable.dart';
 import 'package:quickprism/presentation/widgets/error_widget/error_widget.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';

import '../../../../application/business/business_parties_home/business_parties_home_bloc.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../domain/user/models/parties/parties_model.dart';
import '../../../../infrastructure/routing/app_router.dart';
import '../../../widgets/close_button_widget/app_close_button.dart';
import '../../../widgets/floating_action_button/app_floating_action_button.dart';
import '../../../widgets/form_fields/search_text_field.dart';

class ScreenBusinessParties extends StatefulWidget {
  const ScreenBusinessParties({super.key});

  @override
  State<ScreenBusinessParties> createState() => _ScreenBusinessPartiesState();
}

class _ScreenBusinessPartiesState extends State<ScreenBusinessParties> {
  final partiesBloc = getIt<BusinessPartiesHomeBloc>();
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    partiesBloc.add(BusinessPartiesHomeInitialEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessPartiesHomeBloc, BusinessPartiesHomeState>(
      bloc: partiesBloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is BusinessPartiesHomeErrorState) {
          return const Scaffold(
            body: Center(
              child: AppErrorWidget(
                message: "Something went wrong",
              ),
            ),
          );
        }
        if (state is BusinessPartiesHomeLoadingState) {
          return const Scaffold(
            body: AppLoadingWidget(),
          );
        }
        if (state is BusinessPartiesHomeSuccessState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              actions: [
                Flexible(
                    child: MainSearchTextField(
                  controller: searchController,
                  onSuffixTap: () {
                    searchController.clear();
                    partiesBloc.add(BusinessPartiesHomeSearchPartyEvent(
                      searchText: "",
                    ));
                  },
                  onChanged: (searchWord) {
                    partiesBloc.add(BusinessPartiesHomeSearchPartyEvent(
                      searchText: searchWord,
                    ));
                  },
                )),
                AppRoundActionButtonWidget(
                    iconData: Icons.menu,
                    bgColor: AppColors.textColorT3,
                    iconColor: AppColors.textColorT1,
                    onTap: () {}),
                16.horizontalSpace,
              ],
            ),
            floatingActionButton: AppFloatingActionButton(
              icon: const Icon(Icons.add),
              heroTag: "Add new Party",
              label: 'Party',
              onTap: () async {
                await context.router
                    .push(const RouteBusinessAddNewParty())
                    .then((value) {
                  partiesBloc.add(BusinessPartiesHomeInitialEvent());
                });
              },
            ),
            backgroundColor: AppColors.white,
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: state.parties.length,
              itemBuilder: (context, index) {
                 return PartyTile(
                  party: state.parties[index],
                );
                //  ListTile(
                //   title: Text(state.parties[index].name ?? "N/A"),
                // );
              },
            ),
          );
        }
        if (state is BusinessPartiesHomeNoPartyState) {
          return Scaffold(
            floatingActionButton: AppFloatingActionButton(
              icon: const Icon(Icons.add),
              heroTag: "Add new Party",
              label: 'Party',
              onTap: () async {
                await context.router
                    .push(const RouteBusinessAddNewParty())
                    .then((value) {
                  partiesBloc.add(BusinessPartiesHomeInitialEvent());
                });
              },
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppAssets.noParty),
                  Text('No parties yet!',
                      style: AppStyles.inter16600T1.copyWith(fontSize: 18.sp)),
                  Text('Add your customers and vendors here ',
                      textAlign: TextAlign.center,
                      style: AppStyles.inter14400T2),
                ],
              ),
            ),
          );
        }
        return const Scaffold();
      },
    );
  }
}

class PartyTile extends StatelessWidget {
  final PartiesListDatum party;
  const PartyTile({super.key, required this.party});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 6.h,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
      ).copyWith(top: 5.h),
      decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(
              bottom: const BorderSide(color: AppColors.supportUI6, width: 2))),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.qrCode,
            height: 32.w,
            width: 32.w,
          ),
          4.w.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('QPID ${party.partyId}', style: AppStyles.tileStyleTitle),
              Text(
                party.name ?? "N/A",
                style: AppStyles.tileStyleSubTitle,
              )
            ],
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: ShapeDecoration(
              color: party.type?.toLowerCase().contains("vendor") ?? true
                  ? AppColors.supportUI13
                  : AppColors.supportUI14,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.r)),
            ),
            child: Text(party.type ?? "N/A",
                style: AppStyles.detailsTextFieldHint
                    .copyWith(color: AppColors.white)),
          ),
        ],
      ),
    );
  }
}
