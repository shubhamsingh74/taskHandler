import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_stock_items/business_stock_items_bloc.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/stocks/models/items/stock_items_model.dart';
import 'package:quickprism/domain/stocks/models/stock_type_etails/stock_type_details_model.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/appbar/main_appbar.dart';
import 'package:quickprism/presentation/widgets/floating_action_button/app_floating_action_button.dart';
import 'package:quickprism/presentation/widgets/form_fields/search_text_field.dart';

@RoutePage()
class ScreenBusinessStockItemList extends StatefulWidget {
  const ScreenBusinessStockItemList({
    super.key,
    required this.shopId,
    required this.stock,
    required this.businessId,
    required this.categoryId,
  });
  final StockTypeData stock;
  final int shopId;
  final int businessId;
  final int categoryId;

  @override
  State<ScreenBusinessStockItemList> createState() =>
      _ScreenBusinessStockItemListState();
}

class _ScreenBusinessStockItemListState
    extends State<ScreenBusinessStockItemList> {
  final bloc = getIt<BusinessStockItemsBloc>();
  final searchController = TextEditingController();
  @override
  void initState() {
    log('BID :=> ${widget.businessId} , sCID :=> ${widget.stock.subCategoryId}');

    bloc.add(BusinessStockItemsInitialEvent(
      subCategoryId: widget.stock.subCategoryId!,
      businessId: widget.businessId,
      shopId: widget.shopId,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(
          title: widget.stock.subCategoryName,
          context: context,
        ),
        body: Column(
          children: [
            16.verticalSpace,
            MainSearchTextField(
                controller: searchController,
                onSuffixTap: () {
                  searchController.clear();
                  bloc.add(BusinessStockItemsSearch(''));
                },
                onChanged: (searchText) {
                  bloc.add(BusinessStockItemsSearch(searchText));
                }),
            16.verticalSpace,
            BlocConsumer<BusinessStockItemsBloc, BusinessStockItemsState>(
              bloc: bloc,
              listenWhen: (prev, current) =>
                  (current is BusinessStockItemsActionState),
              buildWhen: (prev, current) =>
                  (current is! BusinessStockItemsActionState),
              listener: (ctx, state) async {
                if (state is BusinessStockItemsNavigateToItemState) {
                  await ctx.router
                      .push(RouteStockItemInfo(
                    itemsData: state.itemsData,
                  ))
                      .then((value) {
                    _getItemList();
                  });
                }

                if (state is BusinessStockItemsNavigateToStockInState) {
                  ctx.router.push(RouteBusinessStockIn(
                    stockItemsData: state.stockItemsData,
                  ));
                }

                if (state is BusinessStockItemsNavigateToStockOutState) {
                  ctx.router.push(RouteBusinessStockOut(
                    stockItemsData: state.stockItemsData,
                  ));
                }

                if (state is BusinessStockItemsNavigateToStockTransferState) {
                  await ctx.router
                      .push(RouteBusinessStockTransfer(
                    stockItemsData: state.stockItemsData,
                  ))
                      .then((value) {
                    _getItemList();
                  });
                }

                if (state is BusinessStockItemsNavigateToAddItemState) {
                  await ctx.router
                      .push(RouteBusinessAddAndEditStock(
                    categoryId: widget.categoryId,
                  ))
                      .then((value) {
                    _getItemList();
                  });
                }
              },
              builder: (context, state) {
                if (state is BusinessStockItemsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is BusinessStockItemsErrorState) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }
                return Expanded(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                      leading: Text(
                        '${state.stockItems.length} items',
                        style: AppStyles.subHeading14Semi,
                      ),
                      trailing: const Icon(Icons.menu_outlined),
                    ),
                    Expanded(
                        child: ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shrinkWrap: true,
                      itemCount: state.stockItems.length,
                      separatorBuilder: (context, index) => const Divider(
                        height: 1,
                        color: AppColors.textColorT3,
                      ),
                      itemBuilder: (context, index) {
                        var currentItem = state.stockItems[index];

                        return GestureDetector(
                          onTap: () {
                            log('tile clicked');
                            bloc.add(BusinessStockItemsTileClick(currentItem));
                          },
                          child: stockItemsListTile(currentItem),
                        );
                      },
                    )),
                  ]),
                );
              },
            )
          ],
        ),
        floatingActionButton: AppFloatingActionButton(
          icon: const Icon(Icons.add),
          label: 'New item',
          onTap: () {
            bloc.add(BusinessStockItemsAddItemClickEvent());
          },
        ));
  }

  Widget innerTiles({
    required String label,
    required Color color,
    required Color backgroundColor,
    required MiniTileType tileType,
    required StockItemsData stockItemsData,
  }) =>
      Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(4.r)),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        child: InkWell(
          onTap: () {
            bloc.add(BusinessStockItemMiniTileClick(
                tileType: tileType, stockItemsData: stockItemsData));
          },
          child: Center(
              child: Text(
            label,
            style: AppStyles.subHeading16Semi.copyWith(
              color: color,
            ),
          )),
        ),
      );

  Widget stockItemsListTile(StockItemsData currentItem) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      color: Colors.white,
      height: 115.h,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Available units ${currentItem.availableStock}',
                style: AppStyles.subHeading12,
              ),
              const Icon(Icons.more_vert)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                currentItem.brand!,
                style: AppStyles.subHeading16Semi,
              ),
              5.horizontalSpace,
              Container(
                decoration: BoxDecoration(
                    color: AppColors.borderColorTextField,
                    borderRadius: BorderRadius.circular(2.r)),
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Center(
                    child: Text(
                  currentItem.itemName!,
                  style: AppStyles.subHeading12500.copyWith(
                    color: AppColors.textColorT1,
                  ),
                )),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              innerTiles(
                label: 'In',
                color: AppColors.supportSP5,
                backgroundColor: AppColors.supportUI9,
                tileType: MiniTileType.stockIn,
                stockItemsData: currentItem,
              ),
              16.horizontalSpace,
              innerTiles(
                label: 'Out',
                color: AppColors.supportSP9,
                backgroundColor: AppColors.supportUI10,
                tileType: MiniTileType.stockOut,
                stockItemsData: currentItem,
              ),
              16.horizontalSpace,
              innerTiles(
                label: 'Transfer',
                color: AppColors.supportSP7,
                backgroundColor: AppColors.supportUI8,
                tileType: MiniTileType.stockTransfer,
                stockItemsData: currentItem,
              ),
            ],
          )
        ],
      ),
    );
  }

  _getItemList() {
    bloc.add(BusinessStockItemsInitialEvent(
      subCategoryId: widget.stock.subCategoryId!,
      businessId: widget.businessId,
      shopId: widget.shopId,
    ));
  }
}
