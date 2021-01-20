import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.title,
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
  });

  String title;
  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;
  AnimationController animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      title: "首頁",
      imagePath: 'assets/fitness_app/home_not.png',
      selectedImagePath: 'assets/fitness_app/home_press.png',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      title: "補習",
      imagePath: 'assets/fitness_app/scholar_not.png',
      selectedImagePath: 'assets/fitness_app/scholar_press.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      title: "課程",
      imagePath: 'assets/fitness_app/course_not.png',
      selectedImagePath: 'assets/fitness_app/course_press.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      title: "分校網絡",
      imagePath: 'assets/fitness_app/network_not.png',
      selectedImagePath: 'assets/fitness_app/network_press.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
