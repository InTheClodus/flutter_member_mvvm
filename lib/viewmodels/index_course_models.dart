import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_member_mvvm/api.dart';
import 'package:flutter_member_mvvm/viewmodels/base_model.dart';
import 'package:flutter_model_package/CourseClass.dart';
import 'package:collection/collection.dart';

class IndexCourseModels extends BaseModel {
  IndexCourseModels({@required Api api}) : super(api:api);

  List<List<CourseClass>> _listCourseclass= [];

  Map<String, List<CourseClass>> _mapCourseClass = {};
  /// 课程数据
  List<CourseClass> listCourseClass = [];

  Future<void> queryClass()async{
   var rep = await CourseClass.getTaggedCourse(["recommented", 'hot', 'latest']);
   courseClass = rep;
  }

  /// 課程
  Future<void> getCourseClass() async {
    var query = CourseClass().queryCourse();
    var rep = await query.query();
    if (rep.results.isNotEmpty && rep.success) {
      listCourseClass = rep.results.map((e) => e as CourseClass).toList();
      mapCourseClass = groupBy(
          listCourseClass, (obj) => obj["course"]['category']['title']);
    }
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