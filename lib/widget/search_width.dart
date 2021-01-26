import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidth extends StatefulWidget {
  final Function(String value) onChange;
  final inputController;
  final FocusNode focusNode;
  final String hintText;
  final Color downColor;
  final Color upColor;
  final String src;
  final VoidCallback onPressed;
  const SearchWidth({Key key, this.onChange, this.inputController, this.focusNode, this.hintText, this.src, this.onPressed, this.downColor, this.upColor}) : super(key: key);
  @override
  _SearchWidthState createState() => _SearchWidthState();
}

class _SearchWidthState extends State<SearchWidth> {

  // 输入框onChange
  void _onChange(String value) {
    if (widget.onChange is Function) {
      widget.onChange(value);
    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 667), allowFontScaling: false);
    return Container(
      //底色
      decoration: BoxDecoration(
          color: widget.downColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Container(
          margin: EdgeInsets.only(bottom: 5),
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.src),
              ),
              color: widget.upColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 30,bottom: 30),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: ScreenUtil().setHeight(46),
                      width: ScreenUtil().setWidth(250),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.circular(30),//邊框
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            width:ScreenUtil().setWidth(179),
                            height: ScreenUtil().setHeight(21),
                            child: TextFormField(
                              focusNode: widget.focusNode,
                              controller: widget.inputController,
                              maxLines: 1,
                              onChanged: _onChange,
                              onSaved: (value) {
                              },
                              //controller: phoneController,
                              textAlign: TextAlign.left,
                              //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(6)],
                              decoration: InputDecoration(
                                hintText: (widget.hintText),
                                contentPadding: EdgeInsets.only(top: -5,bottom: 0,left: 10),
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
                              onPressed: widget.onPressed,
                              icon: Icon(Icons.search,size: ScreenUtil().setSp(34),),
                              color: Color(0Xff2D7FC7)
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
