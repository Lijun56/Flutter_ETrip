import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:trip_flutter/widget/hi_webview.dart';

import '../mvvm/routes/app_pages.dart';

class NavigatorUtil {
  ///用于在获取不到context的地方，如dao中跳转页面时使用，需要在TabNavigator赋值
  ///注意：若TabNavigator被销毁，_context将无法使用
  // static BuildContext? _context;

  // static updateContext(BuildContext context) {
  //   NavigatorUtil._context = context;
  //   print('init:$context');
  // }

  ///跳转到指定页面
  static push(BuildContext context, Widget page) {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    //使用getx跳转到下一个页面，使用GetX没有了传递context的烦恼
    Get.to(page);
  }

  ///跳转到首页
  static goToHome() {
    //跳转到主页并不让返回，当封装了导航页之后，就不需要再跳转到HomePage了
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => const TabNavigator()));
    //使用getx跳转到主页并且不让返回
    // Get.offAll(const TabNavigator());
    // 当使用getx依赖注入后，需要使用路由名称跳转，才能确保依赖注入生效，切换页面的时候不丢失controller的状态
    Get.offAllNamed(Routes.MAIN);
  }

  ///跳转到登录页
  static goToLogin() {
    //跳转到主页并不让返回
    // Navigator.pushReplacement(
    //     _context!, MaterialPageRoute(builder: (context) => const LoginPage()));
    //使用getx跳转到登录页并且不让返回
    // Get.off(const LoginPage());
    //通过路由名来跳转到登录页
    Get.offAllNamed(Routes.LOGIN);
  }

  ///返回上一页
  static pop(BuildContext context) {
    // if (Navigator.canPop(context)) {
    //   Navigator.pop(context);
    // } else {
    //   //退出APP
    //   SystemNavigator.pop();
    // }
    //使用getx返回上一页
    Get.back();
  }

  ///跳转H5页面
  static jumpH5(
      {BuildContext? context,
      String? url,
      String? title,
      bool? hideAppBar,
      String? statusBarColor}) {
    BuildContext? safeContext;
    if (url == null) {
      debugPrint('url is null jumpH5 failed.');
      return;
    }
    // if (context != null) {
    //   safeContext = context;
    // } else if (_context?.mounted ?? false) {
    //   safeContext = _context;
    // } else {
    //   debugPrint('context is null jumpH5 failed.');
    //   return;
    // }
    // Navigator.push(
    //     safeContext!,
    //     MaterialPageRoute(
    //         builder: (context) => HiWebView(
    //               url: url,
    //               title: title,
    //               hideAppBar: hideAppBar,
    //               statusBarColor: statusBarColor,
    //             )));
    //使用getx跳转到H5页面
    Get.to(HiWebView(
      url: url,
      title: title,
      hideAppBar: hideAppBar,
      statusBarColor: statusBarColor,
    ));
  }
}
