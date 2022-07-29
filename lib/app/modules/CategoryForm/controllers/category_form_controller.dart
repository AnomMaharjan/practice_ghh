import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_hay/api/api_auth_provider.dart';
import 'package:get_hay/app/modules/categories/controllers/categories_controller.dart';
import 'package:get_hay/base%20model/base_model.dart';
import 'package:get_hay/constants/enum.dart';
import 'package:get_hay/models/addCategory.dart';

class CategoryFormController extends BaseController {
  final CategoriesController categoriesController =
      Get.put(CategoriesController());
  final apiAuthProvider = ApiAuthProvider();
  var addcategory = List<AddCategory>().obs;
  AddCategory addCategoryResponse;

  final TextEditingController newCategoryAddress = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<AddCategory> addNewCategoryAddress(Map name) async {
    setState(ViewState.Busy);
    addCategoryResponse = await apiAuthProvider.addNewAddCategory(name);
    print("Category ${addCategoryResponse.name}");
    setState(ViewState.Retrieved);
    return addCategoryResponse;
  }

  void addCategoryButtonPress() {
    Map categoryMap = {
      "name": newCategoryAddress.text.trim(),
    };

    addNewCategoryAddress(categoryMap).then((AddCategory value) {
      print(addCategoryResponse);
      if (addCategoryResponse != null) {
        addcategory.add(addCategoryResponse);
        print("codes");
        categoriesController.fetchCategories();
        Get.back();
        newCategoryAddress.clear();
        Fluttertoast.showToast(
            msg: 'Successfully added category!',
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.white,
            backgroundColor: Colors.red[400],
            gravity: ToastGravity.TOP);
      }
    });
  }

  @override
  void onClose() {}
}
