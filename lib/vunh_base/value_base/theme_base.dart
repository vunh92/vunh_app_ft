import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vunh_app_ft/vunh_base/value_base/colors.dart';


class ThemeBase {
  ThemeBase._();

  static Icon appBarIconPre = Icon(
    Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
    color: colorWhite,
  );

  static String fontRoboto = 'Roboto';
  static String fontRegular = 'Regular';
  static double actionBarIconSize = 30;

  static double fontSizeAppBar = 22.0;
  static double fontSize11 = 11.0;
  static double fontSize12 = 12.0;
  static double fontSize13 = 13.0;
  static double fontSize14 = 14.0;
  static double fontSize15 = 15.0;
  static double fontSize16 = 16.0;
  static double fontSize18 = 18.0;
  static double fontSize20 = 20.0;
  static double fontSize22 = 22.0;
  static double fontSize24 = 24.0;
  static double fontSize30 = 30.0;
  static double fontSize32 = 32.0;
  static double fontSize36 = 36.0;
  static double letterSpacing01 = 0.1;
  static double letterSpacing02 = 0.2;
  static double letterSpacingMinus01 = -0.1;

  //Text AppBar
  static TextStyle appBarTextStyle =
      TextStyle(color: colorWhite, fontSize: fontSize20);

  //Text Progress bar
  static TextStyle alterProgressText =
      TextStyle(color: textPrimaryLightColor, fontSize: fontSize16);

  //Text Back
  static TextStyle textBlackFontSize11 =
      TextStyle(color: textPrimaryGrey1, fontSize: fontSize11);
  static TextStyle textBlackFontSize12 =
      TextStyle(color: textPrimaryBlack, fontSize: fontSize12);
  static TextStyle textBlackFontSize13 =
      TextStyle(color: textPrimaryBlack, fontSize: fontSize13);
  static TextStyle textBlackFontSize14 =
      TextStyle(color: textPrimaryBlack, fontSize: fontSize14);
  static TextStyle textBlackFontSize16 =
      TextStyle(color: textPrimaryBlack, fontSize: fontSize16);

  //Text BlackBold
  static TextStyle textBlackBoldFontSize14 = TextStyle(
      color: textPrimaryBlack,
      fontSize: fontSize14,
      fontWeight: FontWeight.w500);
  static TextStyle textBlackBoldFontSize16 = TextStyle(
      color: textPrimaryBlack,
      fontSize: fontSize16,
      fontWeight: FontWeight.w500);
  static TextStyle textBlackBoldFontSize18 = TextStyle(
      color: textPrimaryBlack,
      fontSize: fontSize18,
      fontWeight: FontWeight.w500);

  //Text White
  static TextStyle textWhiteFontSize14 =
      TextStyle(color: colorPrimaryTextButton, fontSize: fontSize14);

  static TextStyle textWhiteFontSize30 =
  TextStyle(color: colorPrimaryTextButton, fontSize: fontSize30);

  //Text WhiteBold
  static TextStyle textWhiteBoldFontSize14 = TextStyle(
      color: colorPrimaryTextButton,
      fontSize: fontSize14,
      fontWeight: FontWeight.w500);
  static TextStyle textWhiteBoldFontSize16 = TextStyle(
      color: colorPrimaryTextButton,
      fontSize: fontSize16,
      fontWeight: FontWeight.w500);

  //Text Grey
  static TextStyle textGreyFontSize14 =
      TextStyle(color: textPrimaryGrey, fontSize: fontSize14);
  static TextStyle textGreyFontSize16 =
      TextStyle(color: textPrimaryGrey, fontSize: fontSize16);

  //Text ColorPrimary
  static TextStyle textColorPrimaryFontSize11 =
      TextStyle(color: colorPrimary, fontSize: fontSize11);
  static TextStyle textColorPrimaryFontSize12 =
      TextStyle(color: colorPrimary, fontSize: fontSize12);
  static TextStyle textColorPrimaryFontSize13 =
      TextStyle(color: colorPrimary, fontSize: fontSize13);
  static TextStyle textColorPrimaryFontSize14 =
      TextStyle(color: colorPrimary, fontSize: fontSize14);
  static TextStyle textColorPrimaryFontSize16 =
      TextStyle(color: colorPrimary, fontSize: fontSize16);
  static TextStyle textColorPrimaryDarkFontSize16 =
      TextStyle(color: colorPrimaryDark, fontSize: fontSize16);

  static TextStyle textColorPrimaryDarkFontSize14 =
      TextStyle(color: colorPrimaryDark, fontSize: fontSize14);

  static TextStyle textColorPrimaryDarkBoldFontSize14 = TextStyle(
      color: colorPrimaryDark,
      fontSize: fontSize14,
      fontWeight: FontWeight.w500);

  //Text ColorPrimary
  static TextStyle textColorPrimaryBoldFontSize12 = TextStyle(
      color: colorPrimary, fontSize: fontSize12, fontWeight: FontWeight.w500);

  static TextStyle textColorPrimaryBoldFontSize14 = TextStyle(
      color: colorPrimary, fontSize: fontSize14, fontWeight: FontWeight.w500);

  static TextStyle textColorPrimaryBoldFontSize16 = TextStyle(
      color: colorPrimary, fontSize: fontSize16, fontWeight: FontWeight.w500);

  static TextStyle textColorPrimaryBoldFontSize18 = TextStyle(
      color: colorPrimary, fontSize: fontSize18, fontWeight: FontWeight.w500);

  //Text ColorBlue
  static TextStyle textColorBlueFontSize14 =
      TextStyle(color: colorBlue, fontSize: fontSize14);

  //Text hint
  static TextStyle textHintGreyFontSize16 =
      TextStyle(color: textPrimaryGrey1, fontSize: fontSize16);
  static TextStyle textHintGreyFontSize14 =
      TextStyle(color: textPrimaryGrey1, fontSize: fontSize14);

  //Text Control Country
  static TextStyle textCounterColorPrimaryFontSize14 =
      TextStyle(color: colorPrimary, fontSize: fontSize14);

  //Text Button
  static TextStyle textButton =
      TextStyle(color: colorPrimaryTextButton, fontSize: fontSize16);

  //Text Count Down
  static TextStyle textCountDownColorPrimaryFontSize24 =
      TextStyle(color: colorPrimary, fontSize: fontSize24);
  static TextStyle textCountDownGreyFontSize24 =
      TextStyle(color: textPrimaryGrey1, fontSize: fontSize24);

  //Text Required
  static TextStyle textHaveRequired =
      TextStyle(color: Colors.red, fontSize: fontSize16);
  static TextStyle textNonRequired = TextStyle(fontSize: fontSize20);

  //Text Radio
  static TextStyle textRadio = TextStyle(fontSize: fontSize14);

  //Dialog
  static TextStyle textBlackMessDialogTitle = TextStyle(
      color: textPrimaryBlack,
      fontSize: fontSize16,
      fontWeight: FontWeight.w500);
  static TextStyle textWhiteMessDialogTitle =
      TextStyle(color: Colors.white, fontSize: fontSize16);
  static TextStyle textMessDialogContent =
      TextStyle(color: textPrimaryBlack, fontSize: fontSize14);
  static TextStyle textMessDialogButtonColorPrimary =
      TextStyle(color: colorColorPrimaryButtonMessDialog, fontSize: fontSize14);
  static TextStyle textMessDialogButtonColorHint =
      TextStyle(color: colorColorHintButtonMessDialog, fontSize: fontSize14);

  //Box File
  static TextStyle textBoxFieldBlack =
      TextStyle(color: textPrimaryBlack, fontSize: fontSize16);
  static TextStyle textBoxFieldHint =
      TextStyle(color: textPrimaryGrey1, fontSize: fontSize16);

  //Text File Customer
  static TextStyle textFieldBasic =
      TextStyle(color: colorPrimary, fontSize: fontSize15);
  static TextStyle textFieldBasicHint = TextStyle(
    color: Colors.black45,
    fontSize: fontSize16,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
  );

  //TextTheme Application
  static TextTheme textTheme = TextTheme(
    bodyText2: body2,
  );

  static TextStyle body2 = TextStyle(
    // body1 -> body2
    fontFamily: fontRoboto,
    fontSize: fontSize14,
    letterSpacing: 0.2,
    color: textPrimaryBlack,
  );

  static TextStyle textColorGreenFontSize14 = TextStyle(
      color: Colors.green[400],
      fontSize: fontSize14,
      fontWeight: FontWeight.w500);

  static TextStyle textColorRedFontSize14 = TextStyle(
      color: Colors.red[400],
      fontSize: fontSize14,
      fontWeight: FontWeight.w500);

  static TextStyle textColorPrimaryDarkBoldFontSize16 = TextStyle(
      color: colorPrimaryDarkIcon,
      fontSize: fontSize16,
      fontWeight: FontWeight.w500);

  static TextStyle textHyperLink = TextStyle(
      decoration: TextDecoration.underline,
      color: Colors.blue,
      fontSize: fontSize14,
      fontWeight: FontWeight.w500);
}
