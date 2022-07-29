import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:location/location.dart';

mixin LocationAccessMixin {
  Location location = Location();
  PermissionStatus permissionStatus = PermissionStatus.granted;
  RxBool isLocationRequested = false.obs;
  LocationData locationData;

  askCurrentLocation() async {
    print("permission fetching current loaction ");
    //
    // REQUEST PERMISSION FOR LOCATION
    permissionStatus = await location.hasPermission();
    print("permission permissionStatus $permissionStatus");
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      print("permission permissionStatus $permissionStatus");
      if (permissionStatus != PermissionStatus.granted) {
        isLocationRequested.value = true;
        return;
      }
    }

    //
    // ENABLE LOCATION
    bool serviceEnabled = await location.serviceEnabled();
    print("permission $serviceEnabled");
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        permissionStatus = PermissionStatus.denied;
        isLocationRequested.value = true;

        print("permission $permissionStatus");
        return;
      }
    }

    print("permission success $permissionStatus");
    isLocationRequested.value = true;
    isLocationRequested.refresh();
    print("permission isLocationRequested$isLocationRequested");
    location.getLocation().then((value) {
      print('Location on getLocation: $value');
      locationData = value;
    });
  }

  /*
  NOTE: DO NOT DELETE
  -------------------
  CURRENTLY NOT USED
  SAVED FOR FUTURE USE
  
  void loadLocation() {
    new Future.delayed(const Duration(seconds: 2), () {
      if (locationData != null) return;

      // deleayed code here
      print('permission delayed execution');
      location.getLocation().then((value) {
        locationData = value;
        print('permission loadLocation method === $value');
      });
    });
  }

  */

  Future<LocationData> getLocation() async {
    print('Location $locationData');
    if (locationData != null) {
      locationData = await location.getLocation();
    }
    return locationData;
  }

}
