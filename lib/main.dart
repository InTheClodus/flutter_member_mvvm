import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_member_mvvm/provider_setup.dart';
import 'package:flutter_member_mvvm/util/Counter.dart';
import 'package:flutter_member_mvvm/view/login/login.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provide/provide.dart'as provide;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/simple_bloc_observer.dart';
import 'bloc/theme_cubit.dart';

void main() {
  var counter =Counter();
  var providers  =provide.Providers();
  providers..provide(provide.Provider<Counter>.value(counter));
  Bloc.observer = SimpleBlocObserver();
  runApp(provide.ProviderNode(
    providers: providers,
    child: MyApp(),
  ));
}

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

  bool isIos() {
    if (Platform.isIOS) {
      return true;
    } else if (Platform.isAndroid) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_)=>ThemeCubit(),
      child: MultiProvider(
        providers: providers,
        child: MaterialApp(
          title: 'Flutter MVVM',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: LoginView(),
        ),
      ),
    );
  }
}
