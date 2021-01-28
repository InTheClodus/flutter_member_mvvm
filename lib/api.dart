import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:fluwx_no_pay/fluwx_no_pay.dart' as fluwx;

class Api {
  /// 发送验证码
  Future<ParseResponse> sensSms(String mobile) async {
    print('发送验证码...');
    final ParseCloudFunction function = ParseCloudFunction('smsShortCode');

    final Map<String, String> params = <String, String>{
      'phoneNumber': mobile,
      'callingCode': "853",
      'action': "login"
    };
    return await function.execute(parameters: params);
  }

  /// 普通登录
  Future<ParseResponse> login(
      String mobile, String requestId, String sms) async {
    print('登录中...');
    try {
      return await ParseUser.loginWith(
          "sms", {"id": "+853-" + mobile, "requestId": requestId, "code": sms});
    } catch (e) {}
  }

  /// faceBook 登录
  Future<ParseResponse> goToFacebookLogin() async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        return await ParseUser.loginWith(
            'facebook',
            facebook(result.accessToken.token, result.accessToken.userId,
                result.accessToken.expires));
        break;

      case FacebookLoginStatus.cancelledByUser:
        print("登录取消");
        break;
      case FacebookLoginStatus.error:
        print("登錄錯誤");
        break;
    }
  }
  /// 查询登录用户是否存在会员信息
  Future<ParseResponse> getUserMemberInfo() async {
    final ParseUser user = await ParseUser.currentUser();

  }
  void wechatLogin(){
    fluwx.sendWeChatAuth(scope: "snsapi_userinfo", state: "儒林教育").then((data) {
    }).catchError((e) {
    });
  }
}
