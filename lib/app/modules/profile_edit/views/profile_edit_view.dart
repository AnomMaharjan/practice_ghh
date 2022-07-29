import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_edit_controller.dart';

class ProfileEditView extends GetView<ProfileEditController> {
  final _formKey = GlobalKey<FormState>();
  final ProfileEditController profileEditController =
      Get.put(ProfileEditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
            ),
          ),
          title: Text('Edit Profile'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: Get.height * 0.1,
                left: Get.width * 0.1,
                right: Get.width * 0.1,
                bottom: 10),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    inputFirstName(),
                    Padding(
                        padding: EdgeInsets.symmetric(
                      vertical: Get.height * 0.015,
                    )),
                    inputLastName(),
                    Padding(
                        padding: EdgeInsets.symmetric(
                      vertical: Get.height * 0.015,
                    )),
                    inputEmail(),
                    Padding(
                        padding: EdgeInsets.symmetric(
                      vertical: Get.height * 0.015,
                    )),
                    inputPhone(),
                    Padding(
                        padding: EdgeInsets.symmetric(
                      vertical: Get.height * 0.01,
                    )),
                    saveButton(),
                  ],
                )),
          ),
        ));
  }

  inputFirstName() {
    return TextFormField(
      controller: profileEditController.firstNameController,
      validator: (value) {
        if (value.isEmpty) {
          return "Field cannot be empty";
        } else
          return null;
      },
      decoration: InputDecoration(
          hintText: "First Name",
          labelStyle: TextStyle(color: Colors.grey, fontSize: 13)),
    );
  }

  inputLastName() {
    return TextFormField(
      controller: profileEditController.lastNameController,
      validator: (value) {
        if (value.isEmpty) {
          return "Field cannot be empty";
        } else
          return null;
      },
      decoration: InputDecoration(
          hintText: "Last Name",
          labelStyle: TextStyle(color: Colors.grey, fontSize: 13)),
    );
  }

  // inputUserName() {
  //   return TextFormField(
  //     controller: profileEditController.userNameController,
  //     validator: (value) {
  //       if (value.isEmpty) {
  //         return "Field cannot be empty";
  //       } else
  //         return null;
  //     },
  //     decoration: InputDecoration(
  //         hintText: "User Name",
  //         labelStyle: TextStyle(color: Colors.grey, fontSize: 13)),
  //   );
  // }

  inputEmail() {
    return TextFormField(
      controller: profileEditController.emailController,
      validator: (value) {
        if (value.isEmpty) {
          return "Field cannot be empty";
        } else if (!value.isEmail) {
          return "Invalid Email";
        } else
          return null;
      },
      decoration: InputDecoration(
          hintText: "Email",
          labelStyle: TextStyle(color: Colors.grey, fontSize: 13)),
    );
  }

  inputPhone() {
    return TextFormField(
      controller: profileEditController.phoneController,
      validator: (value) {
        if (value.isEmpty) {
          return "Field cannot be empty";
        } else if (!value.isPhoneNumber) {
          return "Invalid Phone number";
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: "Phone Number",
          labelStyle: TextStyle(color: Colors.grey, fontSize: 13)),
    );
  }

  saveButton(
      {String firstName, String lastName, String email, String phoneNumber}) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      color: Colors.red[400],
      minWidth: 100,
      onPressed: () {
        if (_formKey.currentState.validate()) {
          profileEditController.sendProfileData();
          Get.back();
        } else
          return;
      },
      child: Text(
        'Update',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
