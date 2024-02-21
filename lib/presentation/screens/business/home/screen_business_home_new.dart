import 'package:auto_route/auto_route.dart';
import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:quickprism/application/business/home/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:quickprism/application/business/home/business_home/business_home_bloc.dart';
import 'package:quickprism/core/assets/assets.dart';
 import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/screens/business/discover/screen_business_discover.dart';
 import 'package:quickprism/presentation/screens/business/home/widget/main_drawer_widget.dart';
import 'package:quickprism/presentation/screens/business/home_old/widgets/home_shop_dropdown.dart';
import 'package:quickprism/presentation/screens/business/my_lists/screen_business_my_lists.dart';
import 'package:quickprism/presentation/screens/business/parties/screen_business_parties.dart';
import 'package:quickprism/presentation/screens/business/transactions/screen_business_transactions.dart';
import 'package:quickprism/presentation/widgets/error_widget/error_widget.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';
import 'package:quickprism/presentation/widgets/navigation_bar/custom_navigation_bar.dart';

class ScreenBusinessHomeNew extends StatelessWidget {
  ScreenBusinessHomeNew({super.key});

  final BusinessBottomNavigationCubit bNavCubit =
      BusinessBottomNavigationCubit();
  final BusinessHomeBloc homeBloc = getIt<BusinessHomeBloc>();
  // BusinessTransactionBloc transactionsBloc = getIt<BusinessTransactionBloc>();
  final shopController = DropdownController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessHomeBloc, BusinessHomeState>(
        bloc: homeBloc,
        builder: (context, homeState) {
          return Scaffold(
            appBar:
            // 
            AppBar(), 
            /*
 MainAppBarBusiness(
                isLoading: homeState.isLoading,
                businessName:
                    homeState.currentBusiness?.businessProfile?.businessName,
                description: homeState
                    .currentBusiness?.businessProfile?.businessId
                    .toString(),
                // onProfileTap: () {
                //   log('profile tap');
                // },
                actions: [
                  UserConstants.shops.isNotEmpty
                      ? ShopDropDown(
                          list: UserConstants.shops,
                          controller: shopController,
                          onChange: (shop) {
                            // UserConstants.currentShop = shop;

                            // UserConstants.currentShop = shop;
                            homeBloc.add(BusinessHomeChangeShopEvent(
                              shop: shop,
                            ));
                            //
                            // UserConstants.currentShop = shop;
                            // homeBloc.add(BusinessHomeInitialEvent());
                            //
                            // transactionsBloc.add(BusinessTransactionInitialEvent(
                            //     shopId: shop.shopId!));
                            shopController.close();
                          },
                        )
                      : 1.horizontalSpace,
                  5.horizontalSpace,
                  InkWell(
                    onTap: () async {
                      await context.router
                          .push(const RouteProfile())
                          .then((value) {
                        homeBloc.add(BusinessHomeInitialEvent());
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 15.r,
                    ),
                  ),
                  16.horizontalSpace,
                ]
            ),
            */
            
            drawer: const MainAppDrawerBusiness(),
            body: Stack(
              children: [
                Image.asset(
                  AppAssets.iconsHomeBack,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                homeState.isLoading
                    ? const AppLoadingWidget()
                    : UserConstants.shops.isEmpty
                        ? const Center(
                            child: AppErrorWidget(
                              message: 'Add a shop first',
                            ),
                          )
                        : BlocBuilder<BusinessBottomNavigationCubit,
                            BusinessBottomNavigationState>(
                            bloc: bNavCubit,
                            builder: (context, navState) {
                              return IndexedStack(
                                index: navState.index,
                                children: [
                                  ScreenBusinessMyLists(
                                    shopId: homeState.currentShop!.shopId!,
                                  ),
                                   ScreenBusinessTransactions(
                                    shopId: homeState.currentShop!.shopId!,
                                  ),
                                  
                                  const ScreenBusinessDiscover(),
                                  
                                  const ScreenBusinessParties(),
                                ],
                              );
                            },
                          ),
              ],
            ),
            bottomNavigationBar: BlocBuilder<BusinessBottomNavigationCubit,
                BusinessBottomNavigationState>(
              bloc: bNavCubit,
              builder: (context, navState) {
                return CustomNavigationBar(
                  isLoading: homeState.isLoading,
                  currentIndex: navState.index,
                  onTap: (newIndex) {
                    bNavCubit.updateIndex(newIndex: newIndex);
                  },
                );
              },
            ),
          );
        });
  }
}
