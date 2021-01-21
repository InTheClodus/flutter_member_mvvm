import 'package:flutter/material.dart';

/// 补习
class IndexScholar extends StatefulWidget {
  final AnimationController animationController;

  const IndexScholar({Key key, this.animationController}) : super(key: key);
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexScholar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
    );
  }
}
