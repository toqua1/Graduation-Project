import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static String primaryFont = GoogleFonts.poppins().fontFamily ?? 'Poppins';
  static String primaryBoldFont = 'Poppins';

  static TextStyle headline1 = TextStyle(
    fontFamily: primaryBoldFont,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static TextStyle headline2 = TextStyle(
    fontFamily: primaryBoldFont,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );

  static TextStyle primaryTextThin = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w200,
    color: AppColors.primaryColor,
  );

  static TextStyle primaryBodyText = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );

  static TextStyle primarySemibold = TextStyle(
    fontFamily: primaryBoldFont,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );

  static TextStyle bodyTextBlackThin = TextStyle(
    fontFamily: primaryFont,
    fontSize: 10,
    fontWeight: FontWeight.w200,
    color: AppColors.subtitleColor,
  );

  static TextStyle bodyTextBold = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor2,
  );
//login screen
  static TextStyle textFieldTitle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    /*semiBold */
    color: AppColors.textColor,
  );
//login
  static TextStyle loginOrText = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textColor,
  );

  static TextStyle bodyTextMediumBlack = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );
//login
  static TextStyle bodyTextRegularBlack = TextStyle(
    fontFamily: primaryFont,
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: AppColors.textColor,
  );

  static TextStyle bodyTextExtraThinBlack = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w200,
    color: AppColors.textColor,
  );

  static TextStyle headlineTextBlack = TextStyle(
    fontFamily: primaryBoldFont,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    /*semi bold */
    color: AppColors.textColor,
  );

  static TextStyle bodyTextBlack = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static TextStyle navText = TextStyle(
    fontFamily: primaryFont,
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: AppColors.textColor,
  );
//login screen
  static TextStyle boldTextColor = TextStyle(
    fontFamily: primaryBoldFont,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static TextStyle bodyTextBoldWhite = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle bodyTextWhite = TextStyle(
    fontFamily: primaryFont,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle bodyTextWhite2 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static TextStyle bodyTextWhiteLight = TextStyle(
    fontFamily: primaryFont,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: Colors.white.withOpacity(0.5),
  );

  static TextStyle bodyTextWhiteLight2 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.white.withOpacity(0.5),
  );

  static TextStyle bodyTextWhiteLight3 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.subtitleColor.withOpacity(0.56),
  );

  static TextStyle bodyTextWhite3 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle bodyTextWhite4 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  //login
  static TextStyle loginTextButton = TextStyle(
    fontFamily: primaryBoldFont,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle bodyTextLight1 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textLightColor,
  );

  static TextStyle navTextInactive = TextStyle(
    fontFamily: primaryFont,
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: AppColors.subtitleColor,
  );

  static TextStyle tabTextInactive = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    /*medium*/
    color: AppColors.subtitleColor,
  );

  static TextStyle subtitle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: AppColors.subtitleColor,
  );
  //login screen
  static TextStyle textFieldHint = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.loginGreyColor,
  );
  static TextStyle textFieldForgetPass = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    /*Medium */
    color: AppColors.loginGreyColor,
  );
}

class AppColors {
  static const Color primaryColor = Color(0xff14919B);
  static const Color secondaryColor = Color(0xffE2F163);
  static const Color textLightColor = Color(0xffB1B0B2);
  static const Color backgroundColor = Color(0xffF7F6FA);
  static const Color textColor = Color(0xff1D1617);
  static const Color subtitleColor = Color(0xff6D6C6E);
  static const Color blackColor = Color(0xff212020);
  static const Color blackColor2 = Color(0xff2A282F);
  static const Color bottomSheetColor = Color(0xffF5F5FA);
  static const Color bottomSheetItemColor = Color(0xffEBECF0);
  static const Color loginGreyColor = Color(0xffADA4A5);
  static Color textFieldFillColor = Colors.grey.shade200;
}
