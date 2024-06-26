import 'package:flutter/material.dart';
import 'package:flutter_hi_cache/flutter_hi_cache.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';

import '../../../dao/login_dao.dart';
import '../../../util/screen_adapter_helper.dart';
import '../../login/views/login_page.dart';
import 'bottom_tab_view.dart';

///主页
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: _doInit(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        ScreenHelper.init(context); //初始化屏幕适配工具
        if (snapshot.connectionState == ConnectionState.done) {
          if (LoginDao.getBoardingPass() == null) {
            return const LoginPage();
          } else {
            return const BottomTabView();
          }
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Future<void> _doInit() async {
    await HiCache.preInit(); //预初始化缓存工具
    //关闭启动屏
    Future.delayed(const Duration(milliseconds: 500), () {
      FlutterSplashScreen.hide();
    });
  }
}
