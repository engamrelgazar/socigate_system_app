library text_style;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin FontWeightMixin {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight normal = FontWeight.w400;
  static const FontWeight semiBold = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;
}

class AppTextStyle {
  static TextStyle get header => TextStyle(
        fontWeight: FontWeightMixin.bold,
        fontSize: 13.sp,
      );

  static TextStyle get subHeader => TextStyle(
        fontWeight: FontWeightMixin.semiBold,
        fontSize: 11.sp,
      );


  static TextStyle get body => TextStyle(
        fontWeight: FontWeightMixin.normal,
        fontSize: 5.sp,
      );

  static TextStyle get caption => TextStyle(
        fontWeight: FontWeightMixin.light,
        fontSize: 4.5.sp,
      );
  static TextStyle get small => TextStyle(
        fontWeight: FontWeightMixin.light,
        fontSize: 3.5.sp,
      );
}
