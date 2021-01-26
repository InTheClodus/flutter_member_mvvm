import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_member_mvvm/routes/navigator_util.dart';
import 'package:flutter_member_mvvm/stytle/SvgImg.dart';
import 'package:flutter_member_mvvm/util/Counter.dart';
import 'package:flutter_member_mvvm/widget/GridViewItem.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provide/provide.dart';

// 首页
class IndexPage extends StatefulWidget {
  final AnimationController animationController;

  const IndexPage({Key key, this.animationController}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with SingleTickerProviderStateMixin{
//----------  顶部导航控制

  var hidden = false;
  var offstage = false;
  /// 顶部控件数据
  List<dynamic> listIndexTopData = [
    {
      "title": "出勤紀錄",
      "imagePath": SvgImg.attendance,
      "path": "/index/subpage/AttendanceRecordPage"
    },
    {"title": "膳食", "imagePath": SvgImg.diet, "path": "/index/subpage/diet"},
    {
      "title": "成長紀錄",
      "imagePath": SvgImg.growth,
      "path": "/index/subpage/growUp"
    },
    {
      "title": "訂單紀錄",
      "imagePath": SvgImg.order,
      "path": "/index/subpage/order"
    },
    {
      "title": "學生信息",
      "imagePath": SvgImg.stuInfo,
      "path": "/index/subpage/information"
    },
    {
      "title": "學生相冊",
      "imagePath": SvgImg.album,
      "path": "/index/subpage/studentAlbum"
    },
    {
      "title": "訂閱服務",
      "imagePath": SvgImg.subscription,
      "path": "/index/subpage/service"
    },
    {
      "title": "家長列表",
      "imagePath": SvgImg.parentList,
      "path": "/index/subpage/parents"
    },
  ];
// -------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amberAccent,
        child: Column(
          children: [
            _indexTop(),
            Expanded(
              child: ListView.builder(
                  itemCount: 50,
                  padding: EdgeInsets.only(
                    bottom: 62 + MediaQuery.of(context).padding.bottom,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 20,
                      width: 320,
                      margin: EdgeInsets.only(top: 5,bottom: 5),
                      color: Colors.green,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  /// 頭部導航欄
  Widget _indexTop() {
    return AnimatedSize(
      duration: Duration(milliseconds: 200),
      vsync: this,
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        padding: EdgeInsets.only(bottom: 8, top: 8),
        decoration: BoxDecoration(
            color: Color(0Xff2D7FC7),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //導航欄
            Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                width: MediaQuery.of(context).size.width,
                // height: ScreenUtil().setHeight(136),
                child: Provide<Counter>(
                  builder: (context, child, counter) {
                    return counter.isNotStu == false
                        ? _indexTopNavigation()
                        : Container();
                  },
                )),
            GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.localPosition.direction > 0) {
                  setState(() {
                    hidden = false;
                  });
                } else if (details.localPosition.direction < 0) {
                  setState(() {
                    hidden = true;
                  });
                }
              },
              child: Container(
                margin: EdgeInsets.only(top: ScreenUtil().setSp(8)),
                width: ScreenUtil().setWidth(160),
                height: 5,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.white,
                        width: 3,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  //  頂部导航栏
  Widget _indexTopNavigation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              4,
                  (index) => Provide<Counter>(
                builder: (BuildContext context, child, counter) {
                  return GridViewItem(
                    title: listIndexTopData[index]['title'],
                    imagePath: listIndexTopData[index]['imagePath'],
                    onPressed: () => NavigatorUtil.jumpLoginState(context,
                        title: listIndexTopData[index]['path'] +
                            "/${counter.stuId}"),
                  );
                },
              )),
        ),
        SizedBox(height: 20),
        Offstage(
          offstage: offstage,
          child: AnimatedOpacity(
            opacity: hidden ? 0 : 1,
            duration: Duration(milliseconds: 200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  4,
                      (index) => Provide<Counter>(
                    builder: (BuildContext context, child, counter) {
                      return GridViewItem(
                        title: listIndexTopData[index + 4]['title'],
                        imagePath: listIndexTopData[index + 4]['imagePath'],
                        onPressed: () => NavigatorUtil.jumpLoginState(
                            context,
                            title: listIndexTopData[index + 4]['path'] +
                                "/${counter.stuId}"),
                      );
                    },
                  )),
            ),
            onEnd: () {
              setState(() {
                offstage = hidden;
              });
            },
          ),
        )
      ],
    );
  }
}
