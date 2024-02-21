import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';
import 'package:quickprism/presentation/widgets/normal_dropdown/normal_dropdown.dart';
import 'package:quickprism/presentation/widgets/svg_icon_widget/svg_icon_widget.dart';

class ScreenCreateRequisition extends StatefulWidget {
  const ScreenCreateRequisition({super.key});

  @override
  State<ScreenCreateRequisition> createState() =>
      _ScreenCreateRequisitionState();
}

class _ScreenCreateRequisitionState extends State<ScreenCreateRequisition> {
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemCategoryController = TextEditingController();
  final TextEditingController _itemDescriptionController = TextEditingController();
  final TextEditingController _itemQualityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imagePurchaseBack,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 30)
                          .copyWith(top: 40),
                  child: customAppBarRequisition(context: context)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30)
                    .copyWith(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            //context.router.back();
                          },
                          child: Image.asset(
                            AppAssets.imageArrowLeft,
                            height: 34,
                            width: 38,
                            fit: BoxFit.fill,
                          ),
                        ),
                        10.w.horizontalSpace,
                        Text(
                          "Create Requisition ",
                          style: AppStyles.purchaseTask,
                        )
                      ],
                    ),
                    15.h.verticalSpace,
                    Text(
                      "Item Name",
                      style: AppStyles.purchaseText,
                    ),
                    2.h.verticalSpace,
                    NormalTextFieldPurchase(
                      isFilled: true,
                      borderColor: Colors.white,
                      inputType: TextInputType.name,
                      label: "Add Item Name",
                      hintText: "Add Item Name",
                      controller: _itemNameController,
                    ),
                    5.h.verticalSpace,
                    Text(
                      "Item Category",
                      style: AppStyles.purchaseText,
                    ),
                    2.h.verticalSpace,
                    NormalTextFieldPurchase(
                      isFilled: true,
                      borderColor: Colors.white,
                      inputType: TextInputType.name,
                      label: "Add Item Category",
                      hintText: "Add Item Category",
                      controller: _itemCategoryController,
                    ),
                    5.h.verticalSpace,
                    Text(
                      "Item Description",
                      style: AppStyles.purchaseText,
                    ),
                    2.h.verticalSpace,
                    NormalTextFieldPurchase(
                      isFilled: true,
                      borderColor: Colors.white,
                      inputType: TextInputType.emailAddress,
                      label: "Add Item Description",
                      hintText: "Add Item Description",
                      controller: _itemDescriptionController,
                    ),
                    5.h.verticalSpace,
                    Text(
                      "Item Quantity",
                      style: AppStyles.purchaseText,
                    ),
                    2.h.verticalSpace,
                    NormalTextFieldPurchase(
                      isFilled: true,
                      borderColor: Colors.white,
                      inputType: TextInputType.number,
                      label: "Add Item Quantity",
                      hintText: "Add Item Quantity",
                      controller: _itemQualityController,
                    ),
                    5.h.verticalSpace,
                    Text(
                      "Units",
                      style: AppStyles.purchaseText,
                    ),
                    2.h.verticalSpace,
                    const NormalDropDown(
                      fillcolor: Colors.white,
                      height: 55,
                      hintText: "Add Units",
                      entries: [],
                    ),
                    5.h.verticalSpace,
                    customAddMoreRowWidget(
                        onTap: () {}, title: 'Add More Items '),
                    5.h.verticalSpace,
                    Text(
                      "Select Vendor",
                      style: AppStyles.purchaseText,
                    ),
                    2.h.verticalSpace,
                    const NormalDropDown(
                      fillcolor: Colors.white,
                      height: 55,
                      hintText: "Select Vendor",
                      entries: [],
                    ),
                    5.h.verticalSpace,
                    customAddMoreRowWidget(
                        onTap: () {}, title: 'Add More Sellers '),
                    10.h.verticalSpace,
                    customButtonRowWidget(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///--------customButtons
  customButtonRowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () {
            ///---------just for the checking flow
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenSuccessRequisition(),
                ));
          },
          child: Material(
            elevation: 10,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              decoration: BoxDecoration(
                  color: const Color(0xff1DB4C9),
                  borderRadius: BorderRadius.circular(8.r)),
              child: const Text(
                "Send a Requisition",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () {
            context.router.back();
          },
          child: Material(
            elevation: 10,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.red, width: 2)),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  ///-------add more widget
  customAddMoreRowWidget({required VoidCallback onTap, required String title}) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            elevation: 10,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(100),
            child: Container(
              padding: EdgeInsets.all(6.sp),
              decoration: const BoxDecoration(
                color: Color(0xff1DB4C9),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20.sp,
              ),
            ),
          ),
          10.w.horizontalSpace,
          Text(
            title,
            style: AppStyles.purchaseTextAddMore,
          )
        ],
      ),
    );
  }
}

///---------screen success requisition.
class ScreenSuccessRequisition extends StatefulWidget {
  const ScreenSuccessRequisition({super.key});

  @override
  State<ScreenSuccessRequisition> createState() =>
      _ScreenSuccessRequisitionState();
}

class _ScreenSuccessRequisitionState extends State<ScreenSuccessRequisition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            AppAssets.imagePurchaseSuccess,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: customAppBarRequisition(context: context),
                ),
                20.h.verticalSpace,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 20)
                          .copyWith(top: 40),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Material(
                        elevation: 5,
                        shadowColor: Colors.grey.shade200.withOpacity(0.5),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.r),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10)
                              .copyWith(bottom: 15),
                          padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15)
                              .copyWith(bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('QuickRequisition',
                                  style: AppStyles.purchaseTextModeSuccess),
                              10.h.verticalSpace,
                              Image.asset(
                                AppAssets.imagePurchasePaperPlane,
                                height: 294,
                                width: 336,
                                fit: BoxFit.fill,
                              ),
                              5.h.verticalSpace,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pepsi",
                                    style: AppStyles.purchaseSuccesItemName,
                                  ),
                                  5.h.verticalSpace,
                                  customRowNameWidgets(
                                      title: 'Category',
                                      subTitle: 'Cold Drinks'),
                                  customRowNameWidgets(
                                      title: 'Qty.', subTitle: '50 Cartons'),
                                  customRowNameWidgets(
                                      title: 'Sent to', subTitle: 'Vendor 1'),
                                  customRowNameWidgets(
                                      title: '  ', subTitle: 'Vendor 2'),
                                  10.h.verticalSpace,
                                  Text(
                                    'Response : Pending',
                                    style: AppStyles.purchaseTextModeCategory
                                        .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xff048698)),
                                  ),
                                  25.h.verticalSpace,
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: customRowButtonWidget()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  customRowNameWidgets({required String title, required String subTitle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.requisitionTextModeCategory,
        ),
        const Spacer(),
        Text(
          subTitle,
          style: AppStyles.requisitionTextModeCategory
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget customRowButtonWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () {},
          child: Material(
            elevation: 10,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              decoration: BoxDecoration(
                  color: const Color(0xff1DB4C9),
                  borderRadius: BorderRadius.circular(8.r)),
              child: const Text(
                "Send another Requisition",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () {
            context.router.back();
          },
          child: Material(
            elevation: 10,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: const Color(0xff1DB4C9), width: 2)),
              child: const Text(
                "Back to Home",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff298D9A),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

///-------appbar for this screen.
Widget customAppBarRequisition({required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      AppSvgIconWidget(
        iconPath: AppAssets.imageThreeLines,
        size: 50,
        onTap: () {
          context.router.back();
        },
      ),
      10.horizontalSpace,
      Text(
        "B-Name",
        style: AppStyles.createITemTitleSTyle.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 25,
            color: const Color(0xff2E4251)),
      ),
      const Spacer(),
      InkWell(
        splashFactory: NoSplash.splashFactory,
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppColors.itemstoreColor2, width: 1)),
          child: Row(
            children: [
              const AppSvgIconWidget(
                iconPath: AppAssets.storeIcon,
                size: 15,
                color: AppColors.storeColor1,
              ),
              Text(
                "Store1",
                style: AppStyles.storeTitle,
              ),
              15.horizontalSpace,
              const AppSvgIconWidget(
                iconPath: AppAssets.iconsDown,
                size: 10,
              )
            ],
          ),
        ),
      ),
      10.horizontalSpace,
      InkWell(
          onTap: () {},
          splashFactory: NoSplash.splashFactory,
          child: const CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(
              AppAssets.imageGirlImage,
            ),
          )),
      // AppSvgIconWidget(
      //   onTap: () {},
      //   iconPath: AppAssets.iconsSetting,
      //   size: 24,
      //   color: Colors.black45,
      // )
    ],
  );
}
