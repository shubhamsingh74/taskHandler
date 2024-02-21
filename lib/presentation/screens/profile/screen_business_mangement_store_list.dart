import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_management/business_management_bloc.dart';
import 'package:quickprism/application/business/business_management_store_list/business_management_store_list_bloc.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/stocks/models/shops_all_model/get_all_shops_model.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/button/bottom_navigation_bar.dart';
import 'package:quickprism/presentation/widgets/empty_widget/empty_widget.dart';
import 'package:quickprism/presentation/widgets/error_widget/error_widget.dart';
import 'package:quickprism/presentation/widgets/form_fields/search_text_field.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';
import 'package:quickprism/presentation/widgets/svg_icon_widget/svg_icon_widget.dart';

@RoutePage()
class ScreenBusinessManagementStoreList extends StatelessWidget {
  const ScreenBusinessManagementStoreList({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = getIt<BusinessManagementStoreListBloc>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      bloc.add(BusinessManagementStoreListInitialEvent());
    });
    return BlocConsumer<BusinessManagementStoreListBloc,
        BusinessManagementStoreListState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is BusinessManagementStoreListLoadingState) {
          return const Scaffold(
            body: AppLoadingWidget(),
          );
        }

        if (state is BusinessManagementStoreListNoBusinessState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
            ),
            body: const Center(
              child: AppErrorWidget(
                innerHeight: 20,
                image: AppAssets.profile,
                message: 'Create a business profile first',
              ),
            ),
            bottomNavigationBar: ButtonBottomNavigationBar(
                title: "Create business",
                onTap: () {
                  context.router.replace(const RouteMyBusinessProfile());
                }),
          );
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Your stores",
              style: AppStyles.inter50016.copyWith(
                fontSize: 18.sp,
              ),
            ),
          ),
          bottomNavigationBar: ButtonBottomNavigationBar(
              title: "New store",
              onTap: () async {
                await context.router
                    .push(RouteBusinessManagement())
                    .then((value) {
                  bloc.add(BusinessManagementStoreListInitialEvent());
                });
              }),
          body: Column(
            children: [
              16.verticalSpace,
              const MainSearchTextField(),
              16.verticalSpace,
              state.shops.isEmpty
                  ? const Expanded(
                      child: AppEmptyWidget(
                      message: "No store found",
                    ))
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => _storeListTile(
                          store: state.shops[index],
                          onTap: () async {
                            await context.router
                                .push(RouteBusinessManagement(
                                    store: state.shops[index]))
                                .then((value) {
                              bloc.add(
                                  BusinessManagementStoreListInitialEvent());
                            });
                          }),
                      separatorBuilder: (context, index) => const Divider(
                            color: AppColors.borderColorListTile,
                          ),
                      itemCount: state.shops.length),
            ],
          ),
        );
      },
    );
  }

  _storeListTile({required GetAllShopsData store, required Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: AppSvgIconWidget(
        type: AppSvgIconWidgetType.appBarIcon,
        iconPath: AppAssets.storeIcon,
        color: AppColors.getColorFromString(hexValue: store.shopColour!),
      ),
      title: Text(
        store.shopName!,
        style: AppStyles.tileStyleTitle.copyWith(color: AppColors.textColorT1),
      ),
      trailing: Text(
        store.updatedAt.toString().split(' ')[0],
        style: AppStyles.tileStyleGray,
      ),
    );
  }
}
