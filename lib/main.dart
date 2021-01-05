import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_member_mvvm/provider_setup.dart';
import 'package:flutter_member_mvvm/view/login/login.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

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
    // Directory appDocDir = await getApplicationDocumentsDirectory();
    try {
      await Parse().initialize(
          "macauscholar", "https://macauscholar.demo.ourmi.biz/api",
        masterKey: "7GTH8NLumCHd/v/HfLvYSAejq2Xf6K9D9hSNxliIRt0=",
          // coreStore: await CoreStoreSembastImp.getInstance(appDocDir.path + "/data")
      );
    } catch (e) {}
    final ParseResponse response = await Parse().healthCheck();
    if (response.success) {
      print("初始化成功");
    }
  }

  bool isIos(){
    if(Platform.isIOS){
      return true;
    }else if(Platform.isAndroid){
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter MVVM',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginView(),
      ),
    );
  }
}
