import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/stocks/models/suppliers/suppliers_model.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/appbar/appbar_action_button.dart';
import 'package:quickprism/presentation/widgets/appbar/main_appbar.dart';

@RoutePage()
class ScreenStockInSelectSupplier extends StatefulWidget {
  const ScreenStockInSelectSupplier(
      {super.key, required this.currentSupplier, required this.suppliers});
  final SuppliersDatum? currentSupplier;
  final List<SuppliersDatum> suppliers;
  @override
  State<ScreenStockInSelectSupplier> createState() =>
      _ScreenStockInSelectSupplierState();
}

class _ScreenStockInSelectSupplierState
    extends State<ScreenStockInSelectSupplier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Select supplier',
        context: context,
        actions: [
          AppBarActionButton(
            icon: Icons.add,
            label: 'Add supplier',
            onTap: () async {
              await context.router
                  .push(RouteBusinessAddSupplier())
                  .then((value) {
                if (value != null) {
                  value as List<SuppliersDatum>;
                  setState(() {
                    widget.suppliers.add(value[0]);
                  });
                }
              });
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          16.verticalSpace,
          Row(
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 16.w),
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      border:
                          Border.all(color: AppColors.borderColorTextField)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      16.horizontalSpace,
                      const Icon(Icons.search),
                      8.horizontalSpace,
                      Text(
                        'Search by name or QPID',
                        style: AppStyles.subHeading12,
                      )
                    ],
                  ),
                ),
              ),
              16.horizontalSpace,
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(right: 16.w),
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: AppColors.borderColorTextField,
                      borderRadius: BorderRadius.circular(100.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'All',
                        style: AppStyles.subHeading12
                            .copyWith(color: AppColors.textColorT1),
                      ),
                      5.horizontalSpace,
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),
            ],
          ),
          16.verticalSpace,
          Row(
            children: [
              16.horizontalSpace,
              Text(
                'Saved suppliers (6)',
                style: AppStyles.subHeading16,
              ),
            ],
          ),
          16.verticalSpace,
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ListView.builder(
                itemCount: widget.suppliers.length,
                itemBuilder: (context, index) => _supplierTile(
                      supplier: widget.suppliers[index],
                      selectedSupplier: widget.currentSupplier,
                    )),
          )),
        ],
      ),
    );
  }

  _supplierTile(
      {required SuppliersDatum supplier,
      required SuppliersDatum? selectedSupplier}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      isThreeLine: true,
      title: Text(
        supplier.name!,
        style: AppStyles.subHeading14.copyWith(color: AppColors.textColorT1),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${supplier.addressId}',
            style: AppStyles.subHeading12,
          ),
          Text(
            'last purchased on ${supplier.createdAt}',
            style: AppStyles.subHeading12,
          ),
        ],
      ),
      trailing: selectedSupplier == supplier
          ? Icon(
              Icons.circle_rounded,
              color: AppColors.oldPrimaryP1,
            )
          : Icon(Icons.circle_outlined),
      onTap: () {
        setState(() {
          selectedSupplier = supplier;
        });
        context.router.pop([selectedSupplier]);
      },
    );
  }
}
