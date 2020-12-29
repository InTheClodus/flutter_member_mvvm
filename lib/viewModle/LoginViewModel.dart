
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm/mvvm.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../service/RemoteService.dart';
// ViewModel
class LoginViewModel extends ViewModel with AsyncViewModelMixin {
  final RemoteService _service;

  final TextEditingController userNameCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  BuildContext context;
  LoginViewModel(this._service) {
    propertyValue<DateTime>(#time, initial: DateTime.now());
    // timer
    start();

    propertyAdaptive<String, TextEditingController>(
        #userName, userNameCtrl, (v) => v.text, (a, v) => a.text = v,
        valueChanged: (v, k) => print("$k: $v"), initial: "");

    propertyAsync<ParseResponse>(
        #login, () => _service.login(userNameCtrl.text, passwordCtrl.text,context),
        valueChanged: (v, k) => print("$k: $v"));
  }

  bool get inputValid =>
      userNameCtrl.text.length > 2 && passwordCtrl.text.length > 2;

  final _pad = (int v) => "$v".padLeft(2, "0");
  String format(DateTime dt) =>
      "${_pad(dt.hour)}:${_pad(dt.minute)}:${_pad(dt.second)}";

  start() {
    Timer.periodic(const Duration(seconds: 1),
            (_) => setValue<DateTime>(#time, DateTime.now()));
  }
}