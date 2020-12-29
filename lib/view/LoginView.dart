import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../viewModle/LoginViewModel.dart';
import 'package:mvvm/mvvm.dart';

import '../service/RemoteService.dart';

// View
class LoginView extends View<LoginViewModel> {
  LoginView() : super(LoginViewModel(RemoteService()));

  @override
  Widget build(BuildContext context) {
    $Model.context = context;
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 100, bottom: 30),
            padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                TextField(
                  controller: $Model.userNameCtrl,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'UserName',
                  ),
                ),
                SizedBox(height: 10),
                $.adapt<String>(#password,
                    builder: (emit) => TextField(
                          onChanged: (v) => emit(),
                          obscureText: true,
                          controller: $Model.passwordCtrl,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                    valueGetter: () => $Model.passwordCtrl.text,
                    valueSetter: (v) => $Model.passwordCtrl.text = v,
                    valueChanged: (v, k) => print("$k: $v")),
                SizedBox(height: 10),
                $.$ifFor(#login,
                    valueHandle: (AsyncSnapshot snapshot) => snapshot.hasError,
                    builder: $.builder1((AsyncSnapshot snapshot) {
                      return Text("${snapshot.error}",
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 16));
                    })),
                Container(
                    margin: EdgeInsets.only(top: 80),
                    width: double.infinity,
                    child: $.watchAnyFor<String>(const [#userName, #password],
                        builder: $.builder2((_, child) => RaisedButton(
                            onPressed: $Model.inputValid
                                ? $Model.link(#login, resetOnBefore: true)
                                : null,
                            child: child,
                            color: Colors.blueAccent,
                            textColor: Colors.white)),
                        child: $.watchFor(#login,
                            builder: $.builder2(
                                (AsyncSnapshot snapshot, child) =>
                                    snapshot.connectionState ==
                                            ConnectionState.waiting
                                        ? _buildWaitingWidget()
                                        : child),
                            child: Text("login")))),
                SizedBox(height: 20),
                $.$ifFor<AsyncSnapshot<ParseResponse>>(#login,
                    valueHandle: (AsyncSnapshot snapshot) => snapshot.hasData,
                    builder: $.builder1(
                        (AsyncSnapshot<ParseResponse> snapshot) => Text(
                            "${snapshot.data.statusCode}",
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 20))))
              ],
            )));
  }

  Widget _buildWaitingWidget() => SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 2,
      ));
}
