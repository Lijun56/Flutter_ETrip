import 'package:get/get.dart';
import 'package:trip_flutter/mvvm/login/bindings/login_binding.dart';
import 'package:trip_flutter/mvvm/main/binding/main_binding.dart';

///工程级别的绑定
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    MainBinding().dependencies();
    LoginBinding().dependencies();
  }
}
