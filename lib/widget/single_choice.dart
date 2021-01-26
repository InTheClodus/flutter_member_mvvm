import 'package:flutter/material.dart';
import 'package:flutter_member_mvvm/theme/font_theme.dart';

//// 单选框
typedef Type = void Function(String type);

class SingleChoice extends StatefulWidget {
  final Type type;
  final List formList;

  const SingleChoice({Key key, this.type, this.formList}) : super(key: key);

  @override
  _SingleChoiceState createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: widget.formList.map((e) => listitems(context, e)).toList(),
      ),
    );
  }

  Widget listitems(context, value) {
    var divider = Divider(
      color: Color.fromRGBO(189, 192, 200, 60),
      height: 0.5,
    );
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8,left: 20,right: 20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              updateGroupValue(value['type']);
            },
            child: Row(
              children: [
                Text(
                  value['title'],
                  style: groupValue == value["type"]
                      ? FontTheme().lightGreenText
                      : FontTheme().darkGrayText,
                ),
                groupValue == value["type"]
                    ? Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Image(image: AssetImage("images/tick.png"),height: 25,width: 25,),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          SizedBox(height: 5,),
          divider
        ],
      ),
    );
  }

  void updateGroupValue(int v) {
    setState(() {
      groupValue = v;
    });
  }
}
