import 'package:cool_ui/cool_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 圆形边框输入框

/*
 * tel 电话号码前缀
 * borderColro 默认边框颜色
 * borderErrColor 错误颜色
 * control 输入框控制器
 *  final Function(String value) onChange;
 * errortext 错误文本
 */

class InputWidget extends StatelessWidget {
  // 电话前缀
  final tel;
  // 错误提示
  final String errorText;
  //默认边框颜色
  final Color borderColor;
  //错误提示颜色
  final Color borderErrColor;
  final TextEditingController controller;
  //焦點
  final FocusNode focusNode;
  final Function(String v) onChange;
  // 是否显示边框
  final bool border;
  //高度
  final num height;
  const InputWidget(
      {Key key,
        this.tel,
        this.borderColor,
        this.borderErrColor,
        this.controller,
        this.onChange, this.errorText, this.border=true, this.height, this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 667), allowFontScaling: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 20, right: 20),
          padding: EdgeInsets.only(bottom: 1,top: 1),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              border: border==false? null: Border.all(
                color: Color(0xff2D7FC7),
                width: 1.3,
              ),
              color: Color(0xffF2F2F2)),
          child: Row(
            children: [
              Container(
                width: 25,
              ),
              tel!=null?
              Text(
                tel,
                style: TextStyle(
                    color: Color(0xff008DCD),
                    fontSize: ScreenUtil().setSp(15)),
              ):Container(),
              Container(
                width: 15,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  onChanged: onChange,
                  focusNode: focusNode,
                  cursorColor: Color(0xff154D7C),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: "PingFangHKRegular",
                      ),
                      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      border: InputBorder.none),
                  style: TextStyle(
                      color: Color(0xff154D7C),
                      fontSize: ScreenUtil().setSp(15)),
                ),
              ),
            ],
          ),),

        Container(
          margin: EdgeInsets.only(left: 30,top: 5),
          child: Text(
            errorText??'',
            style: TextStyle(
                color: Color(0xffFB595E),
                fontSize: ScreenUtil().setSp(13),
                fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
