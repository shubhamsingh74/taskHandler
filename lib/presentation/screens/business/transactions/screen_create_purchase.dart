import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/presentation/screens/business/create_item/screen_create_item_new.dart';
import 'package:quickprism/presentation/widgets/color_tab_bar/color_tab_bar.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';
import 'package:quickprism/presentation/widgets/normal_dropdown/normal_dropdown.dart';
import 'package:quickprism/presentation/widgets/svg_icon_widget/svg_icon_widget.dart';

///--------ScreenQuotationPurchase
class ScreenQuotationPurchase extends StatefulWidget {
  const ScreenQuotationPurchase({super.key});

  @override
  State<ScreenQuotationPurchase> createState() =>
      _ScreenQuotationPurchaseState();
}

class _ScreenQuotationPurchaseState extends State<ScreenQuotationPurchase> {
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
              34.h.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: customAppBarPurchase(context: context),
              ),
              20.h.verticalSpace,
              Container(
                height: 0.87.sh,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25)
                        .copyWith(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppAssets.imageArrowLeft,
                          height: 34,
                          width: 38,
                          fit: BoxFit.fill,
                        ),
                        10.h.verticalSpace,
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(5.r),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(
                                  color: const Color(0xff63C8F4), width: 3),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Quotation no. 010101",
                                  style: AppStyles.tabTitleText,
                                ),
                                Text(
                                  "Update on Requisition 010101",
                                  style: AppStyles.tabsubTitle,
                                ),
                                Text(
                                  "Sent By : Vendor Name",
                                  style: AppStyles.tabsubTitle,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Date : DD/MM/YYYY",
                                      style: AppStyles.tabsubTitle,
                                    ),
                                    Text(
                                      "Date : DD/MM/YYYY    ",
                                      style: AppStyles.tabsubTitle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        20.h.verticalSpace,
                        Text(
                          "Product Details",
                          style: AppStyles.tabTitleText.copyWith(fontSize: 19),
                        ),
                        5.h.verticalSpace,
                        Text(
                          "Product Name",
                          style: AppStyles.tabTitleText.copyWith(fontSize: 16),
                        ),
                        5.h.verticalSpace,
                        Text(
                          "Item Category, Qty. , Unit",
                          style: AppStyles.tabTitleText.copyWith(fontSize: 14),
                        ),
                        20.h.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Material(
                            elevation: 10,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  5.h.verticalSpace,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 35),
                                    child: Text(
                                      "Product Details",
                                      style: AppStyles.tabTitleText
                                          .copyWith(fontSize: 19),
                                    ),
                                  ),
                                  10.h.verticalSpace,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 35),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Unit Price",
                                          style: AppStyles.invoiceText,
                                        ),
                                        Text(
                                          "0000 Rs",
                                          style: AppStyles.invoiceText,
                                        ),
                                      ],
                                    ),
                                  ),
                                  5.h.verticalSpace,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 35),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total Price",
                                          style: AppStyles.invoiceText,
                                        ),
                                        Text(
                                          "0000 Rs",
                                          style: AppStyles.invoiceText,
                                        ),
                                      ],
                                    ),
                                  ),
                                  5.h.verticalSpace,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 35),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Additional Tax",
                                          style: AppStyles.invoiceText,
                                        ),
                                        Text("+0000 Rs",
                                            style: AppStyles.invoiceText),
                                      ],
                                    ),
                                  ),
                                  5.h.verticalSpace,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 35),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Shipping Charges",
                                          style: AppStyles.invoiceText,
                                        ),
                                        Text("+0000 Rs",
                                            style: AppStyles.invoiceText),
                                      ],
                                    ),
                                  ),
                                  5.h.verticalSpace,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 35),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Discount",
                                          style: AppStyles.invoiceText,
                                        ),
                                        Text("-0% : -0Rs",
                                            style: AppStyles.invoiceText),
                                      ],
                                    ),
                                  ),
                                  5.h.verticalSpace,
                                  SizedBox(
                                    width: 0.85.sw,
                                    child: const Divider(
                                      color: Color(0xff1DB4C9),
                                      thickness: 2,
                                    ),
                                  ),
                                  5.h.verticalSpace,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 35),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total Amount ",
                                          style: AppStyles.invoiceText,
                                        ),
                                        Text(
                                          "0000 Rs",
                                          style: AppStyles.invoiceText.copyWith(
                                              color: const Color(0xff0CAE4D)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  15.h.verticalSpace,
                                ],
                              ),
                            ),
                          ),
                        ),
                        15.h.verticalSpace,
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(10.r),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Accepted Mode of Payment",
                                  style: AppStyles.purchaseTextMode,
                                ),
                                Text(
                                  "Multimode",
                                  style: AppStyles.purchaseTextMode
                                      .copyWith(color: const Color(0xff7E8182)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        20.h.verticalSpace,
                        Text(
                          "Delivery Terms",
                          style: AppStyles.purchaseTextMode
                              .copyWith(color: const Color(0xff0F98AB)),
                        ),
                        5.h.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Validity Period",
                              style: AppStyles.purchaseTextMode,
                            ),
                            Text(
                              "30 Days",
                              style: AppStyles.purchaseTextMode,
                            ),
                          ],
                        ),
                        5.h.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Seller’s Signatory",
                              style: AppStyles.purchaseTextMode,
                            ),
                            Text(
                              "ABC Name",
                              style: AppStyles.purchaseTextMode,
                            ),
                          ],
                        ),
                        20.h.verticalSpace,
                        InkWell(
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            ///---------testing purpose----------//
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ScreenCreatePurchase(),
                                ));
                          },
                          child: Material(
                            elevation: 10,
                            borderRadius: BorderRadius.circular(10.r),
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                  color: const Color(0xff1DB4C9),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: const Text(
                                "Send Purchase Order",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        15.h.verticalSpace,
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

///-------------Create Purchase Screen
class ScreenCreatePurchase extends StatefulWidget {
  const ScreenCreatePurchase({super.key});

  @override
  State<ScreenCreatePurchase> createState() => _ScreenCreatePurchaseState();
}

class _ScreenCreatePurchaseState extends State<ScreenCreatePurchase>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

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
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 40),
            child: Column(
              children: [
                customAppBarPurchase(context: context),
                25.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppAssets.imageArrowLeft,
                      height: 34,
                      width: 38,
                      fit: BoxFit.fill,
                    ),
                    10.w.horizontalSpace,
                    Text(
                      "Create Purchase Order",
                      style: AppStyles.purchaseTask,
                    )
                  ],
                ),
                10.h.verticalSpace,
                ColoredTabBar(
                  color: Colors.transparent,
                  tabBar: TabBar(
                    padding: EdgeInsets.zero,
                    splashFactory: NoSplash.splashFactory,
                    controller: tabController,
                    tabAlignment: TabAlignment.start,
                    physics: const BouncingScrollPhysics(),
                    isScrollable: true,
                    dividerHeight: 0,
                    indicatorColor: Colors.transparent,
                    onTap: (value) {
                      // TabBarTheme;
                    },
                    tabs: [
                      _tabBarItemContainer(
                          title: "Order Details",
                          isCurrent: tabController.index == 0),
                      _tabBarItemContainer(
                          title: "Item Details",
                          isCurrent: tabController.index == 1),
                      _tabBarItemContainer(
                          title: "   T&C   ",
                          isCurrent: tabController.index == 2),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(controller: tabController, children: const [
                    WidgetOrderDetails(),
                    WidgetItemDetails(),
                    WidgetTAndC()
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // tabbar container item view

  Widget _tabBarItemContainer(
      {required bool isCurrent, required String title}) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.w),
      decoration: BoxDecoration(
        color: isCurrent ? AppColors.primaryP1Teal : null,
        borderRadius: BorderRadius.circular(15.r),
        border: const Border(
          top: BorderSide(color: Color(0xff228EF2), width: 1),
          left: BorderSide(color: Color(0xff228EF2), width: 1),
          right: BorderSide(color: Color(0xff228EF2), width: 1),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isCurrent ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

///-------appbar for this screen.
Widget customAppBarPurchase({required BuildContext context}) {
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
            color: Color(0xff2E4251)),
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

///--------order details tab
class WidgetOrderDetails extends StatefulWidget {
  const WidgetOrderDetails({super.key});

  @override
  State<WidgetOrderDetails> createState() => _WidgetOrderDetailsState();
}

class _WidgetOrderDetailsState extends State<WidgetOrderDetails> {
  final TextEditingController _orderNumberController = TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _addressLine3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientProgressBar(
                  backgroundColor: Colors.grey,
                  percent: 38,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF0D94A7),
                      Color(0xFF117ADB),
                      Color(0xff75c68fe),
                    ],
                    stops: [
                      0.2,
                      0.8,
                      0.2,
                    ],
                  )),
              15.verticalSpace,
              Text(
                "Purchase Order Number",
                style: AppStyles.purchaseText,
              ),
              NormalTextFieldPurchase(
                isFilled: true,
                inputType: TextInputType.number,
                borderColor: Colors.white,
                label: "Autogenerated number",
                hintText: "Autogenerated number",
                controller: _orderNumberController,
              ),
              5.h.verticalSpace,
              Text(
                "Date",
                style: AppStyles.purchaseText,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date of order",
                      style: AppStyles.appBar.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff585555)),
                    ),
                    const Icon(
                      Icons.calendar_today,
                      color: Color(0xff1DB4C9),
                      size: 20,
                    )
                  ],
                ),
              ),
              10.h.verticalSpace,
              Text(
                "Add Vendor",
                style: AppStyles.purchaseText,
              ),
              const NormalDropDown(
                fillcolor: Colors.white,
                height: 55,
                hintText: "Select Vendor ",
                entries: [],
              ),
              10.h.verticalSpace,
              Text(
                "Shipping Information",
                style: AppStyles.purchaseText,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.h.verticalSpace,
                    Text(
                      "Shipping Address",
                      style: AppStyles.userNameTextTitle,
                    ),
                    10.h.verticalSpace,
                    NormalTextFieldPurchase(
                      borderColor: Colors.white,
                      inputType: TextInputType.streetAddress,
                      isFilled: true,
                      label: "Address Line 1",
                      hintText: "Address Line 1",
                      controller: _addressLine1Controller,
                    ),
                    5.h.verticalSpace,
                    NormalTextFieldPurchase(
                      borderColor: Colors.white,
                      inputType: TextInputType.streetAddress,
                      isFilled: true,
                      label: "Address Line 2",
                      hintText: "Address Line 2",
                      controller: _addressLine2Controller,
                    ),
                    5.h.verticalSpace,
                    NormalTextFieldPurchase(
                      isFilled: true,
                      borderColor: Colors.white,
                      inputType: TextInputType.streetAddress,
                      label: "Address Line 3",
                      hintText: "Address Line 3",
                      controller: _addressLine3Controller,
                    ),
                    10.h.verticalSpace,
                    Text(
                      "+ Add Specific Shipping Instructions",
                      style: AppStyles.purchaseScreenText,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              25.h.verticalSpace,
              InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () {},
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10.r),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                        color: const Color(0xff1DB4C9),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: const Text(
                      "Add Item Details Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
              25.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

///-------Item Details Tab
class WidgetItemDetails extends StatefulWidget {
  const WidgetItemDetails({super.key});

  @override
  State<WidgetItemDetails> createState() => _WidgetItemDetailsState();
}

class _WidgetItemDetailsState extends State<WidgetItemDetails> {
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemCategoryController = TextEditingController();
  final TextEditingController _itemDescriptionController =
      TextEditingController();
  final TextEditingController _itemQualityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientProgressBar(
                  backgroundColor: Colors.grey,
                  percent: 70,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF0D94A7),
                      Color(0xFF117ADB),
                      Color(0xff75c68fe),
                    ],
                    stops: [
                      0.2,
                      0.8,
                      0.2,
                    ],
                  )),
              15.verticalSpace,
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 25),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(
                            color: const Color(0xff1DB2D2), width: 2.5),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                              spreadRadius: 2),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PO No. 010101",
                          style: AppStyles.titlePurchase,
                        ),
                        5.h.verticalSpace,
                        Text(
                          "DD/MM/YYYY",
                          style: AppStyles.titlePurchase.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        5.h.verticalSpace,
                        Text(
                          "To Vendor 1",
                          style: AppStyles.titlePurchase.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 20,
                      child: Image.asset(
                        AppAssets.imagePurchaseTop,
                        height: 100,
                        width: 191,
                        fit: BoxFit.fill,
                      ))
                ],
              ),
              15.h.verticalSpace,
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10.r),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mode of Payment",
                        style: AppStyles.purchaseText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (bool) {},
                            shape: const CircleBorder(),
                          ),
                          Text(
                            "Cash",
                            style: AppStyles.invoiceTextCheck,
                          ),
                          Checkbox(
                            value: false,
                            onChanged: (bool) {},
                            shape: const CircleBorder(),
                          ),
                          Text(
                            "Online",
                            style: AppStyles.invoiceTextCheck,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
              20.h.verticalSpace,
              Material(
                elevation: 10,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.imageInvoiceBox,
                        height: 28,
                        width: 33,
                        fit: BoxFit.fill,
                      ),
                      10.h.horizontalSpace,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Unit Price",
                                style: AppStyles.invoiceText,
                              ),
                              Text(
                                "                                0000 Rs",
                                style: AppStyles.invoiceText,
                              ),
                            ],
                          ),
                          5.h.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Amount ",
                                style: AppStyles.invoiceText,
                              ),
                              Text(
                                "                        0000 Rs",
                                style: AppStyles.invoiceText
                                    .copyWith(color: const Color(0xff0CAE4D)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              15.h.verticalSpace,
              InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () {},
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10.r),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: const Color(0xff1DB4C9),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: const Text(
                      "Add T & C Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
              25.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

///----------T&C tab
class WidgetTAndC extends StatefulWidget {
  const WidgetTAndC({super.key});

  @override
  State<WidgetTAndC> createState() => _WidgetTAndCState();
}

class _WidgetTAndCState extends State<WidgetTAndC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientProgressBar(
                    backgroundColor: Colors.grey,
                    percent: 100,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF0D94A7),
                        Color(0xFF117ADB),
                        Color(0xFF75C68FE),
                      ],
                      stops: [
                        0.2,
                        0.8,
                        0.2,
                      ],
                    )),
                15.h.verticalSpace,
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 25),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(
                              color: const Color(0xff1DB2D2), width: 2.5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 2),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "PO No. 010101",
                            style: AppStyles.titlePurchase,
                          ),
                          5.h.verticalSpace,
                          Text(
                            "DD/MM/YYYY",
                            style: AppStyles.titlePurchase.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          5.h.verticalSpace,
                          Text(
                            "To Vendor 1",
                            style: AppStyles.titlePurchase.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          5.h.verticalSpace,
                          Text(
                            "Payment Mode",
                            style: AppStyles.titlePurchase.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          5.h.verticalSpace,
                          Text(
                            "Item Details",
                            style: AppStyles.titlePurchase.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 20,
                        child: Image.asset(
                          AppAssets.imagePurchaseTop,
                          height: 145,
                          width: 191,
                          fit: BoxFit.fill,
                        ))
                  ],
                ),
                20.h.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Material(
                    elevation: 10,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.h.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  AppAssets.imageInvoiceBox,
                                  height: 28,
                                  width: 33,
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  "Unit Price",
                                  style: AppStyles.invoiceText,
                                ),
                                Text(
                                  "                                 0000 Rs",
                                  style: AppStyles.invoiceText,
                                ),
                              ],
                            ),
                          ),
                          5.h.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Price",
                                  style: AppStyles.invoiceText,
                                ),
                                Text(
                                  "0000 Rs",
                                  style: AppStyles.invoiceText,
                                ),
                              ],
                            ),
                          ),
                          5.h.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Additional Tax",
                                  style: AppStyles.invoiceText,
                                ),
                                Text("+0000 Rs", style: AppStyles.invoiceText),
                              ],
                            ),
                          ),
                          5.h.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Shipping Charges",
                                  style: AppStyles.invoiceText,
                                ),
                                Text("+0000 Rs", style: AppStyles.invoiceText),
                              ],
                            ),
                          ),
                          5.h.verticalSpace,
                          SizedBox(
                            width: 0.83.sw,
                            child: const Divider(
                              color: Color(0xff1DB4C9),
                              thickness: 2,
                            ),
                          ),
                          5.h.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Amount ",
                                  style: AppStyles.invoiceText,
                                ),
                                Text(
                                  "0000 Rs",
                                  style: AppStyles.invoiceText
                                      .copyWith(color: const Color(0xff0CAE4D)),
                                ),
                              ],
                            ),
                          ),
                          15.h.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                ),
                15.h.verticalSpace,
                Text(
                  "Expecting Delivery by",
                  style: AppStyles.purchaseText,
                ),
                2.h.verticalSpace,
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "DD/MM/YY",
                        style: AppStyles.appBar.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff585555)),
                      ),
                      const Icon(
                        Icons.calendar_today,
                        color: Colors.blue,
                        size: 20,
                      )
                    ],
                  ),
                ),
                15.h.verticalSpace,
                Text(
                  "+ Terms and Conditions",
                  style: AppStyles.purchaseScreenText,
                  textAlign: TextAlign.center,
                ),
                15.h.verticalSpace,
                Text(
                  "Buyer’s Signatory",
                  style: AppStyles.purchaseText,
                ),
                2.h.verticalSpace,
                const NormalDropDown(
                  fillcolor: Colors.white,
                  height: 55,
                  hintText: "Select Buyer’s Signatory",
                  entries: [],
                ),
                15.h.verticalSpace,
                InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {
                    ///----------just for checking purpose
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScreenReviewPurchase(),
                        ));
                  },
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(10.r),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          color: const Color(0xff1DB4C9),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: const Text(
                        " View Purchase Order",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
                25.h.verticalSpace,
              ],
            ),
          ),
        ));
  }
}





///---------screen review purchase--------------///
class ScreenReviewPurchase extends StatefulWidget {
  const ScreenReviewPurchase({super.key});

  @override
  State<ScreenReviewPurchase> createState() => _ScreenReviewPurchaseState();
}

class _ScreenReviewPurchaseState extends State<ScreenReviewPurchase> {
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
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customAppBarPurchase(context: context),
                  40.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppAssets.imageArrowLeft,
                        height: 34,
                        width: 38,
                        fit: BoxFit.fill,
                      ),
                      10.w.horizontalSpace,
                      Text(
                        "Review Purchase Order ",
                        style: AppStyles.purchaseTask,
                      )
                    ],
                  ),
                  20.h.verticalSpace,
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 25),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(
                                color: const Color(0xff1DB2D2), width: 2.5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                  spreadRadius: 2),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "PO No. 010101",
                              style: AppStyles.titlePurchase,
                            ),
                            5.h.verticalSpace,
                            Text(
                              "DD/MM/YYYY",
                              style: AppStyles.titlePurchase.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            5.h.verticalSpace,
                            Text(
                              "To Vendor 1",
                              style: AppStyles.titlePurchase.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            5.h.verticalSpace,
                            Text(
                              "Payment Mode",
                              style: AppStyles.titlePurchase.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            5.h.verticalSpace,
                            Text(
                              "Item Details",
                              style: AppStyles.titlePurchase.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          top: 20,
                          child: Image.asset(
                            AppAssets.imagePurchaseTop,
                            height: 145,
                            width: 191,
                            fit: BoxFit.fill,
                          ))
                    ],
                  ),
                  20.h.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Material(
                      elevation: 10,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.h.verticalSpace,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    AppAssets.imageInvoiceBox,
                                    height: 28,
                                    width: 33,
                                    fit: BoxFit.fill,
                                  ),
                                  Text(
                                    "Unit Price",
                                    style: AppStyles.invoiceText,
                                  ),
                                  Text(
                                    "                                 0000 Rs",
                                    style: AppStyles.invoiceText,
                                  ),
                                ],
                              ),
                            ),
                            5.h.verticalSpace,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Price",
                                    style: AppStyles.invoiceText,
                                  ),
                                  Text(
                                    "0000 Rs",
                                    style: AppStyles.invoiceText,
                                  ),
                                ],
                              ),
                            ),
                            5.h.verticalSpace,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Additional Tax",
                                    style: AppStyles.invoiceText,
                                  ),
                                  Text("+0000 Rs",
                                      style: AppStyles.invoiceText),
                                ],
                              ),
                            ),
                            5.h.verticalSpace,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Shipping Charges",
                                    style: AppStyles.invoiceText,
                                  ),
                                  Text("+0000 Rs",
                                      style: AppStyles.invoiceText),
                                ],
                              ),
                            ),
                            5.h.verticalSpace,
                            SizedBox(
                              width: 0.83.sw,
                              child: const Divider(
                                color: Color(0xff1DB4C9),
                                thickness: 2,
                              ),
                            ),
                            5.h.verticalSpace,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Amount ",
                                    style: AppStyles.invoiceText,
                                  ),
                                  Text(
                                    "0000 Rs",
                                    style: AppStyles.invoiceText.copyWith(
                                        color: const Color(0xff0CAE4D)),
                                  ),
                                ],
                              ),
                            ),
                            15.h.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  ),
                  20.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Expecting Delivery by",
                        style: AppStyles.purchaseText,
                      ),
                      Text(
                        "29/01/2024",
                        style: AppStyles.purchaseText,
                      ),
                    ],
                  ),
                  15.h.verticalSpace,
                  Text(
                    "Terms and Conditions",
                    style: AppStyles.purchaseScreenText,
                    textAlign: TextAlign.center,
                  ),
                  15.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Buyer’s Signatory",
                        style: AppStyles.purchaseText,
                      ),
                      Text(
                        "Shubham Singh",
                        style: AppStyles.purchaseText,
                      ),
                    ],
                  ),
                  15.h.verticalSpace,
                  InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      ///---------for the testing purpose
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenSuccessPurchaseOrder(),));
                    },
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            color: const Color(0xff1DB4C9),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: const Text(
                          "Send Quick  Purchase Order",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  15.h.verticalSpace,
                  InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {},
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: const Color(0xff1DB4C9), width: 2)),
                        child: const Text(
                          "Back to Form",
                          style: TextStyle(
                              color: Color(0xff1DB4C9),
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  20.h.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



///--------screen success purchase order
class ScreenSuccessPurchaseOrder extends StatefulWidget {
  const ScreenSuccessPurchaseOrder({super.key});

  @override
  State<ScreenSuccessPurchaseOrder> createState() => _ScreenSuccessPurchaseOrderState();
}

class _ScreenSuccessPurchaseOrderState extends State<ScreenSuccessPurchaseOrder> {
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
                  child: customAppBarPurchase(context: context),
                ),
                20.h.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20).copyWith(top: 40),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Material(
                        elevation: 5,
                        shadowColor: Colors.grey.shade200.withOpacity(0.5),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.r),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 30),
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15).copyWith(bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Quick Purchase Order',style: AppStyles.purchaseTextModeSuccess),
                              5.h.verticalSpace,
                              Text('PO Sent \nSuccessfully!',style: AppStyles.purchaseTextModeSuccessTitle,textAlign: TextAlign.center,),
                              5.h.verticalSpace,
                              Image.asset(AppAssets.imagePurchasePaperPlane,height: 232,width: 202,fit: BoxFit.fill,),
                              5.h.verticalSpace,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Pepsi",style: AppStyles.purchaseSuccesItemName,),
                                  5.h.verticalSpace,
                                  customRowNameWidgets(title: 'Category', subTitle: 'Cold Drinks'),
                                  customRowNameWidgets(title: 'Qty.', subTitle: '50 Cartons'),
                                  customRowNameWidgets(title: 'Sent to', subTitle: 'Vendor 1'),
                                  customRowNameWidgets(title: 'Buyer’s Signatory', subTitle: 'Name'),
                                  10.h.verticalSpace,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Total Price',style: AppStyles.purchaseTextModeCategory.copyWith(fontSize: 15,fontWeight: FontWeight.w600),),
                                      const Spacer(),
                                      Text("00000 Rs",style: AppStyles.purchaseTextModeCategory.copyWith(fontSize: 15,fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                  5.h.verticalSpace,
                                  customRowNameWidgets(title: 'Expecting Delivery by', subTitle: 'DDMMYYYY'),
                                  25.h.verticalSpace,
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,left: 0,right: 0,
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


  customRowNameWidgets({required String title,required String subTitle}){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: AppStyles.purchaseTextModeCategory,),
        const Spacer(),
        Text(subTitle,style: AppStyles.purchaseTextModeCategory.copyWith(fontWeight: FontWeight.w400),),
      ],
    );
  }


 Widget customRowButtonWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: (){},
          child: Material(
            elevation: 10,
            shadowColor: Colors.grey,
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
              decoration: BoxDecoration(
                  color: const Color(0xff1DB4C9),
                  borderRadius: BorderRadius.circular(8.r)
              ),
              child: const Text("Send another QuickPO",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),),
            ),
          ),
        ),
          InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: (){},
            child: Material(
              elevation: 10,
              shadowColor: Colors.grey,
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: const Color(0xff1DB4C9),width: 2)
                ),
                child: const Text("Back to Home",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xff298D9A),),
              ),
            ),
          ),),
      ],
    );
  }
}

