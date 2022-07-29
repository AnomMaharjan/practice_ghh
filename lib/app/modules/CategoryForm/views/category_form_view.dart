import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_hay/app/modules/MyProducts/views/my_products_view.dart';

import '../controllers/category_form_controller.dart';

class CategoryFormView extends GetView<CategoryFormController> {
  final CategoryFormController categoryFormController =
      Get.put(CategoryFormController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Category Form'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name:',
                style: TextStyle(fontSize: 20),
              ),
              gap(10, 0),
              inputName(),
              gap(30, 0),
              saveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputName() {
    return TextFormField(
        controller: categoryFormController.newCategoryAddress,
        decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey),
            hintText: 'Category Name',
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.black)),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.black))),
        validator: (value) {
          if (value.isEmpty) {
            return "Name cannot be empty";
          } else
            return null;
        });
  }

  Widget saveButton() {
    return Center(
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 12),
        minWidth: Get.width,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        color: Colors.red[700],
        onPressed: () {
          if (_formKey.currentState.validate()) {
            categoryFormController.addCategoryButtonPress();
          } else
            return;
        },
        child: Text(
          'Save',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
