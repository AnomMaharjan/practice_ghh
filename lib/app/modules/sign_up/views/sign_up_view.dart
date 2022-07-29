import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_hay/app/modules/map_picker/views/map_picker_view.dart';
import 'package:get_hay/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:get_hay/app/routes/app_pages.dart';
import 'package:get_hay/widget/wave_clipper.dart';

class SignUpView extends GetView<SignUpController> {
  final _formKey = GlobalKey<FormState>();
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          body: Center(
            child: ListView(
              children: [
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    height: Get.size.height / 2.5,
                    child: Image.asset(
                      "assest/sign_up_image.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Center(
                          child: Stack(
                            children: <Widget>[
                              inputFirstName(),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 8.0,
                                ),
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
                                  width: Get.size.width * 0.17,
                                  height: Get.size.width * 0.17,
                                  child: Icon(
                                    Icons.person,
                                    size: 35,
                                    color: Colors.red[800],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Center(
                          child: Stack(
                            children: <Widget>[
                              inputLastName(),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 8.0,
                                ),
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
                                  width: Get.size.width * 0.17,
                                  height: Get.size.width * 0.17,
                                  child: Icon(
                                    Icons.person,
                                    size: 35,
                                    color: Colors.red[800],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Center(
                          child: Stack(
                            children: <Widget>[
                              inputUserName(),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
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
                                  width: Get.size.width * 0.17,
                                  height: Get.size.width * 0.17,
                                  child: Icon(
                                    Icons.person,
                                    size: 35,
                                    color: Colors.red[800],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Center(
                          child: Stack(
                            children: <Widget>[
                              inputPhoneNumber(),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
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
                                  width: Get.size.width * 0.17,
                                  height: Get.size.width * 0.17,
                                  child: Icon(
                                    Icons.phone,
                                    size: 35,
                                    color: Colors.red[800],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Center(
                          child: Stack(
                            children: <Widget>[
                              inputPassword(),
                              Padding(
                                  padding: EdgeInsets.only(left: 8.0),
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
                                    width: Get.size.width * 0.17,
                                    height: Get.size.width * 0.17,
                                    child: Icon(
                                      Icons.lock,
                                      size: 35,
                                      color: Colors.red[800],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Stack(
                          children: <Widget>[
                            inputConfirmPassword(),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
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
                                width: Get.size.width * 0.17,
                                height: Get.size.width * 0.17,
                                child: Icon(
                                  Icons.lock,
                                  size: 35,
                                  color: Colors.red[800],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                signUpButton(),
                // Padding(
                //   padding: EdgeInsets.all(4.0),
                //   child: Center(
                //     child: Text(
                //       "----------------   Or Sign in with   ----------------",
                //       style: TextStyle(fontWeight: FontWeight.bold),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 50,
                //   child: Center(
                //     child: Image.asset("assest/googleicons.png"),
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 15),
                      ),
                      MaterialButton(
                        elevation: 0,
                        child: Text(
                          "Sign in here",
                          style:
                              TextStyle(color: Colors.red[800], fontSize: 15),
                        ),
                        onPressed: () {
                          Get.offNamed(Routes.LOGIN);
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  inputLocation({String hintText}) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 5,
            ),
          ],
        ),
        height: Get.size.height * 0.075,
        width: Get.size.width - 50,
        child: Padding(
          padding: EdgeInsets.only(left: 100.0),
          child: TextFormField(
            autofocus: false,
            readOnly: true,
            onTap: () {
              Get.to(
                () => MapPickerView(),
              );
            },
            validator: (value) {
              if (value.isEmpty) {
                return '$hintText name cannot be empty';
              } else
                return null;
            },
            controller: SignUpController.controllerFirstName,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.lightBlueAccent,
              hintText: hintText,
              labelStyle: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }

  inputFirstName() {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 5,
            ),
          ],
        ),
        height: Get.size.height * 0.075,
        width: Get.size.width - 50,
        child: Padding(
          padding: EdgeInsets.only(left: 100.0),
          child: TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'First name cannot be empty';
              } else
                return null;
            },
            controller: SignUpController.controllerFirstName,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.lightBlueAccent,
              hintText: 'First Name',
              labelStyle: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }

  inputLastName() {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 5,
            ),
          ],
        ),
        height: Get.size.height * 0.075,
        width: Get.size.width - 50,
        child: Padding(
          padding: EdgeInsets.only(left: 100.0),
          child: TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Last name cannot be empty';
              } else
                return null;
            },
            controller: SignUpController.controllerLastName,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.lightBlueAccent,
              hintText: 'Last Name',
              labelStyle: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }

  inputUserName() {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 5,
            ),
          ],
        ),
        height: Get.size.height * 0.075,
        width: Get.size.width - 50,
        child: Padding(
          padding: EdgeInsets.only(left: 100.0),
          child: TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Username cannot be empty';
              } else
                return null;
            },
            controller: SignUpController.controllerUserName,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.lightBlueAccent,
              hintText: 'Username',
              labelStyle: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }

  inputPhoneNumber() {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 5,
            ),
          ],
        ),
        height: Get.size.height * 0.075,
        width: Get.size.width - 50,
        child: Padding(
          padding: EdgeInsets.only(left: 100.0),
          child: TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Phone number cannot be empty';
              } else if (!value.isPhoneNumber) {
                return 'Invalid phone number';
              }
              return null;
            },
            controller: SignUpController.controllerPhoneNumber,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.lightBlueAccent,
              hintText: 'Phone Number',
              labelStyle: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }

  inputPassword() {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
      ),
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
        height: Get.size.height * 0.075,
        width: Get.size.width - 50,
        child: Padding(
          padding: EdgeInsets.only(left: 100.0),
          child: TextFormField(
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Password cannot be empty';
              } else
                return null;
            },
            controller: SignUpController.controllerPassword,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.lightBlueAccent,
              hintText: 'Password',
              labelStyle: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }

  inputConfirmPassword() {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
      ),
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
        height: Get.size.height * 0.075,
        width: Get.size.width - 50,
        child: Padding(
          padding: EdgeInsets.only(left: 100.0),
          child: TextFormField(
            obscureText: true,
            controller: SignUpController.controllerConfirmPassword,
            validator: (value) {
              if (value != SignUpController.controllerPassword.text) {
                return 'Password does not match';
              } else if (value.isEmpty) {
                return 'Password cannnot be empty!';
              } else
                return null;
            },
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.lightBlueAccent,
              hintText: 'Re-Enter Password',
              labelStyle: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }

  Padding signUpButton() {
    return Padding(
      padding: EdgeInsets.only(top: 20, right: 100, left: 100),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 50,
        width: Get.size.width / 1,
        decoration: BoxDecoration(
          color: Colors.red[800],
          borderRadius: BorderRadius.circular(30),
        ),
        child: MaterialButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          minWidth: Get.size.width,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              Map registerBody = {
                "first_name": SignUpController.controllerFirstName.text.trim(),
                "last_name": SignUpController.controllerLastName.text.trim(),
                "username": SignUpController.controllerUserName.text.trim(),
                "phone": SignUpController.controllerPhoneNumber.text.trim(),
                "password": SignUpController.controllerPassword.text.trim(),
                "confirm_password":
                    SignUpController.controllerConfirmPassword.text.trim(),
              };
              signUpController.register(registerBody);
            } else
              return;
          },
          child: Center(
            child: Text(
              'SIGN UP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
