import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_member_mvvm/api.dart';
import 'package:flutter_member_mvvm/viewmodels/base_model.dart';
import 'package:flutter_model_package/CourseCategory.dart';
import 'package:flutter_model_package/CourseClass.dart';
import 'package:collection/collection.dart';

class IndexCourseModels extends BaseModel {
  IndexCourseModels({@required Api api}) : super(api:api);

  List<List<CourseClass>> _listCourseclass= [];
  List<CourseClass> listTitle=[];
  Map<String, List<CourseClass>> _mapCourseClass = {};
  /// 课程数据
  List<CourseClass> listCourseClass = [];

  /// 顶部 tab
  List<CourseCategory> categories = [];
  Future<void> queryClass()async{
   var rep = await CourseClass.getTaggedCourse(["recommented", 'hot', 'latest']);
   courseClass = rep;
  }

  /// 課程
  Future<void> getCourseClass() async {
    categories = await CourseCategory.getCategories();
  }

  List<List<CourseClass>> get courseClass => _listCourseclass;
  set courseClass(List<List<CourseClass>> list){
    _listCourseclass = list;
    notifyListeners();
  }

  Map<String, List<CourseClass>> get mapCourseClass => _mapCourseClass;
  set mapCourseClass(Map<String, List<CourseClass>> map){
    _mapCourseClass = map;
    notifyListeners();
  }
}