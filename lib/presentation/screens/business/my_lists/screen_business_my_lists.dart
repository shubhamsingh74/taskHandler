import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_my_list/business_my_list_bloc.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/strings/app_strings.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/empty_widget/empty_widget.dart';
import 'package:quickprism/presentation/widgets/error_widget/error_widget.dart';
import 'package:quickprism/presentation/widgets/floating_action_button/app_primary_floating_button.dart';
import 'package:quickprism/presentation/widgets/form_fields/search_text_field.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';

import '../../../../application/business/home/business_home/business_home_bloc.dart';
import 'widgets/my_list_tile_widget.dart';

class ScreenBusinessMyLists extends StatelessWidget {
  const ScreenBusinessMyLists({super.key, this.shopId});
  final int? shopId;
  @override
  Widget build(BuildContext context) {
    final bloc = getIt<BusinessMyListBloc>();
    final BusinessHomeBloc homeBloc = getIt<BusinessHomeBloc>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (shopId != null) {
        bloc.add(BusinessMyListInitialEvent(shopId: shopId!));
      } else {
        bloc.add(BusinessMyListNoShopEvent());
      }
    });

    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<BusinessMyListBloc, BusinessMyListState>(
            bloc: bloc,
            builder: (context, state) {
              if (UserConstants.getCompletedProfilePercentage < 100) {
                return _completeProfileWidget(onTap: () async {
                  await context.router.push(const RouteProfile()).then((value) {
                    homeBloc.add(BusinessHomeInitialEvent());
                  });
                });
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          8.verticalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: MainSearchTextField(
                          margin: EdgeInsets.zero,
                          hintText: AppStrings.myListSearchHintText,
                        ),
                      ),
                      16.horizontalSpace,
                      Container(
                        width: 48,
                        height: 32,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Center(
                            child: Icon(
                          Icons.sort,
                          size: 16.w,
                        )),
                      )
                    ],
                  ),
                  BlocConsumer<BusinessMyListBloc, BusinessMyListState>(
                    bloc: bloc,
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      if (state is BusinessMyListErrorState) {
                        return const Center(child: AppErrorWidget());
                      }
                      if (state is BusinessMyListLoadingState) {
                        return const Expanded(child: AppLoadingWidget());
                      }
                      if (state is BusinessNoShopState) {
                        return const Expanded(
                            child: AppErrorWidget(
                          message: 'Complete your profile first',
                        ));
                      }
                      if (state is BusinessMyListSuccessState &&
                          state.itemList.isEmpty) {
                        return const Expanded(
                            child: Center(child: AppEmptyWidget()));
                      }

                      return Expanded(
                          flex: 10,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.only(top: 24.h),
                            shrinkWrap: true,
                            itemCount: state.itemList.length,
                            separatorBuilder: (context, index) => Divider(
                              color: AppColors.shimmerGrey,
                            ),
                            itemBuilder: (context, index) => MyListItemTile(
                              item: state.itemList[index],
                              onTap: () async {
                                await context.router
                                    .push(RouteMyListsInfo(
                                        itemData: state.itemList[index]))
                                    .then((value) {
                                  if (shopId != null) {
                                    bloc.add(BusinessMyListInitialEvent(
                                        shopId: shopId!));
                                  } else {
                                    bloc.add(BusinessMyListNoShopEvent());
                                  }
                                });
                              },
                            ),
                          ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // =============
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(100),
        child: AppPrimaryFloatingButton(
          toolTip: "Create item",
          onTap: () async {
            // await context.router.push(const RouteCreateItemNew()).then((value) {
            await context.router.push(RouteCreateItem()).then((value) {
              if (shopId != null) {
                bloc.add(BusinessMyListInitialEvent(shopId: shopId!));
              } else {
                bloc.add(BusinessMyListNoShopEvent());
              }
            });
          },
        ),
      ),
    );
  }

  Widget _completeProfileWidget({
    required Function() onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: Container(
          height: 48.h,
          color: AppColors.error,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(
                    Icons.warning_rounded,
                    color: AppColors.white,
                  ),
                  16.horizontalSpace,
                  Text(
                    'Complete your profilee',
                    style: AppStyles.inter50016.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.white,
              ),
            ],
          ),
        ),
      );
}
