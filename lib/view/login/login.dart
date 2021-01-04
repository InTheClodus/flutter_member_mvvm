import 'package:flutter/material.dart';
import 'package:flutter_member_mvvm/stytle/SvgImg.dart';
import 'package:flutter_member_mvvm/stytle/img_path.dart';
import 'package:flutter_member_mvvm/view/home.dart';
import 'package:flutter_member_mvvm/viewmodels/login_model.dart';
import 'package:flutter_member_mvvm/widget/custom_button.dart';
import 'package:flutter_member_mvvm/widget/input_widget.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

import '../base_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final mobileTextController = TextEditingController();
  final smsTextController = TextEditingController();

  /// 验证码返回的数据
  ParseResponse response;

  // 电话号码登录
  bool _phone = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 667), allowFontScaling: false);
    return BaseView<LoginViewModel>(
      model: LoginViewModel(api: Provider.of(context)),
      onModelReady: (model) {},
      builder: (context, model, child) {
        return Scaffold(
          resizeToAvoidBottomPadding: true,
          body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Stack(
                  children: <Widget>[
                    // CustomPaintRoute(),
                    Container(
                      height: ScreenUtil().setHeight(667),
                      width: ScreenUtil().setWidth(375),
                      child: SvgPicture.string(
                        SvgImg.loginBack,
                        height: ScreenUtil().setHeight(667),
                        width: ScreenUtil().setWidth(375),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      child: Container(
                        //height: MediaQuery.of(context).size.height*0.35,
                        margin: EdgeInsets.only(
                            top: ScreenUtil().setWidth(70),
                            left: 20,
                            right: 20),
                        height: ScreenUtil().setHeight(280),
                        child: SvgPicture.string(
                          SvgImg.svgRunlin,
                          height: ScreenUtil().setWidth(344),
                          width: ScreenUtil().setWidth(262),
                        ),
                      ),
                    ),
                    Container(
                        height: ScreenUtil().setHeight(321),
                        margin: EdgeInsets.only(
                            top: ScreenUtil().setHeight(305),
                            left: ScreenUtil().setWidth(20)),
                        decoration: BoxDecoration(
                            color: Color(0Xffc5daee),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x99E6EAF0),
                                  offset: Offset(5.0, 5.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0),
                              BoxShadow(
                                  color: Color(0x99E6EAF0),
                                  offset: Offset(1.0, 1.0)),
                              BoxShadow(color: Color(0x99E6EAF0))
                            ]),
                        child: Container(
                          // height: ScreenUtil().setHeight(317),
                          width: ScreenUtil().setWidth(335),
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            color: Color(0Xffffffff),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            child: WillPopScope(
                              child: _bodyWidget(model),
                              onWillPop: () async {
                                setState(() {
                                  if (_phone == true) _phone = false;
                                });
                                if (_phone == false) {
                                  return true;
                                }
                                return false;
                              },
                            ),
                          ),
                        )),
                  ],
                )),
          ),
        );
      },
    );
  }

  /// 主体区域
  Widget _bodyWidget(LoginViewModel model) {
    if (_phone == true) {
      return phoneLogin(model);
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Text(
              '從一下方式登入',
              style: TextStyle(
                color: Color(0Xff2D7FC7),
                fontSize: ScreenUtil().setSp(17),
                fontFamily: "SemiBold",
              ),
            ),
          ),
          CustomButton(
            color1: Color(0xff93BB24),
            color2: Color(0xff2D7FC7),
            image: phoneIconPath,
            type: "isFilling",
            title: "電話號碼登入",
            onPressed: (){
              setState(() {
                _phone=true;
              });
              print(_phone);
            },
          ),
          CustomButton(
            color1: Color(0xff93BB24),
            color2: Color(0xff2D7FC7),
            image: wechtIconPath,
            type: "isBorder",
            title: "微信登入",
            fontColor: Color(0Xff93BB24),
          ),
          CustomButton(
            color1: Color(0xff2D7FC7),
            color2: Color(0xff93BB24),
            image: facebookIconPath,
            type: "isBorder",
            title: "Facebook 登入",
            fontColor: Color(0Xff2D7FC7),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '還未成為會員？',
                  style: TextStyle(
                      color: Color(0Xff154D7C),
                      fontSize: ScreenUtil().setSp(13),
                      fontFamily: "SemiBold",
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    '按此註冊',
                    style: TextStyle(
                        color: Color(0Xff93BB24),
                        fontSize: ScreenUtil().setSp(13),
                        fontFamily: "SemiBold",
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      );
    }
  }

  /// 电话号码登录
  Widget phoneLogin(LoginViewModel model) {
    return Column(
//      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        phoneLoginTitle("驗證電話號碼"),
        InputWidget(
          tel: "+853",
          controller: mobileTextController,
        ),
        Row(
          children: [
            Expanded(
              child: InputWidget(
                controller: smsTextController,
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (model.countdownTime == 0) {
                  response = await model.sendSms(mobileTextController.text);
                  model.startCountdown();
                }
              },
              child: Text(
                model.countdownTime > 0
                    ? '${model.countdownTime}秒后重新发送'
                    : '请输入短信验证码',
                style: TextStyle(
                  fontSize: 14,
                  color: model.countdownTime > 0
                      ? Color(0xFFa5a5a5)
                      : Color(0xFF191919),
                ),
              ),
            ),
          ],
        ),

        CustomButton(
          color1: Color(0xff93BB24),
          color2: Color(0xff2D7FC7),
          width: 200,
          image: phoneIconPath,
          type: "isFilling",
          title: "登入",
          onPressed: () async {
            var rep = await model.login(mobileTextController.text,
                response.result, smsTextController.text);
            if (rep.success) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomeView();
              }));
            }
          },
        )
      ],
    );
  }

  /// 手机登录标题

  Widget phoneLoginTitle(String title) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 10),
      child: Text(
        title,
        style: TextStyle(
            color: Color(0xff008DCD),
            fontSize: ScreenUtil().setSp(18),
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
