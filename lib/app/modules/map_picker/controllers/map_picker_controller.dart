import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_hay/api/location.dart';
import 'package:get_hay/app/modules/home/views/home_view.dart';
import 'package:get_hay/app/modules/profile/controllers/profile_controller.dart';
import 'package:get_hay/base%20model/base_model.dart';
import 'package:get_hay/constants/enum.dart';
import 'package:get_hay/injector/injector.dart';
import 'package:get_hay/mixins/location_access.dart';
import 'package:get_hay/storage/sharedprefences/shared_preferences_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_pin_picker/map_pin_picker.dart';

class MapController extends BaseController with LocationAccessMixin {
  final ProfileController _profileController = Get.put(ProfileController());
  final _loactionApi = LocationAPI();

  String from = Get.arguments["from"];
  MapPickerController mapPickerController = MapPickerController();
  final controller = Completer<GoogleMapController>();
  final TextEditingController textEditingController = TextEditingController();
  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();



  Future<void> onSubmit({double latitude, double longtiude}) async {
    setState(ViewState.Busy);

    await sendLocation(latitude: latitude, longitude: longtiude);

    from == "login"
        ? Get.offAll(
            () => HomeView(),
          )
        : Get.back();
    setState(ViewState.Retrieved);
  }

//updates location in profile view
  Future<void> sendLocation({double latitude, double longitude}) async {
    print("latitude $latitude , longitude $longitude");
    var result = await _loactionApi.location(
      latitude: latitude,
      longitude: longitude,
    );
    _profileController.fetchProfile();
    print("received location $result ");
  }

  @override
  void onInit() {
    this.askCurrentLocation();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
