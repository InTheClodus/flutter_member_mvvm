import 'package:flutter/material.dart';

class IndexCourse extends StatefulWidget {
  final AnimationController animationController;

  const IndexCourse({Key key, this.animationController}) : super(key: key);
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexCourse> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}