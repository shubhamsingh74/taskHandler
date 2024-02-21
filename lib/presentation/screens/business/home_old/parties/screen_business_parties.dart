// import 'dart:developer';

// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:quickprism/application/business/business_parties_home/business_parties_home_bloc.dart';
// import 'package:quickprism/core/colors/app_colors.dart';
// import 'package:quickprism/core/styles/app_styles.dart';
// import 'package:quickprism/core/utils/extensions.dart';
// import 'package:quickprism/domain/core/di/injectable.dart';
// import 'package:quickprism/infrastructure/routing/app_router.dart';
// import 'package:quickprism/presentation/widgets/empty_widget/empty_widget.dart';
// import 'package:quickprism/presentation/widgets/floating_action_button/app_floating_action_button.dart';
// import 'package:quickprism/presentation/widgets/form_fields/search_text_field.dart';

// class ScreenBusinessParties extends StatefulWidget {
//   const ScreenBusinessParties({super.key});

//   @override
//   State<ScreenBusinessParties> createState() => _ScreenBusinessPartiesState();
// }

// class _ScreenBusinessPartiesState extends State<ScreenBusinessParties> {
//   final bloc = getIt<BusinessPartiesHomeBloc>();
//   TextEditingController supplierSearchController = TextEditingController();
//   TextEditingController customerSearchController = TextEditingController();
//   @override
//   void initState() {
//     bloc.add(BusinessPartiesHomeInitialEvent());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: BlocConsumer<BusinessPartiesHomeBloc, BusinessPartiesHomeState>(
//         bloc: bloc,
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           if (state is BusinessPartiesHomeLoadingState) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           if (state is BusinessPartiesHomeErrorState) {
//             log("suppliers => ${state.suppliers.length}");
//             log("customers => ${state.customers.length}");

//             return const Center(
//               child: AppEmptyWidget(
//                 message: 'Something went wrong',
//               ),
//             );
//           }

//           return Scaffold(
//             body: Column(
//               children: [
//                 TabBar(
//                   labelStyle: AppStyles.subHeading14Semi.copyWith(
//                       color: AppColors.oldPrimaryP2,
//                       fontWeight: FontWeight.w600),
//                   indicatorSize: TabBarIndicatorSize.tab,
//                   indicatorColor: AppColors.oldPrimaryP2,
//                   unselectedLabelStyle: AppStyles.subHeading14Semi,
//                   tabs: const [
//                     Tab(
//                       text: 'Suppliers',
//                     ),
//                     Tab(
//                       text: 'Customers',
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   child: TabBarView(
//                     children: [
//                       suppliersTab(state),
//                       customersTab(state),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   suppliersTab(BusinessPartiesHomeState state) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           16.verticalSpace,
//           Row(
//             children: <Widget>[
//               Flexible(
//                 flex: 3,
//                 child: MainSearchTextField(
//                   controller: supplierSearchController,
//                   onChanged: (e) {
//                     bloc.add(
//                         BusinessPartiesHomeSearchSupplierEvent(searchText: e));
//                   },
//                 ),
//               ),
//               8.horizontalSpace,
//               Flexible(
//                 child: Container(
//                   margin: EdgeInsets.only(right: 16.w),
//                   height: 40.h,
//                   decoration: BoxDecoration(
//                       color: AppColors.borderColorTextField,
//                       borderRadius: BorderRadius.circular(100.r)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'All',
//                         style: AppStyles.subHeading12
//                             .copyWith(color: AppColors.textColorT1),
//                       ),
//                       5.horizontalSpace,
//                       const Icon(Icons.keyboard_arrow_down),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           16.verticalSpace,
//           Expanded(
//               child: state.suppliers.isEmpty
//                   ? const AppEmptyWidget(
//                       message: 'No suppliers for now',
//                     )
//                   : ListView.builder(
//                       padding: EdgeInsets.only(top: 16.h),
//                       itemCount: state.suppliers.length,
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         var currentData = state.suppliers[index];

//                         return ListTile(
//                           title: Text(
//                             "${currentData.name}",
//                             style: AppStyles.subHeading14
//                                 .copyWith(color: AppColors.textColorT1),
//                           ),
//                           subtitle: Text(
//                             'Last purchased on ${currentData.updatedAt.toString().split(' ')[0]}',
//                             style: AppStyles.subHeading12,
//                           ),
//                           trailing: Text(
//                               'ID : ${currentData.businessSupplierId}',
//                               style: AppStyles.subHeading14500),
//                         );
//                       }))
//         ],
//       ),
//       floatingActionButton: AppFloatingActionButton(
//         icon: const Icon(Icons.add),
//         label: 'New supplier',
//         onTap: () async {
//           await context.router
//               .push(const RouteBusinessAddSupplier())
//               .then((value) {
//             bloc.add(BusinessPartiesHomeInitialEvent());
//           });
//         },
//       ),
//     );
//   }

//   customersTab(BusinessPartiesHomeState state) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           16.verticalSpace,
//           Row(
//             children: <Widget>[
//               Flexible(
//                 flex: 3,
//                 child: MainSearchTextField(
//                   controller: customerSearchController,
//                   onChanged: (e) {
//                     bloc.add(
//                         BusinessPartiesHomeSearchCustomerEvent(searchText: e));
//                   },
//                 ),
//               ),
//               8.horizontalSpace,
//               Flexible(
//                 child: Container(
//                   margin: EdgeInsets.only(right: 16.w),
//                   height: 40.h,
//                   decoration: BoxDecoration(
//                       color: AppColors.borderColorTextField,
//                       borderRadius: BorderRadius.circular(100.r)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'All',
//                         style: AppStyles.subHeading12
//                             .copyWith(color: AppColors.textColorT1),
//                       ),
//                       5.horizontalSpace,
//                       const Icon(Icons.keyboard_arrow_down),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           16.verticalSpace,
//           Expanded(
//               child: state.customers.isEmpty
//                   ? const AppEmptyWidget(
//                       message: 'No customers for now',
//                     )
//                   : ListView.builder(
//                       padding: EdgeInsets.only(top: 16.h),
//                       itemCount: state.customers.length,
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         var currentData = state.customers[index];

//                         return ListTile(
//                           title: Text(
//                             "${currentData.name}",
//                             style: AppStyles.subHeading14
//                                 .copyWith(color: AppColors.textColorT1),
//                           ),
//                           subtitle: Text(
//                             'ID : ${currentData.businessCustomerId}',
//                             style: AppStyles.subHeading12,
//                           ),
//                           trailing: Builder(builder: (context) {
//                             var mainColor = AppColors.supportSP1;
//                             var secColor = AppColors.supportSP1;

//                             if (currentData.customerType!.toLowerCase() ==
//                                 'regular') {
//                               mainColor = AppColors.supportSP7;
//                               secColor = AppColors.supportUI8;
//                             }

//                             return Container(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 8.w, vertical: 4.w),
//                               decoration: BoxDecoration(
//                                 color: secColor,
//                               ),
//                               child: Text(
//                                 currentData.customerType!.capitalize(),
//                                 style: AppStyles.subHeading14500.copyWith(
//                                   color: mainColor,
//                                 ),
//                               ),
//                             );
//                           }),
//                         );
//                       }))
//         ],
//       ),
//       floatingActionButton: AppFloatingActionButton(
//         icon: const Icon(Icons.add),
//         label: 'New customer',
//         onTap: () async {
//           await context.router
//               .push(const RouteBusinessAddCustomer())
//               .then((value) {
//             bloc.add(BusinessPartiesHomeInitialEvent());
//           });
//         },
//       ),
//     );
//   }
// }
