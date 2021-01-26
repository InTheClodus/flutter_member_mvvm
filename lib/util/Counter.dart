import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class Counter with ChangeNotifier {
  // 學生
  List<dynamic> listStu=[];
  // 用戶
  ParseUser user ;
  // 沒有學生
  bool isNotStu=false;
  // 學生Id
  String stuId;
  void increment(List list) {
    print("list  $list");
    listStu = list;
    stuId = listStu[0]['stuId'];
    notifyListeners();
  }
  void initUser(ParseUser user){
    this.user=user;
    notifyListeners();
  }
  //修改學生狀態
  void stuState(bool state){
    this.isNotStu=state;
    notifyListeners();
  }
  /// 修改学生Id
  void updateStuId(String id) {
    this.stuId = id;
    notifyListeners();
  }

}
