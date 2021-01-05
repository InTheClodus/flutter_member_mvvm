import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: ScreenUtil().setWidth(343),
        margin: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Color(0xffe3e8ed), blurRadius: 3.0, spreadRadius: 2.0),
              BoxShadow(
                  color: Color(0xffe7ebf0), blurRadius: 3.0, spreadRadius: 2.0),
              BoxShadow(
                  color: Color(0xffebeef2), blurRadius: 3.0, spreadRadius: 2.0),
              BoxShadow(
                  color: Color(0xffeff1f5), blurRadius: 3.0, spreadRadius: 2.0)
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: ScreenUtil().setHeight(147),
              width: ScreenUtil().setHeight(128),
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              margin: EdgeInsets.all(8),
            ),
            Expanded(
              child: Column(
                children: [
                  _title(),
                  _content(),
                  _content(),
                  _quota(),
                  _distance()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 5, top: 15),
      child: Text(
        "标题固定标题固定标定标题固定",
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Color(0xff154D7C),
            fontSize: ScreenUtil().setSp(15),
            fontWeight: FontWeight.w500),
      ),
    );
  }


  Widget _content() {
    return Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(left: 5, top: 5, right: 5),
        child: Row(
          children: [
            Container(
              height: 8,
              width: 8,
              color: Colors.amberAccent,
              margin: EdgeInsets.only(right: 10),
            ),
            Expanded(
              child: Text(
                "标题固定标题固定标题固定标定",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color(0xffB9BDC5),
                    fontSize: ScreenUtil().setSp(12),
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ));
  }
  /// 名额
  Widget _quota() {
    return Offstage(
      offstage: false,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 5),
        child: Text(
          "名額剩餘：3位",
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Color(0xffFF0000),
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
  /// 距离
   Widget _distance(){
    return Offstage(
      offstage: false,
      child: Container(
        padding: EdgeInsets.all(1),
        margin: EdgeInsets.only(top: 20,left: 50,bottom: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(width: 1.5,color: Color(0xffA0BD34))
        ),
        child: Text("   距離 ＜111m   ",style: TextStyle(
            color: Color(0xffA0BD34),
            fontWeight: FontWeight.w500,
            fontSize: ScreenUtil().setSp(12)
        ),),
      ),
    );
   }
}
