import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_hay/config.dart';
import 'package:get_hay/constants/enum.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_pin_picker/map_pin_picker.dart';

import '../controllers/map_picker_controller.dart';

class MapPickerView extends GetView<MapController> {
  final MapController mapController = Get.put(MapController());

  CameraPosition cameraPosition;

  final double latitude, longitude;

  MapPickerView({
    this.latitude,
    this.longitude,
  }) {
    print("Location Latitude $latitude $longitude");
    cameraPosition = CameraPosition(
      target: LatLng(this.latitude ?? DEFAULT_LATITUDE,
          this.longitude ?? DEFAULT_LONGITUDE),
      zoom: 16.4746,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: mapController.from == "login" ? null : BackButton(),
        iconTheme: const IconThemeData(
          color: Colors.red,
        ),
        centerTitle: true,
        title: const Text(
          "Choose your Location",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              !mapController.isLocationRequested.value
                  ? SizedBox(
                      height: Get.height * 0.7,
                    )
                  : MapPicker(
                      mapPickerController: mapController.mapPickerController,
                      iconWidget: Padding(
                        padding: const EdgeInsets.only(top: 238.0),
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 46,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        height: Get.height * 0.7,
                        width: Get.width,
                        child: GoogleMap(
                          mapToolbarEnabled: true,
                          buildingsEnabled: true,
                          initialCameraPosition: cameraPosition,
                          myLocationEnabled: true,
                          zoomControlsEnabled: false,
                          mapType: MapType.normal,
                          onMapCreated: (GoogleMapController controller) {
                            mapController.controller.complete(controller);
                          },
                          onCameraMove: (cameraPosition) {
                            this.cameraPosition = cameraPosition;
                          },
                          onCameraIdle: () async {
                            // notify map stopped moving
                            mapController.mapPickerController
                                .mapFinishedMoving();
                            mapController.textEditingController.text =
                                "Latitude: ${cameraPosition.target.latitude}\nLongitude: ${cameraPosition.target.longitude} ";
                          },
                          onCameraMoveStarted: () {
                            // notify map is moving
                            mapController.mapPickerController.mapMoving();
                            mapController.textEditingController.text =
                                "checking ...";
                          },
                        ),
                      ),
                    ),
              Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 10),
                        height: 32,
                        width: 32,
                        color: Colors.blue,
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: TextField(
                        maxLines: 2,
                        readOnly: true,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none),
                        controller: mapController.textEditingController,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: MaterialButton(
                  onPressed: mapController.state == ViewState.Busy
                      ? null
                      : () async {
                          print("location to send $latitude");
                          mapController.onSubmit(
                            latitude: cameraPosition.target.latitude,
                            longtiude: cameraPosition.target.longitude,
                          );

                          // print(
                          //     "Location Latitude ${cameraPosition.target.latitude} Longitude ${cameraPosition.target.longitude}");
                          // print("Address: ${mapController.textEditingController.text}");
                        },
                  minWidth: Get.width,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: mapController.state == ViewState.Busy
                      ? CircularProgressIndicator()
                      : const Text(
                          "Submit",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
