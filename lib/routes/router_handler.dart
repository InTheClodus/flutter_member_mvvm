import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_member_mvvm/view/bottom/fitness_app_home_screen.dart';
import 'package:flutter_member_mvvm/view/login/login.dart';

import '../logon_status.dart';

//import 'package:my_fluro_demo/pages/index_page.dart'
/* *
 * handler就是每个路由的规则，编写handler就是配置路由规则，
 * 比如我们要传递参数，参数的值是什么，这些都需要在Handler中完成。
 */

// 首页
Handler indexPageHanderl = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return FitnessAppHomeScreen();
  },
);
// 闪屏
Handler logonStatusHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return LogonStatus();
  },
);

// 登陆页面
Handler loginHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginView();
});

// //餘額
// var balanceHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   var balance = params['balance'].first;
//   return BalancePage(
//     balance: balance,
//   );
// });
//
// ///會員積分頁面
// var membershippageHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   var member = params['member'][0];
//   return MemberShipPage(
//     member: member,
//   );
// });
//
// /*---------------------首页的那几个页面跳转start---------------------*/
//
// ///学生相册
// var studentAlbumHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   var id = params["id"].first;
//   return StudentPhotoAlbumPage(
//     stuId: id,
//   );
// });
//
// ///学生信息
// var informationHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   var id = params["id"]?.first;
//   return StudentInfoPage(
//     stuId: id,
//   );
// });
//
// /// 成长记录
// var growUpHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return GrowthRecordPage();
// });
//
// /// 订阅服务
// var serviceHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   var id = params["id"]?.first;
//   return SubscriptionServicePage(
//     id: id,
//   );
// });
//
// /// 出勤记录
// var attendanceRecordHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return AttendanceRecordPage();
// });
// //// 膳食
// var dietHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   var id = params['id']?.first;
//   return DietPage(
//     objectId: id,
//   );
// });
// ////家长列表
// var parentsHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return ParentList();
// });
//
// ///d订单记录
// var orderHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   var id = params['id']?.first;
//   return OrderRecordPage(
//     stuId: id,
//   );
// });
// //  補習登記
// var signTutoriaHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   var id = params['id'];
//   return SignTutoria(
//     objectId: id,
//   );
// });
// /*---------------------首页的那几个页面跳转end---------------------*/
//
// /*---------------------抽屉部分START----------------------------------*/
//
// /// 設置頁面
// var settingsHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return SettingsPage();
// });
//
// ///客服列表
// var contactUsHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return CustomerServiceList();
// });
//
// // 聊天界面
// var personalIm = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return ImPage();
// });
//
// //我的課程
// var myCourseHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return MyCourse();
// });
//
// /// 修改个人信息
// var editMemInfoHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   var id = params["id"].first;
//   return UserEditPage(
//     objectId: id,
//   );
// });
// /// 我的课程详情
// var myCourseDetailsHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//       var id = params["id"]?.first;
//       return CourseDetailsTab(id: id,);
//     });
// /*---------------------抽屉部分END----------------------------------*/
// /*---------------------课程START----------------------------------*/
// var curriculumDetailsHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   var id = params["id"]?.first;
//   return CurriculumDetailsPage(
//     id: id,
//   );
// });
// var courserRegistrationHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   var id = params['id']?.first;
//   return CourseRegistration(objectId: id);
// });
// /*---------------------课程END----------------------------------*/
//
// /*---------------------分校网络相关START------------------------------*/
//
// /// 分校详情
// var campusNetworkDetailsPageHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   var id = params["objectId"];
//   return CampusNetworkDetailsPage(
//     objectId: id,
//   );
// });
// /*---------------------分校网络相关END-------------------------------*/
