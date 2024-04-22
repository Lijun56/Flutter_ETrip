import 'package:get/get.dart';

import '../login/bindings/login_binding.dart';
import '../login/views/login_page.dart';
import '../main/binding/main_binding.dart';
import '../main/views/main_page.dart';

part 'app_routes.dart';

/// 定义路由页面
class AppPages {
  AppPages._();

  static const init = Routes.MAIN;
  static final routes = [
    GetPage(
      name: Routes.MAIN,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
