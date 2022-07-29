import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_hay/app/modules/login/controllers/login_controller.dart';
import 'package:get_hay/app/modules/profile/controllers/profile_controller.dart';
import 'package:get_hay/app/routes/app_pages.dart';
import 'package:get_hay/constants/enum.dart';
import 'package:get_hay/widget/wave_clipper.dart';

class LoginView extends GetView<LoginController> {
  final LoginController loginController = Get.put(LoginController());
  final ProfileController profileController = Get.put(ProfileController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: ListView(
          children: [
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: Get.size.height / 3,
                child: Image.asset(
                  "assest/login_page_image.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          inputUserName(),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                  ),
                                ],
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              width: Get.size.width * 0.18,
                              height: Get.size.width * 0.18,
                              child: Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.red[800],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          inputPassword(),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                  ),
                                ],
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              width: Get.size.width * 0.18,
                              height: Get.size.width * 0.18,
                              child: Icon(
                                Icons.lock,
                                size: 40,
                                color: Colors.red[800],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            loginButton(),
            SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Center(
            //     child: Text(
            //       "----------------   Or Sign in with   ----------------",
            //       style: TextStyle(fontWeight: FontWeight.bold),
            //     ),
            //   ),
            // ),
            // // Center(
            // //   child: Image.asset("assest/googleicons.png"),
            // // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("I don't have an account.",
                    style: TextStyle(fontSize: 15)),
                MaterialButton(
                  elevation: 0,
                  child: Text(
                    "Sign up here",
                    style: TextStyle(color: Colors.red[800], fontSize: 15),
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.SIGN_UP);
                  },
                )
              ],
            )
          ],
        )),
      ),
    );
  }

  Widget inputUserName() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 5,
            ),
          ],
        ),
        height: 50,
        width: Get.size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 100.0),
          child: TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Username cannot be empty';
              } else
                return null;
            },
            controller: loginController.controllerUserName,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.lightBlueAccent,
              hintText: 'Username',
              labelStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget inputPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 5,
            ),
          ],
        ),
        height: 50,
        width: Get.size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 100.0),
          child: TextFormField(
            controller: loginController.controllerPassword,
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Password cannot be empty';
              } else
                return null;
            },
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.lightBlueAccent,
              hintText: 'Password',
              labelStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding loginButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 100, left: 100),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 50,
        width: Get.size.width / 2,
        decoration: BoxDecoration(
          color: Colors.red[800],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Obx(
          () => MaterialButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            minWidth: Get.size.width,
            onPressed: controller.state == ViewState.Busy
                ? () {}
                : () {
                    if (_formKey.currentState.validate()) {
                      Map loginBody = {
                        "username":
                            loginController.controllerUserName.text.trim(),
                        "password":
                            loginController.controllerPassword.text.trim()
                      };

                      loginController.login(loginBody);
                    }
                  },
            child: Center(
              child: Obx(
                () => controller.state == ViewState.Busy
                    ? SpinKitCircle(
                        color: Colors.red[400],
                      )
                    : Text(
                        'SIGN IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
