import 'dart:io';

import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:path_provider/path_provider.dart';
class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {



  Future<void> sss()async {
    final ParseUser user = await ParseUser.currentUser();
    var q = QueryBuilder(ParseObject("_User"));
    var rep = await q.query();
    print(user);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: FlatButton(child:Text("11"),onPressed: ()=>sss(),),
      ),
    );
  }
}
