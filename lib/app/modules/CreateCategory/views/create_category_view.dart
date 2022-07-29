import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_hay/app/modules/CategoryForm/views/category_form_view.dart';
import 'package:get_hay/app/modules/categories/views/categories_view.dart';

import '../controllers/create_category_controller.dart';

class CreateCategoryView extends GetView<CreateCategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                'Categories',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      body: CategoriesView(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red[400],
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () => Get.to(() => CategoryFormView())),
    );
  }
}
