import 'package:flutter/material.dart';

import 'constants.dart';

class WidgetTheme {
  static const normalTextStyle = TextStyle(
    color: AppColors.textColor,
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );

  static const deselectedTextStyle = TextStyle(
    color: AppColors.defaultColor,
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );

  static const normalGreyTextStyle = TextStyle(
    color: AppColors.textGreyColor,
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );

  static const titleTextStyle = TextStyle(
    color: AppColors.textColor,
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );

  static const loginTitleTextStyle = TextStyle(
    color: AppColors.textColor,
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );

  static const cardTextStyle = TextStyle(
    color: AppColors.defaultColor,
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );

  static const buttonTextStyle = TextStyle(
    color: AppColors.defaultColor,
    fontSize: 17.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );

  static const selectedButtonTextStyle = TextStyle(
    color: AppColors.textColor,
    fontSize: 17.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );

  static const categoryTextStyle = TextStyle(
    color: AppColors.textColor,
    fontSize: 13.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );

  static const queryTextStyle = TextStyle(
    color: AppColors.textColor,
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );

  static const enquiryTextStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 13.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
    decoration: TextDecoration.underline,
  );

  static const bottomSheetTitleTextStyle = TextStyle(
    color: AppColors.defaultColor,
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );

  static const bottomSheetDetailTextStyle = TextStyle(
    color: AppColors.defaultColor,
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );

  static const cartCountTextStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );

  static const profileTitleTextStyle = TextStyle(
    fontSize: 16.0,
    color: AppColors.textColor,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );

  static const profileTextStyle = TextStyle(
    fontSize: 16.0,
    color: AppColors.textGreyColor,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );

  static const contactTitleTextStyle = TextStyle(
    fontSize: 18.0,
    color: AppColors.textColor,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    overflow: TextOverflow.ellipsis,
  );

  static const contactDetailTextStyle = TextStyle(
    fontSize: 16.0,
    color: AppColors.textGreyColor,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
    overflow: TextOverflow.clip,
  );

  static const orderTitleTextStyle = TextStyle(
    fontSize: 18.0,
    color: AppColors.textColor,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    overflow: TextOverflow.clip,
  );

  static const orderDetailTextStyle = TextStyle(
    fontSize: 12.0,
    color: AppColors.textGreyColor,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
    overflow: TextOverflow.clip,
  );

  static const orderDetailsTitleTextStyle = TextStyle(
    fontSize: 14.0,
    color: AppColors.textColor,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    overflow: TextOverflow.clip,
  );

  static const orderDetailsDetailTextStyle = TextStyle(
    fontSize: 14.0,
    color: AppColors.textGreyColor,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
    overflow: TextOverflow.clip,
  );
}
