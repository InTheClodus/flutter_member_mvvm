import 'package:flutter/material.dart';
import 'package:flutter_member_mvvm/theme/fintness_app_theme.dart';
import 'package:flutter_member_mvvm/view/course/index.dart';
import 'package:flutter_member_mvvm/view/index/index.dart';
import 'package:flutter_member_mvvm/view/models/tabIcon_data.dart';
import 'package:flutter_member_mvvm/view/scholar/index.dart';
import 'package:flutter_member_mvvm/view/school_network/index.dart';
import 'app_barleading.dart';
import 'bottom_bar_view.dart';

class FitnessAppHomeScreen extends StatefulWidget {
  @override
  _FitnessAppHomeScreenState createState() => _FitnessAppHomeScreenState();
}

class _FitnessAppHomeScreenState extends State<FitnessAppHomeScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: FitnessAppTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = IndexPage(animationController: animationController);
    super.initState();
  }

  num backcolor = 0Xff2D7FC7;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(backcolor),
          elevation: 0, //取消頂部陰影
          leading: AppBarLeading(), //個人中心
          // actions: <Widget>[StudentStates()], //接送狀態
        ),
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              backcolor = 0Xff2D7FC7;
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = IndexPage(animationController: animationController);
                });
              });
            } else if (index == 1) {
              backcolor = 0Xff9eba31;
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      IndexScholar(animationController: animationController);
                });
              });
            } else if (index == 2) {
              backcolor = 0Xffffc128;
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      IndexCourse(animationController: animationController);
                });
              });
            } else if (index == 3) {
              backcolor = 0Xff154471;
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = IndexSchoolNetWork(
                      animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}
