import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../error_page.dart';
import 'router_handler.dart';

class Routess {
  static String root = '/';
  static String indexPage = '/home';
  static String login = '/login';

  /*---------------------首页的页面跳转start---------------------*/

  ///出勤紀錄
  static String attendanceRecord = "/index/subpage/AttendanceRecordPage/:id";

  ///膳食
  static String diet = "/index/subpage/diet/:id";

  ///成長紀錄
  static String growUp = "/index/subpage/growUp/:id";

  ///訂單紀錄
  static String order = "/index/subpage/order/:id";

  ///學生信息
  static String information = "/index/subpage/information/:id";

  ///學生相冊
  static String studentAlbum = "/index/subpage/studentAlbum/:id";

  //訂閱服務
  static String service = "/index/subpage/service/:id";

  //家長列表
  static String parents = "/index/subpage/parents/:id";

  //補習登記
  static String signTutoria = "/signTutoria/:id";

  /*---------------------首页的页面跳转end---------------------*/
  /*---------------------课程START---------------------*/
  //課程詳情
  static String curriculumDetails = "/curriculum/details/:id";
  ///课程注册
  static String courserRegistration = "/courserRegistration/:id";
  /*---------------------课程END---------------------*/


  /*---------------------抽屉部分start----------------------------------*/
  //我的課程
  static String myCourse = 'myCourse';

  //聯繫我們
  static String contactUs = "/contactUs";

  // 聊天界面
  static String imPage = "/impage";

  //餘額
  static String balance = "/balance/:balance";

  //會員積分頁面
  static String membershippage = "/membershippage/:member";
  //設置
  static String settings = "/settings";
  /// 编辑个人信息
  static String editMemInfo = "/editmemInfo/:id";
  /// 我的课程详情
  static String myCourseDetails = "/myCourseDetails/:id";
  //聯繫我們
  //我的課程
  /*---------------------抽屉部分end----------------------------------*/

  /// 分校詳情
  static String campusNetworkDetailsPage ="/page/campusNetwork_detailsPage/:objectId";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print('ERROR====>ROUTE WAS NOT FONUND!!!'); // 找不到路由，跳转404页面
        print('找不到路由，404');
        return ErrorPage();
      },
    );

    // 路由页面配置
//    闪屏页面
    router.define(root, handler: logonStatusHandler);
//    主页面
    router.define(indexPage, handler: indexPageHanderl);
//    登录页面
    router.define(login, handler: loginHanderl);

    /*---------------------抽屉部分start----------------------------------*/
    //    餘額
  //   router.define(balance, handler: balanceHandler);
  //   //    會員積分
  //   router.define(membershippage, handler: membershippageHandler);
  //
  //   //    設置
  //   router.define(settings, handler: settingsHandler);
  //   //    聯絡我們
  //   router.define(contactUs, handler: contactUsHandler);
  //
  //   //    聊天界面
  //   router.define(imPage, handler: personalIm);
  //
  //   //  我的課程
  //   router.define(myCourse, handler: myCourseHandler);
  //
  //   // 修改个人信息
  //   router.define(editMemInfo, handler: editMemInfoHandler);
  //   /*---------------------抽屉部分end----------------------------------*/
  //
  //   /*---------------------首页的页面跳转start---------------------*/
  //
  //   /// 出勤记录
  //   router.define(attendanceRecord, handler: attendanceRecordHandler);
  //   /// 膳食
  //   router.define(diet, handler: dietHandler);
  //   /// 成長記錄
  //   router.define(growUp, handler: growUpHandler);
  //   /// 订单记录
  //   router.define(order, handler: orderHandler);
  //   /// 家長列表
  //   router.define(parents, handler: parentsHandler);
  //   /// 學生信息
  //   router.define(information, handler: informationHandler);
  //   /// 學生相冊
  //   router.define(studentAlbum, handler: studentAlbumHandler);
  //   /// 訂閱服務
  //   router.define(service, handler: serviceHandler);
  //   //    補習登記
  //   router.define(signTutoria, handler: signTutoriaHandler);
  //   /// 我的课程详情
  //   router.define(myCourseDetails, handler: myCourseDetailsHandler);
  //   /*---------------------首页面跳转end---------------------*/
  //   /*---------------------课程START---------------------*/
  //   //    課程詳情
  //   router.define(curriculumDetails, handler: curriculumDetailsHandler);
  //   router.define(courserRegistration, handler: courserRegistrationHandler);
  //   /*---------------------课程END---------------------*/
  //
  //   /*---------------------分校网络页面跳转start---------------------*/
  //   /// 分校详情
  //   router.define(campusNetworkDetailsPage, handler: campusNetworkDetailsPageHandler);
  //   /*---------------------分校网络页面跳转end---------------------*/
  }
}
