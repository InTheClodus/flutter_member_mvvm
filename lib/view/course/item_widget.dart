import 'package:flutter/material.dart';
import 'package:flutter_member_mvvm/routes/navigator_util.dart';
import 'package:flutter_model_package/CourseClass.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:collection/collection.dart';

class ItemWidget extends StatelessWidget {
  final List<CourseClass> courseClssList;
  /// 跳转路径
  final String path;
  const ItemWidget({Key key, this.courseClssList, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: listWidget(context),
    );
  }

  /// List
  List<Widget> listWidget(BuildContext context) {
    Map<String, List<CourseClass>> mapCourseClass = {};
    mapCourseClass = groupBy(courseClssList, (obj) => obj['tags']);
    List<Widget> list = [];
    mapCourseClass.forEach((key, value) { 
      list.add(_title(_tags(key)));
     list.add(
       Container(
         height: ScreenUtil().setHeight(172),
         child: ListView(
           scrollDirection: Axis.horizontal,
           children:value.map((e){
             return _content(context,e);
           }).toList(),
         ),
       )
     );
    });
    return list;
  }
  Widget _content(BuildContext context,CourseClass courseClass){
    return InkWell(
      onTap: ()=>NavigatorUtil.jump(context, "$path/${courseClass.objectId}"),
      child: Container(
        child: Stack(
          children: [
            Container(
              height: ScreenUtil().setHeight(172),
              width: ScreenUtil().setWidth(134),
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                "暂无图片",
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: ScreenUtil().setHeight(72),
                  width: ScreenUtil().setWidth(134),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.amberAccent
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          classificationWidget(title: courseClass["course"]["category"]["title"])
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        margin: EdgeInsets.only(bottom: 15),
                        width: ScreenUtil().setWidth(120),
                        child: Text(
                          courseClass["course"]["title"],
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(16),
                            fontWeight: FontWeight.bold,
                            fontFamily: "SemiBold",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  /// 分类
  Widget classificationWidget({String title}) {
    return Container(
        margin: EdgeInsets.only(bottom: 5),
        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0), //邊框
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(9),
                fontWeight: FontWeight.w500,
                color: Colors.amberAccent),
          ),
        ));
  }
  String _tags(String tags) {
    switch (tags) {
      case "recommented":
        return '重點推薦';
        break;
      case "latest":
        return "最新推出";
        break;
      default:
        return "熱門課程";
    }
  }
  Widget _title(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 15),
      child: Text(
        title,
        style: TextStyle(
            fontSize: ScreenUtil().setSp(22),
            fontWeight: FontWeight.w500,
            color: Color(0XFF008DCD)),
      ),
    );
  }
}
