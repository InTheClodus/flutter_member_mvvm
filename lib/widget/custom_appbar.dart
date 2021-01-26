import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatefulWidget {
  final Widget childLeft;
  final Widget childRight;
  final Widget body;
  final String background;
  final Color upperColor;
  final Color lowerColor;
  final bool search;
  final int hight;
  final String title;
  final Widget childLowerTitle;
  const CustomAppBar(
      {Key key,
      this.childLeft,
      this.childRight,
      this.background,
      this.body,
      this.upperColor ,
      this.lowerColor ,
      this.search,
      this.hight,
      this.title,
        this.childLowerTitle})
      : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  get _childLeft => widget.childLeft;

  get _childRight => widget.childRight;

  get _body => widget.body;

  get _background => widget.background;

  get _upperColor => widget.upperColor;

  get _lowerColor => widget.lowerColor;

  get _search=>widget.search;

  get _hight=>widget.hight;

  get _title=>widget.title;

  get _childLowerTitle =>widget.childLowerTitle;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MyAppBar('title'),
      resizeToAvoidBottomPadding: true,
      body: _body ?? Container(),
    );
  }

  //  顶部AppBar
  Widget MyAppBar(String title) {
    return PreferredSize(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, top: 10),
            width: double.infinity,
            height: ScreenUtil().setHeight(_search==true?200+_hight:_hight),
            decoration: BoxDecoration(
                color: _lowerColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
          ),
          Container(
              padding: EdgeInsets.only(left: 10),
              width: double.infinity,
              height: ScreenUtil().setHeight(_search==true?200+_hight:_hight-5),
              decoration: BoxDecoration(
                  color: _upperColor,
                   image: DecorationImage(image: AssetImage(_background??'')),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Column(
                children: <Widget>[
                  SafeArea(
                      child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 15,top: 15),
                        child: _childLeft??InkWell(
                          child: ImageIcon(
                            AssetImage('images/back.png'),
                            color: Colors.white,
                          ),
                          onTap: ()=>Navigator.pop(context),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            _title??'',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(15),
                              fontFamily: 'SemiBold',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: _childRight??Container(height: 35,width: 35,),
                      ),
                    ],
                  )),

                  _search==true?SeachWidget():_childLowerTitle??Container(),
                ],
              )),
        ],
      ),
      preferredSize: Size(double.infinity, _search==true?200:double.parse(_hight.toString())),
    );
  }

  Widget SeachWidget() {
    return Container(
      padding: EdgeInsets.only(left: 30, bottom: 30, top: 50),
      child: Row(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(46),
            width: ScreenUtil().setWidth(250),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50), //邊框
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(179),
                  height: ScreenUtil().setHeight(21),
                  child: TextFormField(
                    maxLines: 1,
                    onChanged: (v) {
                      setState(() {});
                    },
                    onSaved: (value) {},
                    //controller: phoneController,
                    textAlign: TextAlign.left,
                    //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(6)],
                    decoration: InputDecoration(
                      hintText: ('搜尋補習年級詳情'),
                      contentPadding:
                          EdgeInsets.only(top: -5, bottom: 0, left: 10),
                      hintStyle: TextStyle(
                        color: Color(0XffC6C6C7),
                        fontSize: ScreenUtil().setSp(15),
                        fontFamily: "Regular",
                      ),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.search,
                      size: ScreenUtil().setSp(34),
                    ),
                    color: Color(0Xff4d80c5))
              ],
            ),
          )
        ],
      ),
    );
  }
}
