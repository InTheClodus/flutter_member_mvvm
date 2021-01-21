import 'package:flutter/material.dart';

class IndexSchoolNetWork extends StatefulWidget {
  final AnimationController animationController;

  const IndexSchoolNetWork({Key key, this.animationController}) : super(key: key);
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexSchoolNetWork> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}