import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_hay/api/api_auth_provider.dart';

class SignUpController extends GetxController {
  static TextEditingController controllerFirstName = TextEditingController();
  static TextEditingController controllerLastName = TextEditingController();
  static TextEditingController controllerUserName = TextEditingController();
  static TextEditingController controllerPhoneNumber = TextEditingController();
  static TextEditingController controllerPassword = TextEditingController();
  static TextEditingController controllerConfirmPassword =
      TextEditingController();
  final ApiAuthProvider _apiAuthProvider = ApiAuthProvider();

  var passwordVisible = false;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    controllerFirstName.clear();
    controllerLastName.clear();
    controllerUserName.clear();
    controllerPhoneNumber.clear();
    controllerPassword.clear();
    controllerConfirmPassword.clear();
  }

  void register(Map registerBody) async {
    await _apiAuthProvider.registerUser(registerBody);
    if (register == null) {
      // print("${token.error}");
      Get.snackbar(
          "An error occurred", "Check your credentials or internet connection");
    } else {
      Get.back();
      // Get.off(() => MapPickerView());
      Get.snackbar("You are registered successfully", "");
    }
  }
}
