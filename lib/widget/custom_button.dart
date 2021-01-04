import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class CustomButton extends StatelessWidget {
  // @required Color color1,
  // @required Color color2,
  //     VoidCallback onPressed,
  // @required image,
  // @required type,
  // @required String title,
  //     num width = 273,
  // Color fontColor
  final Color color1;
  final Color color2;
  final VoidCallback onPressed;
  final String image;
  final String type;
  final String title;
  final num width;
  final num height;
  final Color fontColor;

  const CustomButton(
      {Key key,
      this.color1,
      this.color2,
      this.onPressed,
      this.image,
      this.type,
      this.title,
      this.width,
      this.fontColor, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:10,right: 10),
      height:height!=null?ScreenUtil().setHeight(height):ScreenUtil().setHeight(50),
      width: width!=null?ScreenUtil().setHeight(width):null,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color1, color2]), // 渐变色
          borderRadius: BorderRadius.circular(50)),
      child: Container(
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: type == "isFilling" ? Colors.transparent : Colors.white,
              borderRadius: BorderRadius.circular(50)),
          child: FlatButton(
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                image == null || image == ""
                    ? Container()
                    : Image.asset(
                        image,
                        height: 22,
                        width: 25,
                      ),
                Container(
                  width:image == null || image == "" ? 0 :10,
                ),
                Text(
                  "$title",
                  style: TextStyle(
                    color: fontColor == null ? Colors.white : fontColor,
                    fontSize: ScreenUtil().setSp(16),
                    fontFamily: "SemiBold",
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
