import 'package:flutter/material.dart';
import 'package:get/get.dart';

///TabNavigator的ViewModel
class MainViewModel extends GetxController {
  final currentIndex = 0.obs;
  final PageController controller = PageController(initialPage: 0);

  ///页面切换监听
  void onBottomNavTap(int index) {
    currentIndex(index);
    controller.jumpToPage(index);
  }
}
