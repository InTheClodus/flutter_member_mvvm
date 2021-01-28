import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_member_mvvm/routes/navigator_util.dart';
import 'package:flutter_member_mvvm/theme/font_theme.dart';
import 'package:flutter_member_mvvm/util/date_util.dart';

import 'package:flutter_member_mvvm/util/over_scroll_behavior.dart';
import 'package:flutter_member_mvvm/view/base_view.dart';
import 'package:flutter_member_mvvm/viewmodels/index_course_models.dart';
import 'package:flutter_member_mvvm/widget/check_widget.dart';
import 'package:flutter_member_mvvm/widget/custom_card.dart';
import 'package:flutter_member_mvvm/widget/single_choice.dart';
import 'package:flutter_member_mvvm/widget/with_search_component.dart';
import 'package:flutter_model_package/CourseCategory.dart';
import 'package:flutter_model_package/CourseClass.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

import 'item_widget.dart';

class IndexCourse extends StatefulWidget {
  final AnimationController animationController;

  const IndexCourse({Key key, this.animationController}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexCourse> {
  /// 搜索焦点
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    TabController _tabController;
    return BaseView<IndexCourseModels>(
      onModelReady: (model) async {
        await model.getCourseClass();
        await model.queryClass();
      },
      model: IndexCourseModels(api: Provider.of(context)),
      builder: (context, model, child) => DefaultTabController(
        length: model.categories.length + 1,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: WithSearchComponent(
              downColor: Color(0Xffffe7a7),
              upColor: Color(0Xffffc128),
              searchHistorys: ['aaaaa', 'bbbbbb', 'ccccc'],
              popularSearches: ["1111", '22222', '33333'],
              focusNode: _focusNode,
              body: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () => _openBottomSheet(),
                        child: Image(
                          image: AssetImage("assets/images/filter.png"),
                          height: 25,
                          width: 25,
                        ),
                      ),
                      new TabBar(
                        indicatorColor: Colors.yellow,
                        isScrollable: true,
                        indicatorWeight: 4,
                        indicatorPadding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                        labelColor: Color(0xff2D7FC7),
                        unselectedLabelColor: Color(0xffd9d9d9),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: ScreenUtil().setSp(16)),
                        tabs: listTabTitle(model),
                        controller: _tabController,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        bottom: 62 + MediaQuery.of(context).padding.bottom,
                      ),
                      child: TabBarView(
                        children: listTabView(width, model),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget tabview(List<List<CourseClass>> list) {
    return SingleChildScrollView(
      child: Column(
        children: list
            .map((e) => Container(
                  margin: EdgeInsets.all(10),
                  child: ItemWidget(
                    courseClssList: e,
                    path: "/curriculum/details",
                  ),
                ))
            .toList(),
      ),
    );
  }

//廣告
  Widget advertisement(Widget listViewDate) {
    return Container(
      height: ScreenUtil().setHeight(165),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: ScrollConfiguration(
          behavior: OverScrollBehavior(), child: listViewDate),
    );
  }

//  tab标签
  List<Widget> listTabTitle(IndexCourseModels model) {
    List<Widget> listWidget = [];
    listWidget.add(Tab(
      text: "全部",
    ));
    model.categories.forEach((value) {
      listWidget.add(Tab(
        text: value.get("title"),
      ));
    });
    return listWidget;
  }

//  tabview
  List<Widget> listTabView(width, IndexCourseModels model) {
    List<Widget> listWidget = [];
    listWidget.add(tabview(model.courseClass));
    model.categories.forEach((value) {
      listWidget.add(contentItem(value));
    });
    return listWidget;
  }

  /// 内容item
  Widget contentItem(CourseCategory category) {
    Future futureForCategory = CourseClass.getForCategory(category);
    return FutureBuilder<List<CourseClass>>(
      future: futureForCategory,
      builder:
          (BuildContext context, AsyncSnapshot<List<CourseClass>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return EasyRefresh(
            onRefresh: () async {
              setState(() {
                futureForCategory = CourseClass.getForCategory(category);
              });
            },
            child: Column(
              children: snapshot.data.map((e) {
                return CustomCard(
                    title: e["course"]['title'],
                    onTop: () => NavigatorUtil.jumpLoginState(context,
                        title: "/curriculum/details/${e.objectId}"),
                    onTopAddress: () => print("object"),
                    address: e['branch']['address'],
                    startAndEndDate:
                        DateUtil.formatTowDate(e["startDate"], e["endDate"]));
              }).toList(),
            ),
          );
        }
        return Text("加载中");
      },
    );
  }

  void _openBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return _shareWidget(context);
        });
  }

  List list = [
    {"title": "智能排序", "type": 0},
    {"title": "距離 (由近至遠)", "type": 1},
    {"title": "學費（由低至高)", "type": 2},
    {"title": "學費（由高至低", "type": 3},
    {"title": "上課日期（由較早開課到較遲開課", "type": 4}
  ];

  //  排序框
  Widget _shareWidget(context) {
    var divider = Divider(
      color: Color.fromRGBO(189, 192, 200, 60),
      height: 0.5,
    );
    return Container(
      height: ScreenUtil().setHeight(423),
      padding: EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffc8daee),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
            margin: EdgeInsets.only(
              top: 5,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                changtiao(),
                titleRow(context),
                divider,
                title("排序"),
                SingleChoice(
                  formList: list,
                ),
                title("持續進修課程"),
                divider,
                CheckWidget()
              ],
            )),
      ),
    );
  }

  Widget title(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 20, top: 10, bottom: 10),
      child: Text(
        title,
        style: FontTheme().lightGrayText,
      ),
    );
  }

  Widget titleRow(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            child: Text(
              "重設",
              style: FontTheme().lightGreenText,
            ),
            onTap: () => Navigator.pop(context),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "篩選",
            style: FontTheme().azureBlueText,
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            child: Text(
              "完成",
              style: FontTheme().lightBlueText,
            ),
            onTap: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  Widget changtiao() {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 5),
              width: 60,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xffaeaebe),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
