import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_stock_item_info/business_stock_item_info_bloc.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/stocks/models/items/stock_items_model.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/appbar/appbar_action_button.dart';
import 'package:quickprism/presentation/widgets/appbar/main_appbar.dart';

import '../../../../../core/styles/app_styles.dart';

@RoutePage()
class ScreenStockItemInfo extends StatefulWidget {
  const ScreenStockItemInfo({super.key, required this.itemsData});

  final StockItemsData itemsData;

  @override
  State<ScreenStockItemInfo> createState() => _ScreenStockItemInfoState();
}

class _ScreenStockItemInfoState extends State<ScreenStockItemInfo> {
  final bloc = getIt<BusinessStockItemInfoBloc>();

  @override
  void initState() {
    bloc.add(
        BusinessStockItemInfoInitialEvent(itemId: widget.itemsData.itemId!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: widget.itemsData.brand,
        context: context,
        actions: [
          AppBarActionButton(
            label: 'Edit',
            onTap: () {
              bloc.add(BusinessStockItemInfoEditItemClickEvent());
            },
          )
        ],
      ),
      body: BlocConsumer<BusinessStockItemInfoBloc, BusinessStockItemInfoState>(
        bloc: bloc,
        listenWhen: (prev, current) =>
            (current is BusinessStockItemInfoActionState),
        buildWhen: (prev, current) =>
            (current is! BusinessStockItemInfoActionState),
        listener: (ctx, state) async {
          if (state is BusinessStockItemInfoNavigateToEditItem) {
            if (state.itemInfoModel == null) {
              log('item_model is null');
            } else {
              log('item_model is not null');

              await ctx.router
                  .push(RouteBusinessAddAndEditStock(
                itemInfoModel: state.itemInfoModel,
              ))
                  .then((value) {
                bloc.add(BusinessStockItemInfoInitialEvent(
                    itemId: widget.itemsData.itemId!));
              });
            }
          }
        },
        builder: (context, state) {
          if (state is BusinessStockItemInfoLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is BusinessStockItemInfoErrorState) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
          if (state is BusinessStockItemInfoInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              24.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          state.itemInfoModel!.categoryName!,
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
                            state.itemInfoModel!.itemName!,
                            style: AppStyles.subHeading12500.copyWith(
                              color: AppColors.textColorT1,
                            ),
                          )),
                        ),
                      ],
                    ),
                    24.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        topInfoTile(
                            head: 'Sales price',
                            value: 'Rs ${state.itemInfoModel!}'),
                        topInfoTile(
                            head: 'Purchase price',
                            value: 'Rs ${state.itemInfoModel!}'),
                        topInfoTile(
                            head: 'HSN',
                            value: '${state.itemInfoModel!.hsnSacCode}'),
                        topInfoTile(
                            head: 'GST', value: '${state.itemInfoModel}%'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget topInfoTile({required String head, required String value}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          head,
          style: AppStyles.subHeading12,
        ),
        Text(
          value,
          style: AppStyles.subHeading12700,
        ),
      ],
    );
  }
}
