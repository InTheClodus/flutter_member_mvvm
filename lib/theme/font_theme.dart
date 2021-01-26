import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontTheme {
  static const Color lightGreen = Color(0xff93BB24);
  static const Color azureBlue = Color(0xff154D7C);
  static const Color lightBlue = Color(0xff2D7FC7);
  static const Color lightGray = Color(0xffC7CAD1);
  static const Color darkGray = Color(0xff7B7B7B);

  TextStyle lightGreenText = TextStyle(
    fontFamily: "SemiBold",
    fontSize: ScreenUtil().setSp(18),
    color: lightGreen,
    fontWeight: FontWeight.w500,
  );

  TextStyle azureBlueText = TextStyle(
      fontFamily: "SemiBold",
      fontSize: ScreenUtil().setSp(18),
      fontWeight: FontWeight.w500,
      color: azureBlue);

  TextStyle lightBlueText = TextStyle(
    fontFamily: "SemiBold",
    fontSize: ScreenUtil().setSp(18),
    color: lightBlue,
    fontWeight: FontWeight.w500,
  );
  TextStyle lightGrayText = TextStyle(
    fontFamily: "SemiBold",
    fontSize: ScreenUtil().setSp(14),
    color: lightGray,
    fontWeight: FontWeight.w500
  );
  TextStyle darkGrayText = TextStyle(
      fontFamily: "SemiBold",
      fontSize: ScreenUtil().setSp(18),
      color: darkGray,
      fontWeight: FontWeight.w500);
}
