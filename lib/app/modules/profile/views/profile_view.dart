import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_hay/app/modules/map_picker/views/map_picker_view.dart';
import 'package:get_hay/app/routes/app_pages.dart';
import 'package:get_hay/constants/enum.dart';
import 'package:map_pin_picker/map_pin_picker.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final ProfileController profileController = Get.put(ProfileController());

  MapPickerController mapPickerController = MapPickerController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => profileController.state == ViewState.Busy
            ? _buildLoadingWidget()
            : _buildSuccessWidget()),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(child: SpinKitCircle(color: Colors.red));
  }

  Widget _buildSuccessWidget() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: Get.width,
                height: Get.height * 0.30,
                decoration: BoxDecoration(
                  color: Colors.red[400],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 4, child: SizedBox()),
                        Expanded(
                          flex: 2,
                          child: Text(
                            profileController.profile.firstName == null
                                ? " "
                                : profileController.profile.firstName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.2),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Text(
                                profileController.profile.lastName == null
                                    ? ""
                                    : profileController.profile.lastName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 1.2)))
                      ]),
                ),
              ),
              Container(
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    top: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileTitle(
                        title: "Username",
                        subtitle: profileController.profile.userName == ''
                            ? 'Not Provided'
                            : profileController.profile.userName,
                        icon: Icons.person,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ProfileTitle(
                        title: "Email",
                        subtitle: profileController.profile.email == ''
                            ? 'Not Provided'
                            : profileController.profile.email,
                        icon: Icons.mail,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ProfileTitle(
                        title: "Phone Number",
                        subtitle: profileController.profile.phone == ''
                            ? "Not Provided"
                            : profileController.profile.phone,
                        icon: Icons.phone,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: Get.width * 0.8,
                        child: Divider(),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      MaterialButton(
                        elevation: 0,
                        minWidth: Get.width * 0.5,
                        onPressed: () {
                          Get.to(
                            () => MapPickerView(
                              latitude: profileController.profile.latitude,
                              longitude: profileController.profile.longitude,
                            ),
                            arguments: {
                              "from": "profile",
                            },
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        color: Colors.red,
                        child: const Text(
                          "Update Location",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ProfileTitle(
                        title: "Latitude",
                        subtitle: profileController.profile.latitude.toString(),
                        icon: Icons.location_on,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ProfileTitle(
                        title: "Longitude",
                        subtitle:
                            profileController.profile.longitude.toString(),
                        icon: Icons.location_on,
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: Get.width * 0.72,
            top: Get.height * 0.25,
            child: SizedBox(
                height: 60,
                width: 60,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      Routes.PROFILE_EDIT,
                      arguments: {
                        "firstName": profileController.profile.firstName,
                        "lastName": profileController.profile.lastName,
                        "email": profileController.profile.email,
                        "phoneNumber": profileController.profile.phone,
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          offset: Offset(0, 1),
                          spreadRadius: 1,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.edit,
                      size: 30,
                      color: Colors.red[400],
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class ProfileTitle extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  const ProfileTitle({
    Key key,
    @required this.title,
    this.subtitle,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              color: Colors.blue.withOpacity(0.7),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 4,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class OpenPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    //draw arc
    canvas.drawArc(
        Offset(Get.width * 0.73, Get.height * 0.3) & Size(75, 75),
        3.1415, //radians
        3.1415, //radians
        false,
        paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class OpenPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    //draw arc
    canvas.drawArc(
        Offset(Get.width * 0.71, Get.height * 0.29) & Size(90, 90),
        3.1415, //radians
        3.1415, //radians
        false,
        paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
