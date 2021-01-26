import 'package:flutter/material.dart';

import 'WeTheme.dart';


class WeSwitch extends StatefulWidget {
  // 颜色
  final Color color;
  // 大小
  final double size;
  // 选中状态
  final bool checked;
  // 禁用状态
  final bool disabled;
  // 点击变化的回调函
  final Function(bool checked) onChange;
  // 選中後原點的顏色
  final Color selColor;
  // 未選中的顏色
  final Color unSelCor;

  WeSwitch({
    this.color,
    this.size = 28.0,
    this.checked,
    this.disabled = false,
    this.onChange,
    @required this.selColor,
    @required this.unSelCor,
  });

  @override
  WeSwitchState createState() => WeSwitchState();
}

class WeSwitchState extends State<WeSwitch> with TickerProviderStateMixin {
  double _width;
  double _height;
  Color color;
  bool _open = false;

  // 动画
  AnimationController controller;
  Animation moveAnimation;
  Animation colorAnimation;

  @override
  void initState() {
    super.initState();
    _width = widget.size * 2;
    _height = widget.size + 2;
    _open = widget.checked == null ? false : widget.checked;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    color = widget.color == null ? WeUi.getTheme(context).primaryColor : widget.color;
    // 初始化动画
    initAnimate();
  }

  void initAnimate() {
    // 初始化动画
    controller = AnimationController(
        duration: Duration(milliseconds: 200),
        vsync: this
    );
    // move
    moveAnimation = Tween<double>(begin: 0.0, end: widget.size - 2)
        .animate(
        CurvedAnimation(
            parent: controller,
            curve: Curves.easeIn
        )
    )
      ..addListener(() {
        setState(() {});
      });
    // color
    colorAnimation = ColorTween(begin: Colors.white, end: color)
        .animate(
        CurvedAnimation(
            parent: controller,
            curve: Curves.linear
        )
    );
    // 默认选中状态
    if (_open) controller.forward();
  }

  void click() {
    final bool state = !_open;
    // 判断是否禁用
    if (widget.disabled) return;
    // checked为bool时候表示是受控组件
    if (widget.checked == null) {
      _open = state;
      toggleChecked();
    }
    // onChange
    if (widget.onChange is Function) widget.onChange(state);
  }

  void toggleChecked() {
    if (_open) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  void didUpdateWidget(WeSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.checked != oldWidget.checked) {
      _open = widget.checked;
      toggleChecked();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: _width,
        height: _height,
        child: Opacity(
            opacity: widget.disabled ? 0.6 : 1,
            child: GestureDetector(
                onTap: click,
                child: DecoratedBox(
                    decoration: BoxDecoration(
//                        border: Border.all(width: 1.5, color: Color(0xff8890A6)),
                        color: Color(0xffF0F0F0),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffe4e4e4),
                          blurRadius: 2, //阴影范围
                          spreadRadius: 2, //阴影浓度
                        ),
                      ]
                    ),
                    child: Stack(
                        children: [
                          // icon
                          Positioned(
                              top: 1.0,
                              left: 1.0,
                              child: Transform.translate(
                                  offset: Offset(moveAnimation.value, 0.0),
                                  child: Container(
                                    padding: EdgeInsets.all(3),
                                      width: widget.size,
                                      height: widget.size,
                                      child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: _open==true?widget.selColor:widget.unSelCor,
                                              borderRadius: BorderRadius.all(Radius.circular(widget.size)),
                                          )
                                      )
                                  )
                              )
                          )
                        ]
                    )
                )
            )
        )
    );
  }
}