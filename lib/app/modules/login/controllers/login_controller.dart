import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_hay/app/modules/home/views/home_view.dart';
import 'package:get_hay/app/modules/profile/controllers/profile_controller.dart';
import 'package:get_hay/base%20model/base_model.dart';
import 'package:get_hay/constants/enum.dart';
import 'package:get_hay/models/login.dart';

import '../../../../api/api_auth_provider.dart';
import '../../../../injector/injector.dart';
import '../../../../storage/sharedprefences/shared_preferences_manager.dart';

class LoginController extends BaseController {
  final ApiAuthProvider _apiAuthProvider = ApiAuthProvider();
  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();
  final TextEditingController controllerUserName = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void login(Map loginBody) async {
    setState(ViewState.Busy);
    Login login = await _apiAuthProvider.loginUser(loginBody);
    // print("chalyo ki chalena ${login}");
    if (login == null) {
      // print("${token.error}");
      Get.snackbar(
          "An error occured", "Check your credentials or internet connection",
          colorText: Colors.white, backgroundColor: Colors.red[900]);
      setState(ViewState.Retrieved);
    } else {
      await sharedPreferencesManager.putString(
          SharedPreferencesManager.keyAccessToken, login.token);

      await sharedPreferencesManager.putBool(
          SharedPreferencesManager.keyIsLogin, true);
      await sharedPreferencesManager.putString(
          SharedPreferencesManager.keyUsername, login.username);
      setState(ViewState.Retrieved);

      Get.off(
        () => HomeView(),
      );
    }
  }
}
