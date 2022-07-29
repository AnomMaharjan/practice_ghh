import 'package:get/get.dart';
import 'package:get_hay/api/api_auth_provider.dart';
import 'package:get_hay/api/profile.dart';
import 'package:get_hay/base%20model/base_model.dart';
import 'package:get_hay/constants/enum.dart';
import 'package:get_hay/models/profile.dart';

class ProfileController extends BaseController {
  final ApiAuthProvider _apiAuthProvider = ApiAuthProvider();
  final count = 0.obs;
  final profileAPI = ProfileAPI();
  Profile profile;

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  fetchProfile() async {
    setState(ViewState.Busy);
    profile = await _apiAuthProvider.getProfile();
    print(profile);
    setState(ViewState.Retrieved);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
