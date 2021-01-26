import 'package:flutter/material.dart';
import 'package:flutter_member_mvvm/util/over_scroll_behavior.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef clickCallback = void Function(String value);

class SearchRecords extends StatefulWidget {
  final List<String> searchRecords;
  final List<String> searchHot;
  final VoidCallback clear;
  final clickCallback onClick;
  const SearchRecords({Key key, this.searchRecords, this.searchHot, this.clear, this.onClick})
      : super(key: key);

  @override
  _SearchRecordsState createState() => _SearchRecordsState();
}

class _SearchRecordsState extends State<SearchRecords> {
  var width;
  var height;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
// 回調函數傳參
  void onClicked(String str){
    this.widget.onClick(str);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 667), allowFontScaling: false);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Stack(
        children: [
          Opacity(
            child: Container(
              color: Color(0xff4A4A4A),
            ),
            opacity: 0.7,
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: ScreenUtil().setHeight(275),
            decoration: BoxDecoration(
              color: Color(0Xffffffff),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)), //邊框
            ),
            child: ScrollConfiguration(
                behavior: OverScrollBehavior(),
                child: ListView(
                  children: <Widget>[
                    //最近搜尋
                    _searchTitle(title: '最近搜尋',clear: true),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Colors.black12,
                              width: 1,
                              style: BorderStyle.solid),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          //沒有任何搜尋紀錄
                          widget.searchRecords.length != 0
                              ? Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: width - 40,
                                    child: Wrap(
                                      spacing: 5,
                                      runAlignment: WrapAlignment.start,
                                      runSpacing: 3,
                                      children: _getWidget(widget.searchRecords),
                                    ),
                                  )
                                ],
                              ))
                              : noData()
                        ],
                      ),
                    ),
                    //熱門搜尋
                    widget.searchHot.length != 0
                        ? Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: width - 40,
                              child: Wrap(
                                spacing: 5,
                                runAlignment: WrapAlignment.start,
                                runSpacing: 3,
                                children: _getWidget(widget.searchHot),
                              ),
                            )
                          ],
                        ))
                        : noData()
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget _searchTitle({String title, bool clear}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(
              '最近搜尋',
              style: TextStyle(
                  color: Color(0Xff4d80c5),
                  fontSize: ScreenUtil().setSp(16)),
            ),
          ),
          //刪除搜索紀錄
          GestureDetector(
            onTap: widget.clear,
            child: Container(
              width: 25,
              height: 25,
              child: ImageIcon(
                AssetImage('images/recovery.png'),
                size: ScreenUtil().setSp(16),
                color: Color(0Xffb3b6c7),
              ),
            ),
          )
        ],
      ),
    );
  }



  //搜尋紀錄子組件
  List<Widget> _getWidget(List<String> list) {
    return list
        .map((str) => GestureDetector(
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0Xfff8f8f8)),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    str,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Color(0Xffb3b6c7)),
                  ),
                ),
              ),
            onTap:()=> onClicked(str),
            ))
        .toList();
  }

  Widget noData() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.search,
            color: Color(0Xffb3b6c7),
          ),
          Text(
            '沒有任何搜尋紀錄',
            style: TextStyle(color: Color(0Xffb3b6c7), fontSize: 18),
          )
        ],
      ),
    );
  }
}
