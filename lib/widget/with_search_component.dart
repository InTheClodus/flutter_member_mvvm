import 'package:flutter/material.dart';
import 'package:flutter_member_mvvm/widget/search_records.dart';
import 'package:flutter_member_mvvm/widget/search_width.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottm_sheet_dialog.dart';


/*
 * 包含搜索栏的组件
 * searchHistorys []
 * popularSearches []
 * 清空历史搜索 onTop
 * body 主要内容区域
 * backImg 背景图片
 * downColor 下层颜色
 * upColor 上层颜色
 */
typedef FocusCanceled = void Function(bool v,String search);

class WithSearchComponent extends StatefulWidget {
  ///搜索紀錄
  final List<String> searchHistorys;

  /// 熱門搜索
  final List<String> popularSearches;

  /// 清空搜索紀錄按鈕
  final VoidCallback onTop;

  /// 內容
  final Widget body;

  /// 背景圖片
  final String backImg;

  /// 下層顏色
  final Color downColor;

  /// 上層顏色
  final Color upColor;

  /// 搜索框控制器
  // final TextEditingController searchEditing;

  /// 焦點取消
  final FocusCanceled focusCanceled;

  /// 焦點
  final FocusNode focusNode;

  const WithSearchComponent(
      {Key key,
      this.searchHistorys,
      this.popularSearches,
      this.onTop,
      this.body,
      this.backImg,
      @required this.downColor,
      @required this.upColor,
      // this.searchEditing,
      this.focusCanceled,
      this.focusNode})
      : super(key: key);

  @override
  _WithSearchComponentState createState() => _WithSearchComponentState();
}

class _WithSearchComponentState extends State<WithSearchComponent> {
  get _searchHistorys => widget.searchHistorys;

  get _popularSearches => widget.popularSearches;

  get _onTop => widget.onTop;

  get _body => widget.body;

  get _backImg => widget.backImg;

  get _downColor => widget.downColor;

  get _upColor => widget.upColor;



  get _focusNode => widget.focusNode;

  get _focusCanceled => widget.focusCanceled;

  var deleteFocus = false;

  bool _focusView = false;

  ///搜索框控制器
  TextEditingController searchEditing = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {

        setState(() {
          _focusView = true;
        });
      } else {
        setState(() {
          _focusView = false;
          /// 當焦點消失且输入框不为空
          if(searchEditing.text!=null&&searchEditing.text!=""){
            _focusCanceled(_focusNode.hasFocus,searchEditing.text);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          alignment: Alignment.center,
          child: SearchWidth(
            src: 'assets/images/top_school_network.png',
            hintText: '搜尋門店',
            downColor: _downColor,
            upColor: _upColor,
            focusNode: _focusNode,
            inputController: searchEditing,
          ),
        ),
        preferredSize: Size(double.infinity, ScreenUtil().setHeight(78)),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [_body, _searchRecode()],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _searchRecode() {
    if (_focusView) {
      return SearchRecords(
        searchRecords: _searchHistorys,
        searchHot: _popularSearches,
        clear: () {
          deleteFocus = true;
          showPayActionSheets(
              context: context, title: "提示", data: ["确认", '取消']);
        },
        onClick: (str) {
          print(str);
          setState(() {
            _focusView = false;
            FocusScope.of(context).requestFocus(FocusNode());
            searchEditing.text = str;
          });

        },
      );
    } else {
      return Container();
    }
  }

  /// 具体使用方式
  Future<int> showPayActionSheets(
      {@required BuildContext context,
      @required String title,
      @required List data}) {
    return showCustomBottomSheet(
        context: context,
        title: title,
        children: data
            .map((e) =>
                actionItem(context: context, index: 1, title: e, onTop: () {}))
            .toList());
  }
}
