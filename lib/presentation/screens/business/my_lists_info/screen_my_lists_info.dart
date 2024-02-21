import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_my_list_info/business_my_list_info_bloc.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/core/utils/utils.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/stocks/models/item_info/stock_item_info_model.dart';
import 'package:quickprism/domain/stocks/models/item_shop/item_shop_model.dart';
import 'package:quickprism/domain/stocks/models/item_timeline/item_time_line_model.dart';
import 'package:quickprism/domain/stocks/models/mylist_details/mylist_details_model.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/appbar/main_appbar.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';
import 'package:quickprism/presentation/widgets/close_button_widget/app_close_button.dart';
import 'package:quickprism/presentation/widgets/color_tab_bar/color_tab_bar.dart';
import 'package:quickprism/presentation/widgets/empty_widget/empty_widget.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';
import 'package:quickprism/presentation/widgets/network_image_widget/network_image_widget.dart';
import 'package:quickprism/presentation/widgets/svg_icon_widget/svg_icon_widget.dart';

import '../../../widgets/normal_dropdown/normal_dropdown.dart';

@RoutePage()
class ScreenMyListsInfo extends StatelessWidget {
  const ScreenMyListsInfo({super.key, required this.itemData});

  final MyListDetailsData itemData;

  @override
  Widget build(BuildContext context) {
    final bloc = getIt<BusinessMyListInfoBloc>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      bloc.add(BusinessMyListInfoInitialEvent(itemId: itemData.itemId!));
    });

    return BlocConsumer<BusinessMyListInfoBloc, BusinessMyListInfoState>(
      bloc: bloc,
      buildWhen: (prev, current) => (current is! BusinessMyListInfoActionState),
      listenWhen: (prev, current) => (current is BusinessMyListInfoActionState),
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: AppColors.white,
            // resizeToAvoidBottomInset: false,
            appBar: MainAppBar(
              actions: [
                AppSvgIconWidget(
                  onTap: () {},
                  iconPath: AppAssets.shareIcon,
                  type: AppSvgIconWidgetType.appBarIcon,
                  color: AppColors.primaryP1,
                ),
                16.horizontalSpace,
                AppSvgIconWidget(
                  onTap: () async {
                    // bloc.add(BusinessMyListInfoActionToggleEvent());
                    await context.router
                        .push(RouteEditItem(itemInfoData: state.itemInfoData))
                        .then((value) {
                      bloc.add(BusinessMyListInfoInitialEvent(
                          itemId: itemData.itemId!));
                    });
                  },
                  iconPath: AppAssets.editIcon,
                  type: AppSvgIconWidgetType.appBarIcon,
                  color: AppColors.primaryP1,
                ),
                16.horizontalSpace,
                Builder(builder: (context) {
                  bool getActiveState() {
                    if (state is BusinessMyListInfoActionConfirmState) {
                      if (state.isDeleteActive) {
                        return true;
                      } else {
                        return false;
                      }
                    }

                    return false;
                  }

                  if (getActiveState()) {
                    return AppRoundActionButtonWidget(
                      bgColor: AppColors.supportUI11,
                      iconColor: AppColors.textColorGreen,
                      onTap: () {
                        bloc.add(BusinessMyListInfoActionToggleEvent());
                      },
                    );
                  } else {
                    return AppSvgIconWidget(
                      onTap: () {
                        bloc.add(BusinessMyListInfoActionToggleEvent());
                      },
                      iconPath: AppAssets.deleteIcon,
                      type: AppSvgIconWidgetType.appBarIcon,
                      color: AppColors.error,
                    );
                  }
                }),
                16.horizontalSpace,
              ],
            ),
            body: Column(
              children: [
                Builder(builder: (context) {
                  if (state is BusinessMyListInfoErrorState) {
                    return const Expanded(
                        child: Center(child: AppEmptyWidget()));
                  }

                  if (state.itemLoading!) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.textColorT3,
                        ),
                      ),
                    );
                  }

                  return _MyListInfoTopWidget(state);
                }),
                Divider(
                  color: AppColors.shimmerGrey,
                  height: 0,
                ),
                Builder(builder: (context) {
                  if ((state is BusinessMyListInfoSuccessState ||
                          state is BusinessMyListInfoActionConfirmState) &&
                      state is! BusinessMyListInfoLoadingState) {
                    return _MyListInfoBottomWidget(state);
                  }
                  return 1.horizontalSpace;
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MyListInfoTopWidget extends StatelessWidget {
  const _MyListInfoTopWidget(this.state);

  final dynamic state;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Builder(builder: (context) {
        bool getActiveState() {
          if (state is BusinessMyListInfoActionConfirmState) {
            if ((state as BusinessMyListInfoActionConfirmState)
                .isDeleteActive) {
              return true;
            } else {
              return false;
            }
          }

          return false;
        }

        Widget getWidget() {
          if (state is BusinessMyListInfoActionConfirmState) {
            if ((state as BusinessMyListInfoActionConfirmState)
                .isDeleteActive) {
              return _deleteConformWidget();
            } else {
              return 1.horizontalSpace;
            }
          }

          return 1.horizontalSpace;
        }

        return AnimatedContainer(
          height: getActiveState() ? 55.h : 0,
          duration: const Duration(milliseconds: 400),
          curve: Curves.decelerate,
          child: getWidget(),
        );
      }),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.5.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.itemInfoData.itemName!,
                          style: AppStyles.itemTitle,
                        ),
                        10.verticalSpace,
                        Text(state.itemInfoData.categoryName!,
                            style: AppStyles.tileStyleGray.copyWith(
                              fontWeight: FontWeight.w400,
                              height: 0,
                            )),
                      ],
                    ),
                    8.5.verticalSpace,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'View item report',
                          style: AppStyles.tileStyleTitle.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            color: AppColors.primaryP1,
                            height: 0.17,
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right_rounded,
                          color: AppColors.primaryP1,
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                AppNetWorkImageWidget(
                    rawSize: 54, imageUrl: state.itemInfoData.imageUrl!),
              ],
            ),
            24.verticalSpace,
            Row(
              children: [
                // _itemInfoWidget(
                //     label: 'Total quantity',
                //     value: '${state.itemInfoData.totalQuantity}'),
                _itemInfoWidget(
                    label: 'Low stock quantity',
                    value: '${state.itemInfoData.lowStockQuantity}'),
              ],
            ),
            26.verticalSpace,
            Row(
              children: [
                _itemInfoWidget(
                    label: 'Created on',
                    value:
                        state.itemInfoData.createdAt.toString().split(' ')[0]),
              ],
            ),
          ],
        ),
      ),
      16.verticalSpace,
    ]);
  }

  _itemInfoWidget({
    required String label,
    required String value,
    Widget? icon,
  }) =>
      Padding(
        padding: EdgeInsets.only(right: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: AppStyles.inter12400T2,
                ),
                icon != null
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [4.horizontalSpace, icon],
                      )
                    : 1.verticalSpace,
              ],
            ),
            8.verticalSpace,
            Text(
              value,
              style: AppStyles.inter12400T2.copyWith(
                color: AppColors.textColorT1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );

  Widget _deleteConformWidget() {
    return FadeInDown(
      duration: const Duration(milliseconds: 500),
      child: Container(
        color: AppColors.supportSP4,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        height: 55.h,
        width: 1.sw,
        child: Row(
          children: [
            Text(
              'Are you sure you want to delete?',
              style: AppStyles.inter12400T2.copyWith(
                color: AppColors.secondary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            AppRoundActionButtonWidget(iconData: Icons.done, onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class _MyListInfoBottomWidget extends StatelessWidget {
  const _MyListInfoBottomWidget(this.state);
  final dynamic state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ColoredTabBar(
            color: AppColors.white,
            tabBar: TabBar(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              automaticIndicatorColorAdjustment: true,
              isScrollable: true,
              labelStyle: AppStyles.tileStyleTitle.copyWith(
                  color: AppColors.primaryP1,
                  fontWeight: FontWeight.w600,
                  height: 0),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: const BoxDecoration(
                  color: AppColors.white,
                  border: Border(
                      bottom: BorderSide(
                    color: AppColors.primaryP1,
                    width: 2,
                  ))),
              dividerColor: AppColors.white,
              indicatorColor: AppColors.error,
              unselectedLabelStyle: AppStyles.tabStyle.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textColorT3,
              ),
              unselectedLabelColor: AppColors.textColorT3,
              tabs: const [
                Tab(
                  text: 'Item timeline',
                ),
                // Tab(
                //   text: 'Stores',
                // ),
                Tab(
                  text: 'Details',
                ),
                Tab(
                  text: 'Transfer stock',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _ItemInfoTimeLineWidget(
                  isLoading: state.itemTimeLineLoading!,
                  timelines: state.timeLines,
                ),
                // _ItemInfoShopsWidget(
                //   isLoading: state.itemTimeLineLoading!,
                //   shops: state.shops,
                // ),
                _ItemInfoDetailsWidget(
                  item: state.itemInfoData!,
                ),
                _ItemInfoAdjustStockWidget(
                  isLoading: state.itemTimeLineLoading!,
                  shops: state.shops,
                  // color: Colors.teal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // =============
  }
}

class _ItemInfoTimeLineWidget extends StatelessWidget {
  const _ItemInfoTimeLineWidget(
      {required this.isLoading, required this.timelines});
  final bool isLoading;
  final List<ItemTimeLineData> timelines;
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.textColorT3,
        ),
      );
    }

    return ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 16.w),
        itemCount: timelines.length,
        separatorBuilder: (context, index) => Divider(
              color: AppColors.shimmerGrey,
              height: 0,
            ),
        itemBuilder: (context, index) =>
            _timeLineListTile(timeLine: timelines[index]));
  }

  _timeLineListTile({required ItemTimeLineData timeLine}) {
    var baseColor = AppColors.textColorYellow;
    var arrowIcon = AppSvgIconWidget(
      iconPath: AppAssets.slideArrowIcon,
      color: baseColor,
    );

    switch (timeLine.type!.toLowerCase()) {
      case 'sale':
        baseColor = AppColors.textColorGreen;
        arrowIcon = AppSvgIconWidget(
          iconPath: AppAssets.slideArrowIcon,
          color: baseColor,
        );
      case 'purchase':
        baseColor = AppColors.textColorYellow;
        arrowIcon = AppSvgIconWidget(
          iconPath: AppAssets.slideArrowIcon,
          color: baseColor,
        );
      case 'opening_stock':
        baseColor = AppColors.textColorRed;
        arrowIcon = AppSvgIconWidget(
          iconPath: AppAssets.slideArrowIcon,
          color: baseColor,
        );
      case 'adjusted_stock':
        baseColor = AppColors.textColorRed;
        arrowIcon = AppSvgIconWidget(
          iconPath: AppAssets.slideArrowIcon,
          color: baseColor,
        );
    }

    if (timeLine.type!.toLowerCase() == 'sale' ||
        timeLine.type!.toLowerCase() == 'purchase') {
      return Container(
        width: 1.sw,
        padding: EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppSvgIconWidget(
                            iconPath: AppAssets.storeIcon,
                            size: 16.w,
                            color: Color(int.parse(
                                '0xff${timeLine.shopData!.shopColour!}')),
                          ),
                          4.horizontalSpace,
                          Text('${timeLine.date}',
                              style: AppStyles.inter12400T2),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          arrowIcon,
                          4.horizontalSpace,
                          Text(
                            timeLine.type!.capitalize(),
                            style: AppStyles.inter12400T2.copyWith(
                              color: baseColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 164),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Tax invoice',
                          style: AppStyles.inter12400T2.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryP1,
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right_rounded,
                          color: AppColors.primaryP1,
                        )
                      ],
                    ),
                    8.verticalSpace,
                    Text(
                      timeLine.differenceInQuantity! > 0
                          ? '+${timeLine.differenceInQuantity} ${timeLine.unit!.toUpperCase()}'
                          : '${timeLine.differenceInQuantity} ${timeLine.unit!.toUpperCase()}',
                      style: AppStyles.inter12400T2.copyWith(
                        color: baseColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            12.verticalSpace,
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Updated stock',
                  style: AppStyles.inter12400T2,
                ),
                const Spacer(),
                Text(
                  '${timeLine.quantity} ${timeLine.unit!.toUpperCase()}',
                  style: AppStyles.inter12400T2,
                ),
              ],
            ),
            12.verticalSpace,
          ],
        ),
      );
    }

    return Container(
      width: 1.sw,
      padding: EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppSvgIconWidget(
                          iconPath: AppAssets.storeIcon,
                          size: 16.w,
                          color: Color(int.parse(
                              '0xff${timeLine.shopData!.shopColour!}')),
                        ),
                        4.horizontalSpace,
                        Text('${timeLine.date}', style: AppStyles.inter12400T2),
                      ],
                    ),
                    8.verticalSpace,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        arrowIcon,
                        4.horizontalSpace,
                        Text(
                          timeLine.type!.capitalize(),
                          style: AppStyles.inter12400T2.copyWith(
                            color: baseColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${timeLine.quantity} ${timeLine.unit!.toUpperCase()}',
                    style: AppStyles.inter12400T2.copyWith(
                      color: AppColors.textColorT1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    '${timeLine.quantity} ${timeLine.unit!.toUpperCase()}',
                    style: AppStyles.inter12400T2,
                  ),
                ],
              ),
            ],
          ),
          12.verticalSpace,
        ],
      ),
    );
  }
}

class _ItemInfoShopsWidget extends StatelessWidget {
  const _ItemInfoShopsWidget({required this.isLoading, required this.shops});
  final bool isLoading;
  final List<ItemShopData> shops;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 16.w),
        itemCount: shops.length,
        separatorBuilder: (context, index) => Divider(
              color: AppColors.shimmerGrey,
              height: 0,
            ),
        itemBuilder: (context, index) =>
            _itemShopTileWidget(shop: shops[index]));
  }

  _itemShopTileWidget({required ItemShopData shop}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppSvgIconWidget(
                          iconPath: AppAssets.storeIcon,
                          // color: shop.storeDetail != null
                          //     ? Color(int.parse(
                          //         '0xff${shop.storeDetail!.shopColour!}'))
                          //     : AppColors.textColorT1,
                        ),
                        8.horizontalSpace,
                        Text(
                          // shop.storeDetail != null
                          //     ? shop.storeDetail!.shopName!
                          //     :
                          'Unknown',
                          style: AppStyles.inter12400T2.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColorT1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Available stock',
                style: AppStyles.inter12400T2,
              ),
              const Spacer(),
              Text(
                ' BOX',
                // '${shop.availableStock} BOX',
                style: AppStyles.inter12400T2,
              ),
            ],
          ),
          12.verticalSpace,
        ],
      ),
    );
  }
}

class _ItemInfoDetailsWidget extends StatelessWidget {
  const _ItemInfoDetailsWidget({required this.item});
  final MyListItemInfoData item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _detailItemWidget(
                  label: 'Item code', value: item.itemCode.toString()),
              4.horizontalSpace,
              // _detailItemWidget(label: 'Measuring unit', value: ''),
              // 4.horizontalSpace,
              _detailItemWidget(
                  label: 'Low stock at',
                  value: '${item.lowStockQuantity.toString()}'),
              4.horizontalSpace,
              // _detailItemWidget(label: 'Tax rate', value: '%'),
              _detailItemWidget(
                  label: 'HSN code', value: item.hsnSacCode.toString()),
            ],
          ),
          // 16.verticalSpace,
          // Row(
          //   children: [
          //     _detailItemWidget(
          //         label: 'HSN code', value: item.hsnSacCode.toString()),
          //   ],
          // ),
          16.verticalSpace,
          // Row(
          //   children: [
          //     _detailItemWidget(
          //         label: 'Item description', value: item.itemCode.toString()),
          //   ],
          // ),
        ],
      ),
    );
  }

  _detailItemWidget({required String label, required String value}) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppStyles.inter12400T2,
          ),
          8.verticalSpace,
          Text(
            value,
            style: AppStyles.inter12400T2.copyWith(
              color: AppColors.textColorT1,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
}

class _ItemInfoAdjustStockWidget extends StatefulWidget {
  const _ItemInfoAdjustStockWidget(
      {required this.isLoading, required this.shops});
  final bool isLoading;
  final List<ItemShopData> shops;

  @override
  State<_ItemInfoAdjustStockWidget> createState() =>
      _ItemInfoAdjustStockWidgetState();
}

class _ItemInfoAdjustStockWidgetState
    extends State<_ItemInfoAdjustStockWidget> {
  final bloc = getIt<BusinessMyListInfoBloc>();

  TextEditingController adjustmentDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<BusinessMyListInfoBloc, BusinessMyListInfoState>(
      bloc: bloc,
      listenWhen: (prev, current) => (current is BusinessMyListInfoActionState),
      listener: (context, state) {
        if (state is BusinessMyListInfoTransferSnackBarState) {
          Utils.successToast(context, 'transfer successFull');
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          padding: EdgeInsets.only(top: 16.w),
          children: [
            NormalTextField(
              onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2030));

                adjustmentDateController.text = date.toString().split(' ')[0];
              },
              label: 'Enter adjustment date ',
              controller: adjustmentDateController,
              enabled: false,
              suffix: Icon(
                Icons.date_range,
                color: AppColors.textColorT2,
                size: 16.w,
              ),
            ),
            8.verticalSpace,
            const NormalTextField(
              label: 'Quantity',
            ),
            8.verticalSpace,
            NormalDropDown(
              hintText: 'Unit',
              entries: List.generate(
                2,
                (index) =>
                    DropdownMenuEntry(value: index, label: index.toString()),
              ),
            ),
            16.verticalSpace,
            // NormalDropDown(
            //   hintText: 'Transfer from',
            //   entries: List.generate(
            //     widget.shops.length,
            //     (index) => DropdownMenuEntry(
            //       value: widget.shops[index],
            //       label: widget.shops[index].storeDetail!.shopName.toString(),
            //       labelWidget: Row(
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           AppSvgIconWidget(
            //             iconPath: AppAssets.storeIcon,
            //             color: AppColors.getColorFromString(
            //                 hexValue:
            //                     widget.shops[index].storeDetail!.shopColour!),
            //           ),
            //           4.horizontalSpace,
            //           Text(widget.shops[index].storeDetail!.shopName.toString(),
            //               style: AppStyles.tileStyleTitle)
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            16.verticalSpace,
            // NormalDropDown(
            //   hintText: 'Transfer to',
            //   entries: List.generate(
            //     widget.shops.length,
            //     (index) => DropdownMenuEntry(
            //       value: widget.shops[index],
            //       label: widget.shops[index].storeDetail!.shopName.toString(),
            //     ),
            //   ),
            // ),
            16.verticalSpace,
            AppPrimaryButton(
              label: 'Transfer stock',
              onTap: () {
                bloc.add(BusinessMyListInfoTransferEvent(
                  itemId: 1,
                  frmShopId: 1,
                  toShopId: 2,
                  quantity: 2,
                  date: '',
                ));
              },
            ),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }
}

// class _AdjustStockAddWidget extends StatelessWidget {
//   const _AdjustStockAddWidget();
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController adjustmentDateController = TextEditingController();
//
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.w),
//       child: ListView(
//         padding: EdgeInsets.only(top: 4.h),
//         children: [
//           NormalTextField(
//             onTap: () async {
//               var date = await showDatePicker(
//                   context: context,
//                   firstDate: DateTime(2000),
//                   lastDate: DateTime(2030));
//
//               adjustmentDateController.text = date.toString().split(' ')[0];
//             },
//             label: 'Enter adjustment date ',
//             controller: adjustmentDateController,
//             enabled: false,
//             suffix: Icon(
//               Icons.date_range,
//               color: AppColors.textColorT2,
//               size: 16.w,
//             ),
//           ),
//           8.verticalSpace,
//           NormalTextField(
//             label: 'Quantity',
//           ),
//           8.verticalSpace,
//           NormalTextField(
//             label: 'Unit',
//           ),
//           8.verticalSpace,
//           AppPrimaryButton(
//             label: 'Add stock',
//             onTap: () {},
//           ),
//           16.verticalSpace,
//         ],
//       ),
//     );
//   }
// }
class _AdjustStockAddWidget extends StatefulWidget {
  const _AdjustStockAddWidget();

  @override
  State<_AdjustStockAddWidget> createState() => _AdjustStockAddWidgetState();
}

class _AdjustStockAddWidgetState extends State<_AdjustStockAddWidget> {
  TextEditingController adjustmentDateController = TextEditingController();
  @override
  void dispose() {
    adjustmentDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView(
        padding: EdgeInsets.only(top: 4.h),
        children: [
          NormalTextField(
            onTap: () async {
              var date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2030));

              adjustmentDateController.text = date.toString().split(' ')[0];
            },
            label: 'Enter adjustment date ',
            controller: adjustmentDateController,
            enabled: false,
            suffix: Icon(
              Icons.date_range,
              color: AppColors.textColorT2,
              size: 16.w,
            ),
          ),
          8.verticalSpace,
          const NormalTextField(
            label: 'Quantity',
          ),
          8.verticalSpace,
          const NormalTextField(
            label: 'Unit',
          ),
          8.verticalSpace,
          AppPrimaryButton(
            label: 'Add stock',
            onTap: () {},
          ),
          16.verticalSpace,
        ],
      ),
    );
  }
}

final OutlineInputBorder baseBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      width: 1,
      color: AppColors.borderColorTextField,
    ),
    borderRadius: BorderRadius.circular(8.r));

class _AdjustStockReduceWidget extends StatelessWidget {
  const _AdjustStockReduceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        AppPrimaryButton(
          label: 'Reduce stock',
          onTap: () {},
        ),
        16.verticalSpace,
      ],
    );
  }
}

class _AdjustStockAdjustWidget extends StatelessWidget {
  const _AdjustStockAdjustWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        AppPrimaryButton(
          label: 'Adjust stock',
          onTap: () {},
        ),
        16.verticalSpace,
      ],
    );
  }
}
