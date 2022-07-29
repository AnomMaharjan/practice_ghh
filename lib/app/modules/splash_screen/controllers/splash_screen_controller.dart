import 'package:get/get.dart';

import '../../../../injector/injector.dart';
import '../../../../storage/sharedprefences/shared_preferences_manager.dart';
import '../../home/views/home_view.dart';
import '../../login/views/login_view.dart';

class SplashScreenController extends GetxController {
  final SharedPreferencesManager _sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  final count = 0.obs;
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 2), () => routeManager());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  routeManager() {
    bool _isAlreadyLoggedIn = _sharedPreferencesManager
            .isKeyExists(SharedPreferencesManager.keyIsLogin)
        ? _sharedPreferencesManager.getBool(SharedPreferencesManager.keyIsLogin)
        : false;

    if (_isAlreadyLoggedIn) {
      return Get.off(
        () => HomeView(),
      );
    } else {
      return Get.off(
        () => LoginView(),
      );
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
