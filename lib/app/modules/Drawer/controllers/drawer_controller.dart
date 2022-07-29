import 'package:get/get.dart';
import 'package:get_hay/app/modules/profile/controllers/profile_controller.dart';

class DrawerController extends GetxController {
  final ProfileController profileController = Get.put(ProfileController());
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    profileController.fetchProfile();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
