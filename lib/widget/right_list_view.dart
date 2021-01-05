import 'dart:math';

import 'package:flutter/material.dart';
class RightListView extends StatelessWidget {
  List rightTitles = ['测试数据就是这样怎么了','这个短','这个长是不是是','我就是随便写写','是短','这个长不长也','就那样也不长','谁说的这个是最后的我就写长点儿你能拿我怎么办打不到我吧我就是这么强大'];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 10.0,top: 10.0),
      alignment: Alignment.topLeft,
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: rightTitles.map((childNode){
          return GestureDetector(
              child: Container(
                padding:  EdgeInsets.all(3.0),
                color: getRandomColor(),
                child: Text(
                  childNode,
                  style: TextStyle(
                    fontSize:14,
                    color: Colors.white,
                    shadows: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.2, 0.2)
                      )],
                  ),
                ),
              ),
          );
        }).toList(),
      ),
    );
  }
}
getRandomColor(){
  return Color.fromARGB(255, Random.secure().nextInt(255), Random.secure().nextInt(255), Random.secure().nextInt(255));
}