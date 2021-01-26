import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("404页面"),),
      body: Center(
        child: Text("找不到路由，404\n该页面不存在\n如果你是用户请联系开发者解决问题"),
      ),
    );
  }
}
