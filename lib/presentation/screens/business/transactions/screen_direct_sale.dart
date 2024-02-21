import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';
import 'package:quickprism/presentation/widgets/normal_dropdown/normal_dropdown.dart';
import 'package:quickprism/presentation/widgets/svg_icon_widget/svg_icon_widget.dart';

class ScreenDirectSale extends StatefulWidget {
  const ScreenDirectSale({super.key});

  @override
  State<ScreenDirectSale> createState() => _ScreenDirectSaleState();
}

class _ScreenDirectSaleState extends State<ScreenDirectSale> {
  final TextEditingController _invoiceController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _billCutsomerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imagesaleScreenWhite,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 20.sp)
                .copyWith(top: 40.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customAppBarSale(context: context),
                40.h.verticalSpace,
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
                      "Tax Invoice",
                      style: AppStyles.purchaseTask,
                    )
                  ],
                ),
                20.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Invoice Number",
                          style: AppStyles.activeTabStyleTitle,
                        ),
                        2.h.verticalSpace,
                        SizedBox(
                          width: 0.40.sw,
                          child: NormalTextField(
                            isFilled: true,
                            label: "Invoice NUmber",
                            hintText: "0000000",
                            inputType: TextInputType.number,
                            controller: _invoiceController,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date",
                          style: AppStyles.activeTabStyleTitle,
                        ),
                        2.h.verticalSpace,
                        SizedBox(
                          width: 0.40.sw,
                          child: NormalTextField(
                            enabled: true,
                            isFilled: true,
                            // label: "date",
                            hintText: "DD/MM/YYYY",
                            controller: _dateController,
                            suffix:
                                //
                                const Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                8.h.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add Items",
                        style: AppStyles.activeTabStyleTitle,
                      ),
                      Image.asset(
                        AppAssets.imageBarCodeImage,
                        height: 24,
                        width: 24,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
                4.h.verticalSpace,
                NormalDropDown(
                  fillcolor: AppColors.itemtextfieldColor,
                  height: 60,
                  width: 0.85.sw,
                  hintText: "Select Items",
                  entries: [],
                ),
                20.h.verticalSpace,
                InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    ///--------testing or for making flow
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ScreenOnBoardingScreenSale(),
                        ));
                  },
                  child: Material(
                    elevation: 10,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            AppAssets.imageinvoiceAmount,
                            height: 28,
                            width: 33,
                            fit: BoxFit.fill,
                          ),
                          15.h.horizontalSpace,
                          Text(
                            "Total Amounts",
                            style: AppStyles.activeTabStyleSaleText,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                20.h.verticalSpace,
                Material(
                  elevation: 2,
                  shadowColor: Colors.grey,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Bill to",
                              style: AppStyles.activeTabStyleTitleText,
                            ),
                            Image.asset(
                              AppAssets.imagecameraSale,
                              height: 20,
                              width: 24,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                        10.h.verticalSpace,
                        NormalTextField(
                          isFilled: true,
                          prefix: const Icon(Icons.search_rounded),
                          label: "Search from your Customer",
                          hintText: "Search from your Customer",
                          inputType: TextInputType.number,
                          controller: _billCutsomerController,
                        ),
                        5.h.verticalSpace,
                        Text(
                          "+ Add new Customer",
                          style: AppStyles.addSaleTextCustomer,
                        ),
                        5.h.verticalSpace,
                      ],
                    ),
                  ),
                ),
                20.h.verticalSpace,
                Text(
                  "Mode of Payment",
                  style: AppStyles.modeOfPayment,
                ),
                10.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customContainerCheckBox(onTap: () {}),
                    Text(
                      "Cash",
                      style: AppStyles.invoiceTextCheck,
                    ),
                    customContainerCheckBox(onTap: () {}),
                    Text(
                      "Online",
                      style: AppStyles.invoiceTextCheck,
                    ),
                    customContainerCheckBox(onTap: () {}),
                    Text(
                      "Multimode",
                      style: AppStyles.invoiceTextCheck,
                    ),
                    customContainerCheckBox(onTap: () {}),
                    Text(
                      "Unpaid",
                      style: AppStyles.invoiceTextCheck,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  ///-------custom container
  customContainerCheckBox({required VoidCallback onTap}) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Container(
        height: 15.h,
        width: 15.h,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2)),
      ),
    );
  }
}




///--------onboarding Screen
class ScreenOnBoardingScreenSale extends StatefulWidget {
  const ScreenOnBoardingScreenSale({super.key});

  @override
  State<ScreenOnBoardingScreenSale> createState() =>
      _ScreenOnBoardingScreenSaleState();
}

class _ScreenOnBoardingScreenSaleState
    extends State<ScreenOnBoardingScreenSale> {
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _mrpController = TextEditingController();
  final TextEditingController _purchasePriceController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imagesaleScreenWhite,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 20.sp)
                  .copyWith(top: 40.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customAppBarSale(context: context),
                  40.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          //context.router.back();
                        },
                        child: Image.asset(
                          AppAssets.imageArrowLeft,
                          height: 30,
                          width: 36,
                          fit: BoxFit.fill,
                        ),
                      ),
                      2.w.horizontalSpace,
                      Text(
                        "Scan Barcode",
                        style: AppStyles.purchaseTask,
                      )
                    ],
                  ),
                  5.h.verticalSpace,
                  SvgPicture.asset(
                    AppAssets.imageBarCodeScan,
                    height: 300.sp,
                    width: 380.sp,
                    fit: BoxFit.fill,
                  ),
                  5.h.verticalSpace,
                  customRowWidget(title: 'Item Name', subTitle: 'Pepsi'),
                  customRowWidget(title: 'Category', subTitle: 'Colddrink'),
                  customRowWidget(title: 'HSN code', subTitle: '122344'),
                  customRowWidget(title: 'Tax', subTitle: '12%'),
                  10.h.verticalSpace,
                  NormalTextField(
                    isFilled: true,
                    borderColor: Colors.white,
                    inputType: TextInputType.number,
                    label: "Quantity",
                    hintText: "50",
                    controller: _quantityController,
                  ),
                  10.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.sp),
                        child: NormalDropDown(
                          fillcolor: AppColors.textFieldFilledColor,
                          // height: 55,
                          width: 0.26.sw,
                          hintText: "CAR",
                          entries: [],
                        ),
                      ),
                      SizedBox(
                        width: 0.26.sw,
                        child: NormalTextField(
                          isFilled: true,
                          borderColor: Colors.white,
                          inputType: TextInputType.number,
                          label: "MRP",
                          hintText: "1000",
                          controller: _mrpController,
                        ),
                      ),
                      SizedBox(
                        width: 0.26.sw,
                        child: NormalTextField(
                          isFilled: true,
                          borderColor: Colors.white,
                          inputType: TextInputType.number,
                          label: "Purchase price",
                          hintText: "450",
                          controller: _purchasePriceController,
                        ),
                      ),
                    ],
                  ),
                  10.h.verticalSpace,
                  InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      _modalBottomSheetMenu();
                    },
                    child: Material(
                      elevation: 10,
                      shadowColor: Colors.grey,
                      borderRadius: BorderRadius.circular(8.r),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 15.sp),
                        decoration: BoxDecoration(
                            color: const Color(0xff1DB4C9),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Text(
                          "Add Item",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _modalBottomSheetMenu(){
    showModalBottomSheet(
        context: context,
        builder: (builder){
          return Container(
            height: 350.0,
            color: Colors.red,
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                child: const Center(
                  child: Text("This is a modal"),
                )),
          );
        }
    );
  }


  ///----custom row widget
  customRowWidget({required String title, required String subTitle}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 3.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyles.tileStyleTitleDashTextTitle,
          ),
          Text(
            subTitle,
            style: AppStyles.tileStyleTitleDashTextTitle
                .copyWith(fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}


///-------appbar for this screen.
customAppBarSale({required BuildContext context}) {
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
