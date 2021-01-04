import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_member_mvvm/view/home.dart';
import 'package:flutter_member_mvvm/view/login/login.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class LogonStatus extends StatefulWidget {
  @override
  _LogonStatusState createState() => _LogonStatusState();
}

class _LogonStatusState extends State<LogonStatus> {
  //网络状态描述
  String _connectStateDescription;

  StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initParse();
    });
    //监测网络变化
  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: height,
              width: width,
              child: Image.asset(
                'images/loadmore.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Text("加载中"),
            )

          ],
        ));
  }

  Future<void> _initParse() async {
    // final ParseResponse response = await Parse().healthCheck();
    final ParseUser user = await ParseUser.currentUser();
    if(user!=null){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return HomeView();
      }));
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return LoginView();
      }));
    }
  }
}
