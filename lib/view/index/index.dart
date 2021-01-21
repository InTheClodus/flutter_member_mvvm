import 'package:flutter/material.dart';

// 首页
class IndexPage extends StatefulWidget {
  final AnimationController animationController;

  const IndexPage({Key key, this.animationController}) : super(key: key);
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
    );
  }
}
