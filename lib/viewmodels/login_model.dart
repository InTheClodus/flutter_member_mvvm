import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_member_mvvm/viewmodels/base_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../api.dart';

class LoginViewModel extends BaseModel {

  LoginViewModel({@required Api api}) : super(api: api);

  Timer _timer;
  int _countdownTime = 0;

  Future<ParseResponse> sendSms(String mobile) async {
   return await api.sensSms(mobile);
  }

  Future<ParseResponse> login(String mobile,String requestId, String sms) async {
    return await api.login(mobile,requestId, sms);
  }

  void startCountdown() {
    _countdownTime = 60;
    if (_timer == null) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        countdownTime--;
        if (countdownTime == 0) {
          cancelTimer();
        }
      });
    }
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  @override
  void dispose() {
    cancelTimer();
    super.dispose();
  }

  int get countdownTime => _countdownTime;

  set countdownTime(int value) {
    _countdownTime = value;
    notifyListeners();
  }

}
