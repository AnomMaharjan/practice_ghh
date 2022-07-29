import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_hay/api/profile.dart';
import 'package:get_hay/app/modules/profile/controllers/profile_controller.dart';

class ProfileEditController extends GetxController {
  final ProfileController profileController = Get.put(ProfileController());

  final TextEditingController firstNameController = TextEditingController(
    text: Get.arguments["firstName"],
  );

  final TextEditingController lastNameController = TextEditingController(
    text: Get.arguments["lastName"],
  );

  final TextEditingController emailController = TextEditingController(
    text: Get.arguments["email"],
  );

  final TextEditingController phoneController = TextEditingController(
    text: Get.arguments["phoneNumber"],
  );

  final ProfileAPI _profileAPI = ProfileAPI();

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

  // updates profile info
  Future<void> sendProfileData() async {
    await _profileAPI.updateProfile(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      phoneNumber: phoneController.text.trim(),
    );
    print(
        " profile data: ${firstNameController.text} ${lastNameController.text} ${emailController.text} ${phoneController.text}");
    profileController.fetchProfile();
  }
}
