// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:quickprism/infrastructure/routing/app_router.dart';

import '../../../../application/business/business_create_item/business_create_item_bloc.dart';
import '../../../../core/assets/assets.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/styles/app_styles.dart';

@RoutePage()
class ScreenCreateItemSuccess extends StatefulWidget {
  final BusinessCreateItemBloc bloc;
  final BusinessCreateItemState state;
  ScreenCreateItemSuccess({
    Key? key,
    required this.bloc,
    required this.state,
  }) : super(key: key);

  @override
  State<ScreenCreateItemSuccess> createState() =>
      _CreateItemSuccessScreenState();
}

class _CreateItemSuccessScreenState extends State<ScreenCreateItemSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child:
                      //
                      Container(
                color: Colors.green,
              )
                  // SvgPicture.asset(
                  //   AppAssets.createItemSuccessBackground,
                  // ),
                  ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                   20.h.verticalSpace,
                  Image.asset(AppAssets.trollyWithTwoCardBoxes),
                  Text(
                    "Item Created \n Succesfully!",
                    style: AppStyles.activeTabStyleSuccess
                        .copyWith(color: const Color(0xff125D99)),
                  ),
              // =========================================
                  40.h.verticalSpace,
                  Column(
                    children: [
                      Material(
                        elevation: 10,
                        color: Colors.white,
                        shadowColor: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(widget.state.name,
                                      style: AppStyles.addunitsTitle),
                                  7.horizontalSpace,
                                  Text(
                                      // "HSN/SAC Code",
                                      widget.state.hsnSecCode.toString(),
                                      style: AppStyles.addunitsSubTitle),
                                ],
                              ),
                              2.verticalSpace,
                              Text("Category : ${widget.state.category}",
                                  style: AppStyles.addunitsSubTitle),
                              2.verticalSpace,
                              Text("Brand :${widget.state.brand}",
                                  style: AppStyles.addunitsSubTitle),
                              2.verticalSpace,
                              Text(
                                  "No. of Lot/s : ${widget.state.lotDetailsList.length}",
                                  style: AppStyles.addunitsSubTitle),
                              Text(
                                  // "Units: Carton, Box ,Packet , Item",
                                  "Units : ${widget.state.conversionUnitList}",
                                  style: AppStyles.addunitsSubTitle),
                              2.verticalSpace,
                            ],
                          ),
                        ),
                      ),
                      // ===
                      40.h.verticalSpace, 
                      Row(
                        children: [
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                context.router.push(const RouteCreateItem());
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 20.h),
                                decoration: BoxDecoration(
                                  color: const Color(0xff0E4572),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Center(
                                  child: FittedBox(
                                    child: Text(
                                      "+ Add Another ",
                                      style: AppStyles.inter16600T1.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          10.w.horizontalSpace,
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                context.popRoute();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 20.h),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xffDDEFFE).withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Row(
                                  // mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.arrow_forward),
                                    FittedBox(
                                      child: Text(
                                        "Item List",
                                        style: AppStyles.inter16600T1.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xff0E4572),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                   30.h.verticalSpace, 
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
