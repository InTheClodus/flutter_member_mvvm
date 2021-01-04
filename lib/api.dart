import 'package:parse_server_sdk/parse_server_sdk.dart';

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
}
