import 'package:flutter/material.dart';
import 'package:flutter_member_mvvm/stytle/SvgImg.dart';
import 'package:flutter_member_mvvm/theme/font_theme.dart';
import 'package:flutter_svg/svg.dart';

typedef Type = void Function(String type);
class CheckWidget extends StatefulWidget {
  final String title;
  final Type type;

  const CheckWidget({Key key, this.title, this.type}) : super(key: key);
  @override
  _CheckWidgetState createState() => _CheckWidgetState();
}

class _CheckWidgetState extends State<CheckWidget> {

  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return checkWidget();
  }

  /// 模仿選擇框
  Widget checkWidget() {
    return InkWell(
      onTap: () {
        setState(() {
          isCheck = !isCheck;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 15, bottom: 15),
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '使用持續進修課程',
              style: FontTheme().lightGreenText,
            ),
            isCheck == true
                ? SvgPicture.string(SvgImg.check)
                : SvgPicture.string(SvgImg.unCheck),
          ],
        ),
      ),
    );
  }
}
