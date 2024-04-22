import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dao/travel_dao.dart';
import '../model/travel_category_model.dart';

class TravelController extends GetxController with GetTickerProviderStateMixin {
  List<TravelTab> tabs = [];

  // TravelCategoryModel? travelTabModel;
  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: 0, vsync: this);
    TravelDao.getCategory().then((TravelCategoryModel? model) {
      //TabBar空白的问题
      controller = TabController(length: model?.tabs.length ?? 0, vsync: this);
      tabs = model?.tabs ?? [];
      // travelTabModel = model;
      update();
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  @override
  void onClose() {
    super.onClose();
    /**
     * 将 TabController 放在 onInit 方法中进行创建，然后在 onClose 方法中进行释放资源和销毁控制器是一种合适的做法，可以更好地管理控制器的生命周期和资源；
     * 因为onInit和onClose是成对出现的，所以在onClose方法中释放资源和销毁控制器是非常合适的。
     */
    controller.dispose();
  }
}
