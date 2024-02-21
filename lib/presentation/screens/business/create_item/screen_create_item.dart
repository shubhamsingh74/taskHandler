import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_create_item/business_create_item_bloc.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';
import '../../../widgets/appbar/main_app_bar_business.dart';
import '../home/widget/main_drawer_widget.dart';
import 'widgets/add_lots_widget.dart';
import 'widgets/add_units_widget.dart';
import 'widgets/item_detail.dart';
import 'widgets/steps_widget.dart';
import 'widgets/unit_retation_widget.dart';

@RoutePage()
class ScreenCreateItem extends StatefulWidget {
  const ScreenCreateItem({super.key});

  @override
  State<ScreenCreateItem> createState() => _ScreenCreateItemState();
}

class _ScreenCreateItemState extends State<ScreenCreateItem> {
  BusinessCreateItemBloc createItemBloc = getIt<BusinessCreateItemBloc>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createItemBloc.add(BusinessCreateNewItemInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainAppDrawerBusiness(),
      appBar: MainAppBarBusiness(
        isLoading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 20.h),
            child:
                BlocConsumer<BusinessCreateItemBloc, BusinessCreateItemState>(
              bloc: createItemBloc,
              listener: (context, state) {
                if (state is BusinessCreateItemSuccessState) {
                  context.router.popAndPush(RouteCreateItemSuccess(
                      bloc: createItemBloc, state: state));
                }
              },
              builder: (context, state) {
                if (state is BusinessCreateItemLoadingState) {
                  return const AppLoadingWidget();
                }
                return Column(
                  children: [
                    getStepBar(state.stepNo),
                    Visibility(
                      visible: state.stepNo == 1,
                      child: WidgetCreateItemItemDetails(
                          businessCreateItemBloc: createItemBloc, state: state),
                    ),
                    Visibility(
                      visible: state.stepNo == 2,
                      child: Column(
                        children: [
                          Visibility(
                            visible: state.levelOfAddUnits == 1,
                            child: WidgetAddUnits(
                              bloc: createItemBloc,
                              state: state,
                            ),
                          ),
                          Visibility(
                              visible: state.levelOfAddUnits == 2,
                              child: UnitRelationWidget(
                                businessCreateItemBloc: createItemBloc,
                                state: state,
                              ))
                        ],
                      ),
                    ),
                    Visibility(
                      visible: state.stepNo == 3,
                      child: WidgetAddLots(
                        bloc: createItemBloc,
                        state: state,
                      ),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }

  Widget getStepBar(int step) {
    switch (step) {
      case 1:
        return const CreateItemStepOne();
      case 2:
        return const CreateItemStepTwo();
      case 3:
        return const CreateItemStepThree();
      default:
        return const CreateItemStepOne();
    }
  }
}

//====================
