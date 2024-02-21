import 'package:auto_route/auto_route.dart';
import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_invoice_home/business_invoice_home_bloc.dart';
import 'package:quickprism/application/business/home/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:quickprism/application/business/home/business_home/business_home_bloc.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/presentation/screens/business/home_old/dash_board/screen_business_dashboard.dart';
import 'package:quickprism/presentation/screens/business/home_old/finance/screen_business_finance.dart';
import 'package:quickprism/presentation/screens/business/home_old/invoice/screen_business_invoice.dart';
import 'package:quickprism/presentation/screens/business/home_old/widgets/home_shop_dropdown.dart';
import 'package:quickprism/presentation/widgets/navigation_bar/custom_navigation_bar.dart';

import '../../../../application/business/business_stock_home/business_stock_home_bloc.dart';
import 'parties/screen_business_parties.dart';
import 'stock/screen_business_stock.dart';

@RoutePage()
class ScreenBusinessOldHome extends StatelessWidget {
  const ScreenBusinessOldHome({super.key});

  @override
  Widget build(BuildContext context) {
    final BusinessBottomNavigationCubit bNavCubit =
        BusinessBottomNavigationCubit();

    final BusinessHomeBloc homeBloc = getIt<BusinessHomeBloc>();
    final BusinessStockHomeBloc stockBloc = getIt<BusinessStockHomeBloc>();
    final BusinessInvoiceHomeBloc invoiceBloc =
        getIt<BusinessInvoiceHomeBloc>();
    DropdownController shopController = DropdownController();

    final List<Widget> mainBusinessScreens = [
      const ScreenBusinessDashBoard(),
      const ScreenBusinessStock(),
      // const ScreenBusinessParties(),
      const ScreenBusinessInvoice(),
      const ScreenBusinessFinance(),
    ];

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeBloc.add(BusinessHomeInitialEvent());
    });

    return BlocConsumer<BusinessHomeBloc, BusinessHomeState>(
      bloc: homeBloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is BusinessHomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is BusinessHomeErrorState) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }

        if (state is BusinessHomeMainState) {
          if (state.currentBusiness == null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('No business found'),
                  ElevatedButton(
                      onPressed: () {
                        // bloc.add(BusinessStockHomeSignOutEvent());
                      },
                      child: const Text('Sign out'))
                ],
              ),
            );
          }

          // var currentBusiness = state.user!.data!.businessDetails![0];

          var currentShops = state.currentBusiness!.businessManagement;

          return BlocBuilder<BusinessBottomNavigationCubit,
              BusinessBottomNavigationState>(
            bloc: bNavCubit,
            builder: (ctx, navState) {
              return Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(70.h),
                  child: AppBar(
                    elevation: 0,
                    backgroundColor: AppColors.primaryP3,
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 12.r,
                          backgroundColor: AppColors.supportSP4,
                        ),
                        8.horizontalSpace,
                        Text(
                          state.currentBusiness!.businessProfile!
                                  .businessName ??
                              "Business name",
                          style: AppStyles.appBarTitle
                              .copyWith(color: AppColors.textColorT4),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    actions: [
                      Padding(
                        // padding: EdgeInsets.symmetric(horizontal: 18.w),
                        padding: EdgeInsets.symmetric(vertical: 8.h),

                        child: currentShops!.isNotEmpty
                            ? ShopDropDown(
                                controller: shopController,
                                onChange: (shop) {
                                  homeBloc.add(
                                      BusinessHomeChangeShopEvent(shop: shop));
                                  stockBloc
                                      .add(BusinessStockHomeInitialEvent());
                                  invoiceBloc
                                      .add(BusinessInvoiceHomeInitialEvent());
                                      
                                  shopController.close();
                                },
                                list: currentShops,
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryP3,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        width: 1,
                                        color: AppColors.textColorT4,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    )),
                                onPressed: () {},
                                child: Text(
                                  'Shop 1',
                                  style: AppStyles.dropDownMain
                                      .copyWith(color: AppColors.textColorT4),
                                )),
                      ),
                      8.horizontalSpace,
                      const Icon(
                        Icons.notifications_outlined,
                        color: AppColors.oldPrimaryP2,
                        size: 28,
                      ),
                      16.horizontalSpace,
                    ],
                  ),
                ),
                // backgroundColor: AppColors.primaryP3,
                body: mainBusinessScreens[navState.index],
                bottomNavigationBar: Container(
                  color: AppColors.primaryP3,
                  child: CustomNavigationBar(
                    currentIndex: navState.index,
                    onTap: (newIndex) {
                      bNavCubit.updateIndex(newIndex: newIndex);
                    },
                  ),
                ),
              );
            },
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
