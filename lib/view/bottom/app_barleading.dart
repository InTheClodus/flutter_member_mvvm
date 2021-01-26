import 'package:flutter/material.dart';
//appbar個人中心圖標
class AppBarLeading extends StatefulWidget {
  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<AppBarLeading> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            child: Builder(
              builder: (context) {
                return Container(
                  child: IconButton(
                      icon: Image.asset(
                        'assets/images/personal_center.png',
                        color: Colors.white,
                        height: 18,
                        width: 18,
                      ),
                      onPressed: () {
                        //打開左拉個人中心
                        Scaffold.of(context).openDrawer();
                      }),
                );
              },
            )),
      ],
    );
  }
}