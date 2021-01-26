import 'package:flutter/material.dart';
import 'package:flutter_member_mvvm/widget/progress_widget.dart';
import 'package:flutter_screenutil/screenutil.dart';

enum ContentType {
  local,
}

class CustomCard extends StatelessWidget {
  /// 标题
  final String title;

  /// 图片url
  final String urlImg;

  // /// 日期
  final String startAndEndDate;

  //
  // /// 结束日期
  // final String endDate;

  /// 卡片点击事件
  final VoidCallback onTop;

  /// 地址
  final String address;

  /// 地址 点击
  final VoidCallback onTopAddress;

  /// 电话
  final String phone;

  /// 电话点击
  final VoidCallback onTopPhone;

  /// 剩余名额
  final String quota;

  /// 距离
  final String distance;

  /// 金额
  final String price;

  /// 进度
  final num schedule;

  /// 总进度
  final num totalProgress;

  const CustomCard(
      {Key key,
      this.title,
      this.urlImg,
      this.onTop,
      // this.startDate,
      // this.endDate,
      this.address,
      this.quota,
      this.distance,
      this.onTopAddress,
      this.phone,
      this.onTopPhone,
      this.startAndEndDate,
      this.price,
      this.schedule,
      this.totalProgress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTop,
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
            _phone(),
            Expanded(
              child: Column(
                children: [
                  _checkData(title, _title()),
                  _checkData(
                      phone,
                      _content(phone,
                          icon: "images/course_phone.png",
                          onClick: onTopPhone)),
                  _checkData(
                      startAndEndDate,
                      _content(startAndEndDate,
                          icon: "images/attendance_record.png")),
                  _checkData(
                      address,
                      _content(address,
                          icon: "images/address.png", onClick: onTopAddress)),
                  _checkData(price, _content(price, icon: "images/price.png")),
                  // _listContent(),
                  _checkData(quota, _quota()),
                  _checkData(distance.toString(), _distance()),
                  _checkData(
                      totalProgress.toString(),
                      _content(totalProgress.toString(),
                          childTeaching: ProgressWidget(
                            progress: totalProgress,
                            schedule:schedule,
                            title: "已完成 ${totalProgress}%",
                          )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _checkData(String title, Widget child) {
    print(title);
    if (title == null || title == "" || title == "null") {
      return Container();
    }
    return child;
  }

  Widget _phone() {
    return Container(
      child: Stack(
        children: [
          Container(
            height: ScreenUtil().setHeight(147),
            width: ScreenUtil().setHeight(128),
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            margin: EdgeInsets.all(8),
            child: urlImg != null
                ? NetworkImage(urlImg)
                : Center(
                    child: Text(
                      "暂无图片",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xff93BB24),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            height: ScreenUtil().setHeight(24),
            width: ScreenUtil().setWidth(71),
            child: Text(
              "持教課程",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Widget _title() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 5, top: 15),
      child: Text(
        "$title",
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Color(0xff154D7C),
            fontSize: ScreenUtil().setSp(15),
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _content(String title,
      {String icon, Widget childTeaching, VoidCallback onClick}) {
    return InkWell(
      onTap: onClick,
      child: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 5, top: 5, right: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? Container(
                      child: ImageIcon(
                        AssetImage(icon),
                        size: ScreenUtil().setWidth(20),
                        color: Color(0xffB9BDC5),
                      ),
                      padding: EdgeInsets.only(bottom: 5),
                    )
                  : Container(),
              Container(
                width: 8,
              ),
              Expanded(
                child: childTeaching != null
                    ? childTeaching
                    : Text(
                        "$title",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xffB9BDC5),
                            fontSize: ScreenUtil().setSp(12),
                            fontWeight: FontWeight.w500),
                      ),
              )
            ],
          )),
    );
  }

  /// 名额
  Widget _quota() {
    return Offstage(
      offstage: false,
      child: Container(
        alignment: Alignment.centerLeft,
        // margin: EdgeInsets.only(top: 5),
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
  Widget _distance() {
    return Offstage(
      offstage: false,
      child: Container(
        padding: EdgeInsets.all(1),
        margin: EdgeInsets.only(top: 20, left: 50, bottom: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(width: 1.5, color: Color(0xffA0BD34))),
        child: Text(
          "  距離 ＜ $distance m  ",
          style: TextStyle(
              color: Color(0xffA0BD34),
              fontWeight: FontWeight.w500,
              fontSize: ScreenUtil().setSp(12)),
        ),
      ),
    );
  }
}
