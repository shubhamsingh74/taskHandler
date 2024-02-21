import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/presentation/screens/business/transactions/quotation/widgets/steps_widget_quotation.dart';
import 'package:quickprism/presentation/screens/business/transactions/quotation/widgets/widget_final_details.dart';
import 'package:quickprism/presentation/screens/business/transactions/quotation/widgets/widget_product_details.dart';
import 'package:quickprism/presentation/screens/business/transactions/quotation/widgets/widget_quotation_details.dart';
import 'package:quickprism/presentation/widgets/appbar/main_app_bar_business.dart';

class ScreenCreateQuotation extends StatefulWidget {
  const ScreenCreateQuotation({super.key});

  @override
  State<ScreenCreateQuotation> createState() => _ScreenCreateQuotationState();
}

class _ScreenCreateQuotationState extends State<ScreenCreateQuotation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBarBusiness(isLoading: false),
      body:  Padding(
        padding:EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 10.h.verticalSpace,
            Row(
              children: [
                InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    AppAssets.imageArrowLeft,
                    height: 28.h,
                    width: 30.w,
                    fit: BoxFit.fill,
                  ),
                ),
                10.w.horizontalSpace,
                Text(
                  "Create Quotation",
                  style: AppStyles.inter70018282828
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            10.h.verticalSpace,
            getStepBar(1),
            10.h.verticalSpace,
            const Visibility(
              visible: true,
              child: WidgetQuotationDetails(
                  // businessCreateItemBloc: createItemBloc,
                  // state: state
                  ),
            ),

            const Visibility(
              visible: false,
              child: Column(
                children: [
                  Visibility(
                    visible: true,
                    child: WidgetProductDetails(
                        // bloc: createItemBloc,
                        // state: state,
                        ),
                  ),
                  // Visibility(
                  //     visible: state.levelOfAddUnits == 2,
                  //     child: UnitRelationWidget(
                  //       businessCreateItemBloc: createItemBloc,
                  //       state: state,
                  //     ))
                ],
              ),
            ),
            const Visibility(
              visible: false,
              child: WidgetFinalDetails(
                  // bloc: createItemBloc,
                  // state: state,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getStepBar(int step) {
    switch (step) {
      case 1:
        return const CreateQuotationProductStepOne();
      case 2:
        return const CreateQuotationProductStepTwo();
      case 3:
        return const CreateQuotationProductStepThree();
      default:
        return const CreateQuotationProductStepOne();
    }
  }
}
