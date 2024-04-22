import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_flutter/mvvm/main/controllers/controller.dart';

import '../../../pages/home_page.dart';
import '../../../pages/my_page.dart';
import '../../../pages/search_page.dart';
import '../../../pages/travel_page.dart';

///首页底部导航器
class BottomTabView extends GetView<MainViewModel> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;

  const BottomTabView({super.key});

  @override
  Widget build(BuildContext context) {
    // 不使用GetBuilder，使用Obx监听数据变化，为了GetBuilder在热重载的时候会清除MainController
    //Restarted application in 886ms.
    // [GETX] Instance "GetMaterialController" has been created
    // [GETX] Instance "GetMaterialController" has been initialized
    // [GETX] GOING TO ROUTE /main
    // [GETX] Instance "MainController" has been created
    // [GETX] Instance "MainController" has been initialized
    // [GETX] "MainController" onDelete() called
    // [GETX] "MainController" deleted from memory
    //
    // ======== Exception caught by widgets library =======================================================
    // The following _TypeError was thrown building BottomTabView:
    // Null check operator used on a null value
    return Obx(() => Scaffold(
          body: PageView(
            controller: controller.controller,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomePage(),
              SearchPage(hideLeft: true),
              TravelPage(),
              MyPge()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            //fixedColor设置底部文字的颜色
            fixedColor: Colors.blue,
            currentIndex: controller.currentIndex.value,
            onTap: controller.onBottomNavTap,
            type: BottomNavigationBarType.fixed,
            items: [
              _bottomItem('首页', Icons.home, 0),
              _bottomItem('搜索', Icons.search, 1),
              _bottomItem('旅拍', Icons.camera_alt, 2),
              _bottomItem('我的', Icons.account_circle, 3),
            ],
          ),
        ));
  }

  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Icon(icon, color: _defaultColor),
        activeIcon: Icon(
          icon,
          color: _activeColor,
        ),
        label: title);
  }
}
