import 'package:auto_route/auto_route.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/home/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:quickprism/application/business/home/business_home/business_home_bloc.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/screens/business/discover/screen_business_discover.dart';
import 'package:quickprism/presentation/screens/business/my_lists/screen_business_my_lists.dart';
import 'package:quickprism/presentation/screens/business/transactions/screen_business_transactions.dart';
import 'package:quickprism/presentation/screens/business/parties/screen_business_parties.dart';
import 'package:quickprism/presentation/widgets/appbar/main_app_bar_business.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';
import 'package:quickprism/presentation/widgets/error_widget/error_widget.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';
import 'package:quickprism/presentation/widgets/navigation_bar/custom_navigation_bar.dart';

import '../../../../application/business/business_transactions/business_transaction_bloc.dart';
import '../../../widgets/shop_dropdown/custom_shop_drop_down.dart';
import 'widget/main_drawer_widget.dart';

@RoutePage()
class ScreenBusinessHome extends StatelessWidget {
  ScreenBusinessHome({super.key});

  final BusinessBottomNavigationCubit bNavCubit =
      BusinessBottomNavigationCubit();
  final BusinessHomeBloc homeBloc = getIt<BusinessHomeBloc>();
  BusinessTransactionBloc transactionsBloc = getIt<BusinessTransactionBloc>();
  final shopController = DropdownController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeBloc.add(BusinessHomeInitialEvent());
    });
    return BlocBuilder<BusinessHomeBloc, BusinessHomeState>(
      bloc: homeBloc,
      builder: (context, homeState) {
        if (homeState is BusinessHomeErrorState) {
          return Scaffold(
            appBar: MainAppBarBusiness(
              isLoading: homeState.isLoading,
            ),
            body: const Center(
              child: AppErrorWidget(
                message: 'Check your network',
              ),
            ),
          );
        }
        if (homeState is BusinessHomeNewUserState) {
          return Scaffold(
            appBar: MainAppBarBusiness(
              isLoading: homeState.isLoading,
              actions: [
                  15.w.horizontalSpace,
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
                 20.w.horizontalSpace,
              ],
            ),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AppErrorWidget(
                    image: AppAssets.profile,
                    message: 'Complete your profile',
                  ),
                  24.verticalSpace,
                  AppPrimaryButton(
                    label: 'Add Profile',
                    onTap: () async {
                      await context.router
                          .push(const RouteProfile())
                          .then((value) {
                        homeBloc.add(BusinessHomeInitialEvent());
                      });
                    },
                  )
                ],
              ),
            ),
          );
        }

        return Scaffold(
          backgroundColor: AppColors.white,
          appBar:
              //
              MainAppBarBusiness(
            isLoading: homeState.isLoading,
            actions: [
              CustomShopDropdown(
                list: UserConstants.shops,
                onChanged: (shop) {
                  homeBloc.add(BusinessHomeChangeShopEvent(
                    shop: shop!,
                  ));
                },
              ),
             15.w.horizontalSpace,
              InkWell(
                onTap: () async {
                  await context.router.push(const RouteProfile()).then((value) {
                    homeBloc.add(BusinessHomeInitialEvent());
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 15.r,
                ),
              ),
              20.horizontalSpace,
            ],
          ),

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
                          homeBloc.add(BusinessHomeChangeShopEvent(
                            shop: shop,
                          ));
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
              ]),
           */
          drawer: const MainAppDrawerBusiness(),
          body: homeState.isLoading
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
      },
    );
  }
}
