import 'package:flashcard_widget/config/text_size.dart';
import 'package:flutter/material.dart';
abstract interface class AppTextStyle {
  static TextStyle baseTextStyle({
    required Color color,
    required String fontFamily,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return TextStyle(
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      color: color,
      fontSize: fontSize,
      overflow: TextOverflow.ellipsis,
    );
  }

  //* Headline-Bold
  static TextStyle textStyleHeadlineBold20({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w700,
      color: color,
      fontFamily: 'Raleway',
      fontSize: AppTextSize.s20,
    );
  }

  static TextStyle textStyleHeadlineBold18({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w700,
      color: color,
      fontFamily: 'Raleway',
      fontSize: AppTextSize.s18,
    ).copyWith(
      height: 12 / 9,
    );
  }

  //* Headline-Semibold
  static TextStyle textStyleHeadlineSemibold22({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: 'Raleway',
      fontSize: AppTextSize.s22,
    );
  }

  static TextStyle textStyleHeadlineSemibold20({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: 'Raleway',
      fontSize: AppTextSize.s20,
    ).copyWith(
      height: 7 / 5,
    );
  }

  static TextStyle textStyleHeadlineSemibold18({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: 'Raleway',
      fontSize: AppTextSize.s18,
    ).copyWith(height: 12 / 9);
  }

  static TextStyle textStyleHeadlineSemibold16({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: 'Raleway',
      fontSize: AppTextSize.s16,
    ).copyWith(
      height: 23 / 16,
    );
  }

  static TextStyle textStyleHeadlineSemibold15({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: 'Raleway',
      fontSize: AppTextSize.s15,
    );
  }

  //* Headline-Medium
  static TextStyle textStyleHeadlineMedium18({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s18,
    ).copyWith(
      height: 12 / 9,
    );
  }

  static TextStyle textStyleHeadlineMedium16({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s16,
    ).copyWith(
      height: 23 / 16,
    );
  }

  //*SubHeadline-Medium
  static TextStyle textStyleSubHeadlineMedium15({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s15,
    ).copyWith(
      height: 22 / 15,
    );
  }

  //* SubHeadline-Regular
  static TextStyle textStyleSubHeadlineRegular18({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s18,
    ).copyWith(
      height: 12 / 9,
    );
  }

  static TextStyle textStyleSubHeadlineRegular16({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s16,
    ).copyWith(
      height: 23 / 16,
    );
  }

  static TextStyle textStyleSubHeadlineRegular15({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s15,
    );
  }

  static TextStyle textStyleSubHeadlineSemibold15({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s15,
    ).copyWith(
      height: 22 / 15,
    );
  }

  //* Title-ExtraBold
  static TextStyle textStyleTitleExtraBold22({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w800,
      color: color,
      fontFamily: 'Raleway',
      fontSize: AppTextSize.s22,
    );
  }

  //* Title-Bold
  static TextStyle textStyleTitleBold28({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w700,
      color: color,
      fontFamily: 'Raleway',
      fontSize: AppTextSize.s28,
    );
  }

  static TextStyle textStyleTitleBold22({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w700,
      color: color,
      fontFamily: 'Raleway',
      fontSize: AppTextSize.s22,
    );
  }

  //* Title-Regular
  static TextStyle textStyleTitleRegular22({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s22,
    );
  }

  static TextStyle textStyleTitleSemiBold22({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s22,
    );
  }

  //* Body-Bold
  static TextStyle textStyleBodyBold16({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s16,
    ).copyWith(
      height: 23 / 16,
    );
  }

  static TextStyle textStyleBodyBold15({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s15,
    );
  }

  static TextStyle textStyleBodyBold14({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s14,
    );
  }

  //* Body-SemiBold

  static TextStyle textStyleBodySemiBold16({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s16,
    ).copyWith(
      height: 23 / 16,
    );
  }

  static TextStyle textStyleBodySemiBold14({required Color color}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s14,
    ).copyWith(
      height: 10 / 7,
    );
  }

  static TextStyle textStyleBodySemiBold12({required Color color}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s12,
    ).copyWith(
      height: 14 / 9,
    );
  }

  //* Body-Medium
  static TextStyle textStyleBodyMedium16({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s16,
    ).copyWith(
      height: 23 / 16,
    );
  }

  static TextStyle textStyleBodyMedium15({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s15,
    ).copyWith(
      height: 22 / 15,
    );
  }

  static TextStyle textStyleBodyMedium14({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s14,
    ).copyWith(
      height: 10 / 7,
    );
  }

  static TextStyle textStyleBodyMedium13({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s13,
    ).copyWith(
      height: 19 / 13,
    );
  }

  static TextStyle textStyleBodyMedium12({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s12,
    ).copyWith(
      height: 3 / 2,
    );
  }

  //* Body-Regular
  static TextStyle textStyleBodyRegular16({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s16,
    ).copyWith(
      height: 23 / 16,
    );
  }

  static TextStyle textStyleBodyRegular15({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s15,
    ).copyWith(
      height: 22 / 15,
    );
  }

  static TextStyle textStyleBodyRegular14({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s14,
    );
  }

  static TextStyle textStyleBodyRegular13({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s13,
    ).copyWith(
      height: 19 / 13,
    );
  }

  static TextStyle textStyleBodyRegular12({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s12,
    );
  }

  //* Body-Light
  static TextStyle textStyleBodyLight16({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w300,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s16,
    );
  }

  static TextStyle textStyleBodyLight15({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w300,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s15,
    );
  }

  //!Other
  static TextStyle textStyleBody12({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s12,
    );
  }

  static TextStyle textStyleRegular20({required Color color}) {
    return baseTextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'Raleway',
      color: color,
      fontSize: AppTextSize.s20,
    );
  }
}