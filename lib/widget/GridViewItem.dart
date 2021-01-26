import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GridViewItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onPressed;
  final num color;
  const GridViewItem(
      {Key key,
        @required this.title,
        @required this.imagePath,
        this.onPressed,
        this.color = 0xffffffff})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 667), allowFontScaling: false);
    return GestureDetector(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(30),
              height: ScreenUtil().setHeight(30),
              child: SvgPicture.string(imagePath,),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(color),
                    fontSize: ScreenUtil().setSp(11),
                    fontFamily: "SemiBold"),
              ),
            ),
          ],
        ),
      ),
      onTap: onPressed,
    );
  }
}
