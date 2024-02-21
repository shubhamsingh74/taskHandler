import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_stock_home/business_stock_home_bloc.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/stocks/models/stock_type_etails/stock_type_details_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/screens/business/home_old/widgets/home_category_dropdown.dart';
import 'package:quickprism/presentation/widgets/floating_action_button/app_floating_action_button.dart';

class ScreenBusinessStock extends StatefulWidget {
  const ScreenBusinessStock({super.key});

  @override
  State<ScreenBusinessStock> createState() => _ScreenBusinessStockState();
}

class _ScreenBusinessStockState extends State<ScreenBusinessStock> {
  final bloc = getIt<BusinessStockHomeBloc>();
  DropdownController categoryController = DropdownController();

  @override
  void initState() {
    bloc.add(BusinessStockHomeInitialEvent());

    super.initState();
  }

  int categoryId = 1;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});

    return BlocConsumer<BusinessStockHomeBloc, BusinessStockHomeState>(
      bloc: bloc,
      listenWhen: (prev, current) => (current is BusinessStockHomeActionState),
      buildWhen: (prev, current) => (current is! BusinessStockHomeActionState),
      listener: (ctx, state) async {
        if (state is BusinessStockHomeSignOutState) {
          ctx.router.replaceAll(const [RouteSignupOrLogin()]);
        }
        if (state is BusinessStockHomeNavigateToItemListState) {
          await ctx.router
              .push(RouteBusinessStockItemList(
            businessId: 1,
            // businessId: UserConstants.currentBusiness!.businessId!,
            shopId: UserConstants.currentShop!.shopId!,
            stock: state.stockTypeData,
            categoryId: categoryId,
          ))
              .then((value) {
            if (state.subCategories.isEmpty) {
              bloc.add(BusinessStockHomeInitialEvent());
            }
          });
        }
      },
      builder: (context, state) {
        if (state is BusinessStockHomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is BusinessStockHomeErrorState) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }

        if (state is BusinessStockHomeStockSuccessState) {
          if (state.businessDetails.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('No business found'),
                  ElevatedButton(
                      onPressed: () {
                        bloc.add(BusinessStockHomeSignOutEvent());
                      },
                      child: Text('Sign out'))
                ],
              ),
            );
          }
          var currentBusiness = UserConstants.currentBusiness!;

          // var currentShops = currentBusiness.shopDetails;
          //
          // var currentCategories = state.subCategories;

          var currentStockTypes = state.stockTypes;

          return Scaffold(
              body: Column(
                children: [
                  Container(
                    color: AppColors.primaryP3,
                    height: 80.h,
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
                        padding: EdgeInsets.symmetric(
                            vertical: 5.w, horizontal: 8.w),
                        height: 48.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100.r)),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: CategoryDropDown(
                                controller: categoryController,
                                list: state.subCategories,
                                onChange: (catgry) {
                                  categoryId = catgry.categoryId;
                                  log(catgry.categoryId.toString());
                                  categoryController.close();
                                  bloc.add(BusinessStockHomeChangeCategoryEvent(
                                    categoryData: catgry,
                                    businessId: 0,
                                    // businessId: currentBusiness.businessId!,
                                  ));
                                },
                              ),
                            ),
                            const VerticalDivider(
                              color: AppColors.borderColorTextField,
                              thickness: 1,
                            ),
                            Flexible(
                              flex: 5,
                              child: Row(
                                children: [
                                  Text(
                                    'Enter name or code',
                                    style: AppStyles.subHeading12,
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.search,
                                    size: 20.sp,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Text(
                            '${state.stockTypes.length} sub categories',
                            style: AppStyles.subHeading14Semi,
                          ),
                          trailing: const Icon(Icons.menu_outlined),
                        ),
                        5.verticalSpace,
                        Expanded(child: Builder(builder: (context) {
                          return Builder(builder: (context) {
                            if (state is BusinessStockHomeStockTypeLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            return ListView.separated(
                              padding: EdgeInsets.only(bottom: 50.h, top: 10.h),
                              physics: const BouncingScrollPhysics(),
                              itemCount: currentStockTypes.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                height: 1,
                                color: AppColors.textColorT3,
                              ),
                              itemBuilder: (context, index) {
                                var currentStockType = currentStockTypes[index];
                                return stockTypeTile(
                                    currentStockType: currentStockType);
                              },
                            );
                          });
                        }))
                      ],
                    ),
                  ),
                ],
              ),
              floatingActionButton: AppFloatingActionButton(
                heroTag: "Sign out",
                label: 'Sign out',
                onTap: () {
                  bloc.add(BusinessStockHomeSignOutEvent());
                },
              ));
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  ListTile stockTypeTile({required StockTypeData currentStockType}) {
    return ListTile(
      onTap: () {
        bloc.add(BusinessStockHomeStockTypeTileTapEvent(currentStockType));
      },
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currentStockType.subCategoryName!,
            style: AppStyles.subHeading16Semi,
          ),
          5.horizontalSpace,
          Text(
            '(${currentStockType.count} items)',
            style: AppStyles.subHeading12Semi
                .copyWith(color: AppColors.textColorT2),
          ),
        ],
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: AppColors.textColorT1,
      ),
    );
  }
}
