import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_member_mvvm/test.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:path_provider/path_provider.dart';

import 'view/LoginView.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initParse();
  }

  Future<void> initParse() async {
    print('object');
    Directory appDocDir = await getApplicationDocumentsDirectory();
    try {
      await Parse().initialize(
          "macauscholar", "https://macauscholar.demo.ourmi.biz/api",
        masterKey: "7GTH8NLumCHd/v/HfLvYSAejq2Xf6K9D9hSNxliIRt0=",
          coreStore: await CoreStoreSembastImp.getInstance(appDocDir.path + "/data"));
    } catch (e) {}
    final ParseResponse response = await Parse().healthCheck();
    if (response.success) {
      print("初始化成功");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginView(),
    );
  }
}
