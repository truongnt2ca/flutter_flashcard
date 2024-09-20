import 'dart:math';

import 'package:flashcard_widget/config/constants.dart';
import 'package:flutter/material.dart';
extension ContextExtensions on BuildContext {
  double getViewPaddingTop() => View.of(this).viewPadding.top / View.of(this).devicePixelRatio;

  double getHeight() => MediaQuery.sizeOf(this).height;

  double getWidth() => MediaQuery.sizeOf(this).width;

  TextTheme getTextTheme() => Theme.of(this).textTheme;

  double getMinDimension() => min(getWidth(), getHeight());

  double dpx() => min(hspx(), vspx());
  double hspx() => getWidth() / AppConstants.DEFAULT_WIDTH_DESIGNER_MOBILE;
  double vspx() => getHeight() / AppConstants.DEFAULT_HEIGHT_DESIGNER_MOBILE;

  bool isThereCurrentDialogShowing() => ModalRoute.of(this)?.isCurrent != true;
}