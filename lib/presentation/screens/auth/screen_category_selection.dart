import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/auth/category_selection/auth_category_bloc.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/utils.dart';
import 'package:quickprism/domain/auth/models/auth/signup_req_model.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/auth_list_tile/auth_list_tile.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';

@RoutePage()
class ScreenAuthCategorySelection extends StatefulWidget {
  const ScreenAuthCategorySelection({super.key, required this.signUpReqModel});
  final SignUpReqModel signUpReqModel;

  @override
  State<ScreenAuthCategorySelection> createState() =>
      _ScreenAuthCategorySelectionState();
}

class _ScreenAuthCategorySelectionState
    extends State<ScreenAuthCategorySelection> {
  AuthCategoryBloc authCategoryBloc = getIt<AuthCategoryBloc>();

  @override
  void initState() {
    authCategoryBloc.add(AuthCategoryInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<AuthCategoryBloc, AuthCategoryState>(
        bloc: authCategoryBloc,
        listenWhen: (prev, current) => (current is AuthCategoryActionState),
        // buildWhen: (prev, current) => (current is! AuthCategoryActionState),
        listener: (ctx, state) {
          if (state is AuthCategoryNavigateToHomeState) {
            ctx.router.replaceAll([ RouteBusinessHome()]);
          }

          if (state is AuthCategoryShowErrorSnackBarState) {
            Utils.errorToast(ctx, state.error);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              49.verticalSpace,
              Text(
                'Select category you deal in',
                style: AppStyles.heading,
                textAlign: TextAlign.center,
              ),
              35.verticalSpace,
              Expanded(
                child: Builder(builder: (context) {
                  if (state is AuthCategoryLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is AuthCategoryErrorState) {
                    return Center(
                      child: Text(
                        'Something went wrong',
                        style: AppStyles.subHeading14
                            .copyWith(color: AppColors.oldPrimaryP2),
                      ),
                    );
                  }

                  return state.categories.isNotEmpty
                      ? ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.categories.length,
                          separatorBuilder: (context, index) => const Divider(
                            height: 0,
                            color: AppColors.textColorT3,
                          ),
                          itemBuilder: (context, index) {
                            var category = state.categories[index];
                            var isChecked =
                                state.selectedCategories.contains(category);

                            return AuthCategoryListTile(
                                checked: isChecked,
                                title: category.name,
                                onChanged: (_) {
                                  authCategoryBloc
                                      .add(AuthCategoryTileClickEvent(
                                    categoryModel: category,
                                  ));
                                });
                          },
                        )
                      : Center(
                          child: Text(
                            'No Categories found',
                            style: AppStyles.subHeading14
                                .copyWith(color: AppColors.textColorT2),
                          ),
                        );
                }),

                // child: state.categories.isNotEmpty
                //     ? ListView.separated(
                //         physics: const BouncingScrollPhysics(),
                //         shrinkWrap: true,
                //         itemCount: state.selectedCategories.length,
                //         separatorBuilder: (context, index) => const Divider(
                //           height: 0,
                //           color: AppColors.textColorT3,
                //         ),
                //         itemBuilder: (context, index) {
                //           var category = state.categories[index];
                //           var isChecked =
                //               state.selectedCategories.contains(category);
                //
                //           return AuthCategoryListTile(
                //               checked: isChecked,
                //               title: category.name,
                //               onChanged: (_) {
                //                 authCategoryBloc.add(AuthCategoryTileClickEvent(
                //                   categoryModel: category,
                //                 ));
                //               });
                //         },
                //       )
                //     : Center(
                //         child: Text(
                //           'No Categories found',
                //           style: AppStyles.subHeading14
                //               .copyWith(color: AppColors.textColorT2),
                //         ),
                //       ),
              ),
              16.verticalSpace,
              AppPrimaryButton(
                  label: 'Next',
                  onTap: () {
                    authCategoryBloc.add(AuthCategoryNextButtonClickEvent(
                        signUpReqModel: widget.signUpReqModel));
                  }),
              16.verticalSpace,
            ],
          );
        },
      )),
    );
  }
}
