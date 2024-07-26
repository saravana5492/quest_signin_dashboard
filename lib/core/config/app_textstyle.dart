import 'package:flutter/material.dart';

final class AppTextStyle {
  // Size: ExtraSmall | Weight: Regular/SemiBold/Bold | Type: Body
  static const extraSmallSemiBoldBodyStyle =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w600);

  // Size: Small | Weight: Regular/SemiBold/Bold | Type: Body
  static const smallRegularBodyStyle =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
  static const smallSemiBoldBodyStyle =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  static const smallBoldBodyStyle =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w800);

  // Size: Medium | Weight: Regular/SemiBold/Bold | Type: Body
  static const mediumRegularBodyStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  static const mediumSemiBoldBodyStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
  static const mediumBoldBodyStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w800);

  // Size: Large | Weight: Regular/SemiBold/Bold | Type: Body
  static const largeRegularBodyStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  static const largeSemiBoldBodyStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  static const largeBoldBodyStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w800);

  // Size: Small | Weight: Regular/SemiBold/Bold | Type: Title
  static const smallRegularTitleStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w400);
  static const smallSemiBoldTitleStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  static const smallBoldTitleStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w800);
}
