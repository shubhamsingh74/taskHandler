import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_management/business_management_bloc.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/stocks/models/business_management/business_management_req_model.dart';
import 'package:quickprism/domain/stocks/models/shops_all_model/get_all_shops_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/presentation/widgets/button/bottom_navigation_bar.dart';
import 'package:quickprism/presentation/widgets/close_button_widget/app_close_button.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';
import 'package:quickprism/presentation/widgets/svg_icon_widget/svg_icon_widget.dart';

GlobalKey<FormState> bManagementKey = GlobalKey();
GlobalKey<FormState> bManagementBottomSheetKey = GlobalKey();

@RoutePage()
class ScreenBusinessManagement extends StatefulWidget {
  const ScreenBusinessManagement({super.key, this.store});

  final GetAllShopsData? store;

  @override
  State<ScreenBusinessManagement> createState() =>
      _ScreenBusinessManagementState();
}

class _ScreenBusinessManagementState extends State<ScreenBusinessManagement> {
  final bloc = getIt<BusinessManagementBloc>();

  TextEditingController storeController = TextEditingController();
  TextEditingController fullAddressController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController gstinController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  final lowStockAlertController = ValueNotifier<bool>(false);
  bool enabled = true;
  bool editMode = false;
  Color? storeIconColor;

  @override
  void initState() {
    storeIconColor = AppColors.randomColorForShop(widget.store?.shopColour);

    if (widget.store == null) {
      editMode = true;
    } else {
      var addrs = widget.store!.address!;

      storeController.text = widget.store!.shopName!;
      gstinController.text = widget.store!.gstIn!;
      streetController.text = addrs.streetAddress!;
      pinController.text = addrs.pincode!.toString();
      cityController.text = addrs.city!;
      stateController.text = addrs.state!;
      lowStockAlertController.value = widget.store!.isWarehouse ?? false;
      fullAddressController.text =
          '${addrs.streetAddress!},${addrs.city!},${addrs.state!},';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessManagementBloc, BusinessManagementState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is BusinessManagementNavigateBackState) {
          context.router.pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: storeController.text == ''
                ? Text(
                    "...your store name",
                    style: AppStyles.inter50016.copyWith(
                      fontSize: 18.sp,
                      color: AppColors.textColorT3,
                    ),
                  )
                : Text(
                    storeController.text,
                    style: AppStyles.inter50016.copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
            actions: [
              widget.store == null
                  ? 1.horizontalSpace
                  : TextButton.icon(
                      onPressed: () {
                        setState(() {
                          editMode = !editMode;
                        });
                      },
                      label: Text(
                        'Edit',
                        style: AppStyles.inter50016.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.secondary,
                        ),
                      ),
                      icon: Icon(
                        editMode ? Icons.edit : Icons.edit_off,
                        size: 16.sp,
                        color: AppColors.secondary,
                      ),
                    )
            ],
          ),
          bottomNavigationBar: ButtonBottomNavigationBar(
            title: "Save",
            isActive: editMode,
            onTap: () async {
              if (_formValidateMain()) {
                _saveOrUpdate();
                // if (_isFullAddress()) {
                //   await showModalBottomSheet(
                //     isScrollControlled: true,
                //     context: context,
                //     builder: (ctx) {
                //       return _bottomSheetWidget(context: ctx);
                //     },
                //   );
                // } else {
                //   _saveOrUpdate();
                // }
              }
            },
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Form(
                  key: bManagementKey,
                  child: Column(
                    children: [
                      25.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Store name',
                            style: AppStyles.tileStyleGray,
                          ),
                          const Spacer(),
                        ],
                      ),
                      NormalTextField(
                        hintText: "Enter shop name*",
                        enabled: editMode,
                        controller: storeController,
                        validator: _nameValidator,
                        prefix:
                            //
                            AppSvgIconWidget(
                          iconPath: AppAssets.storeIcon,
                          color: storeIconColor!,
                          size: 20.w,
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      12.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'GST',
                            style: AppStyles.tileStyleGray,
                          ),
                          const Spacer(),
                        ],
                      ),
                      NormalTextField(
                        hintText: "Enter Gst*",
                        enabled: editMode,
                        controller: gstinController,
                        // validator: _gstValidator,
                        //
                      ),
                      12.h.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pincode',
                            style: AppStyles.tileStyleGray,
                          ),
                          Spacer(),
                        ],
                      ),
                      NormalTextField(
                        maxLength: 6,
                        enabled: editMode,
                        controller: pinController,
                        hintText: "Enter Pincode*",
                        inputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: _pinCodeValidator,
                        suffix: editMode
                            ? Padding(
                                padding: EdgeInsets.only(right: 16.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.store == null
                                          ? 'Add full address +'
                                          : "Edit full address",
                                      style: AppStyles.styleInter14500T7
                                          .copyWith(fontSize: 17.sp),
                                    ),
                                  ],
                                ),
                              )
                            : null,
                        onSuffixTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (ctx) {
                              return _bottomSheetWidget(context: ctx);
                            },
                          );
                        },
                      ),
                      12.h.verticalSpace,
                      editMode
                          ? 1.horizontalSpace
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Full Address',
                                      style: AppStyles.tileStyleGray,
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                NormalTextField(
                                  hintText: "Full Address",

                                  enabled: editMode,
                                  controller: fullAddressController,
                                  validator: _nameValidator,

                                  //
                                ),
                                12.h.verticalSpace,
                              ],
                            ),
                      Row(
                        children: [
                          2.horizontalSpace,
                          AdvancedSwitch(
                            enabled: editMode,
                            height: 16.h,
                            width: 25.w,
                            controller: lowStockAlertController,
                            activeColor: AppColors.textColorGreen,
                            thumb: ValueListenableBuilder<bool>(
                              valueListenable: lowStockAlertController,
                              builder: (_, value, __) {
                                return Icon(
                                  Icons.circle,
                                  color: Colors.white,
                                  size: 12.h,
                                );
                              },
                            ),
                          ),
                          8.horizontalSpace,
                          Text(
                            'Mark this store as warehouse',
                            style: AppStyles.tileStyleGray,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _bottomSheetWidget({required BuildContext context}) {
    return Container(
      height: 1.sh / 1.4,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.w,
      ),
      child: Form(
        key: bManagementBottomSheetKey,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Record address',
                  style: TextStyle(
                    color: Color(0xFF3D3D3D),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AppRoundActionButtonWidget(
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            24.verticalSpace,
            NormalTextField(
              controller: streetController,
              hintText: "Street Address",
              label: "Street Address",
              validator: _nameValidator,
            ),
            8.verticalSpace,
            NormalTextField(
              maxLength: 6,
              inputType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: pinController,
              hintText: "Pincode",
              label: "Pincode",
              validator: _pinCodeValidator,
            ),
            8.verticalSpace,

            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: NormalTextField(
                      controller: cityController,
                      hintText: "City",
                      label: "City",
                      validator: _cityValidator,
                    ),
                  ),
                  16.horizontalSpace,
                  Flexible(
                    child: NormalTextField(
                      controller: stateController,
                      label: "State",
                      hintText: "State",
                      validator: _stateValidator,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),
            //  AppPrimaryButton()
            ButtonBottomNavigationBar(
              title: "Save",
              onTap: () {
                if (_formValidateBottomSheet()) {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  bool _isFullAddress() {
    return (streetController.text == '' ||
        cityController.text == '' ||
        stateController.text == '');
  }

  void _saveOrUpdate() {
    var reqModel = BusinessManagementReqModel(
      businessId: UserConstants.currentBusiness!.businessProfile!.businessId!,
      shopName: storeController.text,
      shopColor: storeIconColor!.toString().split('0xff')[1].split(')')[0],
      isWareHouse: lowStockAlertController.value,
      gstIN: gstinController.text,
      state: stateController.text,
      city: cityController.text,
      street: streetController.text,
      pin: int.parse(pinController.text),
      storeId: widget.store?.shopId,
    );

    if (widget.store == null) {
      bloc.add(BusinessManagementSaveEvent(reqModel: reqModel));
    } else {
      bloc.add(BusinessManagementUpdateEvent(reqModel: reqModel));
    }
  }

  bool _formValidateMain() {
    final FormState? form = bManagementKey.currentState;
    if (form != null && form.validate()) {
      return true;
    }

    return false;
  }

  bool _formValidateBottomSheet() {
    final FormState? form = bManagementBottomSheetKey.currentState;
    if (form != null && form.validate()) {
      return true;
    }

    return false;
  }

  String? _nameValidator(String? text) {
    if (text != null && text.isEmpty) {
      return 'Enter your Name';
    }

    return null;
  }

  String? _gstValidator(String? text) {
    if (text != null && text.isEmpty) {
      return 'Enter your gst number';
    }

    return null;
  }

  String? _streetValidator(String? text) {
    if (text != null && text.isEmpty) {
      return 'Enter your street';
    }

    return null;
  }

  String? _pinCodeValidator(String? text) {
    if (text != null && text.isEmpty) {
      return 'Enter your pincode';
    } else if (text != null && text.length != 6) {
      return 'Invalid pincode';
    }

    return null;
  }

  String? _cityValidator(String? text) {
    if (text != null && text.isEmpty) {
      return 'Enter your city';
    }
    return null;
  }

  String? _stateValidator(String? text) {
    if (text != null && text.isEmpty) {
      return 'Enter your State';
    }

    return null;
  }
}
