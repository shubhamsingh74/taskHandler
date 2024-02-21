import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static const primarySwatch = Colors.deepOrange;
  //primary colors
  static const oldPrimaryP1 = Color(0xffF26343);
  static const oldPrimaryP2 = Color(0xff2196F3);
  static const primaryP1 = Color(0xff0091F7);
  static const primaryP2 = Color(0xff0689FF);
  static const primaryP3 = Color(0xff05377F);
    static const primaryP1Teal = Color(0xff0D94A7);
  static const white = Color(0xffFFFFFF);
  static const black = Colors.black;
  static const error = Color(0xffC23931);
  static const purchaseBackground = Color(0xffE8F4FF);

  static final shimmerGrey = Colors.grey.shade300;
  static const unselectedItemColor = Color(0xff6A6A6A);
  static const selectedItemColor = Color(0xff262626);

  //secondary colors
  static const secondary = Color(0xff05377F);
  //support colors
  static const supportSP1 = Color(0xffFBCFC5);
  static const supportSP2 = Color(0xffFEEFEC);
  static const supportSP3 = Color(0xffB0DDFD);
  static const supportSP4 = Color(0xffE6F4FE);
  static const supportSP5 = Color(0xff4CAF50);

  static const supportSP6 = Color(0xffC0E3C2);
  static const supportSP7 = Color(0xffFFC107);
  static const supportSP8 = Color(0xffFFE9A9);
  static const supportSP9 = Color(0xffC94C25);
  //fade colors
  // static const supportUI5 = Color(0xffE6F4FE);
  static const supportUI3 = Color(0xffFEEFEC);
  static const supportUI6 = Color(0xffF5F5F5);
  static const supportUI8 = Color(0xffFFFBEE);
  static const supportUI9 = Color(0xffEBF6EC);
  static const supportUI10 = Color(0xffFAEFEB);
  static const supportUI11 = Color(0xFFC7EFC8);
  static const supportUI12 = Color(0xFFF4F4F4);
  static const supportUI13 = Color(0xFF4FD0C8);
  static const supportUI14 = Color(0xFFFF7A00);
  // shade colors
  static const shadeColorYellow = Color(0xFFFEE9C9);
  static const shadeColorRed = Color(0xFFEABBB9);
  static const employeeAbsent = Color(0xFFFFC2BF);

  //text colors
  static const textColorT1 = Color(0xff353535);
  static const textColorT2 = Color(0xff8D8D8D);
  static const textColorT3 = Color(0xffD9D9D9);
  static const textColorT4 = Color(0xffFFFFFF);
  static const textColorT5 = Color(0xFF9E9E9E);
  static const textColorT6 = Color(0xFF3D3D3D);
  static const textColorT7 = Color(0xff0689FF);

  static const textColorGreen = Color(0xFF00B505);
  static const textColorYellow = Color(0xFFFCA015);
  static const textColorRed = Color(0xFFC13831);
  //text field

  static const borderColorTextField = Color(0xffE1E1E1);
  static const borderColorListTile = Color(0xffF5F5F5);
  static const textFieldBorder = Color(0xFFEFEFEF);

  //store colors

  static const storeColor1 = Color(0xff7E49FF);
  static const storeColor2 = Color(0xffFFD600);
  static const storeColor3 = Color(0xff50D1C9);

  // create Item color
  static const itemTitleColor1 = Color(0xff282828);
  static const itemstoreColor2 = Color(0xff837E7E);
  static const itemTabColorInActive = Color(0xff242323);
  static const textFieldFilledColor = Color(0xffDDE3E9);
  static const itemtextfieldColor = Color(0xffDDE3E9);
  static const itemtextfieldColorText = Color(0xff585555);
  static const itemtextColor = Color(0xff3D3A3A);
  static const itemtextfieldTextColor = Color(0xff585555);
  static const itemAddAnotherButton = Color(0xff0D94A7);
  static const itemAddAnotherButtonBorder = Color(0xff0689FF);

 
  static const newThemePrimaryColor = Color(0xff1DB4C9);
  static const newThemeButtonColor = Color(0xffDDEFFE);
  static const primaryBlue125D99 = Color(0xff125D99);

  static Color getColorFromString({required String hexValue}) =>
      Color(int.parse("0xff$hexValue"));

  static Color randomColorForShop(String? shopColor) {
    if (shopColor != null) {
      return getColorFromString(hexValue: shopColor);
    } else {
      return randomOpaqueColor();
    }
  }

  static Color randomOpaqueColor() {
    return Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
  }
}
