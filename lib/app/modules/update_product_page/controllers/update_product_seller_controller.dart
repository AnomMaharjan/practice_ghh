import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:get_hay/api/api_auth_provider.dart';
import 'package:get_hay/app/modules/MyProducts/controllers/my_products_controller.dart';
import 'package:get_hay/base%20model/base_model.dart';
import 'package:get_hay/constants/enum.dart';
import 'package:get_hay/models/categories.dart';
import 'package:get_hay/models/myProductionCut.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../../../../models/Species.dart';

class UpdateProductController extends BaseController {
  final apiAuthProvider = ApiAuthProvider();
  final TextEditingController productNameController =
      TextEditingController(text: Get.arguments.name);
  final TextEditingController descriptionController =
      TextEditingController(text: Get.arguments.description);
  final TextEditingController deliveryChargeController =
      TextEditingController(text: Get.arguments.deliveryCharge.toString());
  final TextEditingController sellingPriceController =
      TextEditingController(text: Get.arguments.sellingPrice.toString());
  final TextEditingController offerPriceController =
      TextEditingController(text: Get.arguments.offerPrice.toString());
  final TextEditingController quantityController =
      TextEditingController(text: Get.arguments.quantity.toString());
  var species = List<Species>().obs;
  var category = "".obs;
  var specie = "".obs;
  var production = "".obs;
  var productionCut = List<MyProductionCut>().obs;
  var imageName = "".obs;

  bool productCreateResponse = false;
  var categories = List<Categories>().obs;
  final MyProductsController myProductsController =
      Get.put(MyProductsController());

  void fetchCategories() async {
    categories.assignAll(await apiAuthProvider.getCategories());
    print("length of categories ${categories.length}");

    // category.value = Get.arguments.category.id.toString();
    category.value =
        categories.length > 0 ? Get.arguments.category.id.toString() : '';
  }

  void fetchSpecies() async {
    species.assignAll(await apiAuthProvider.getSpecies());
    print("length of Species ${species.length}");
    specie.value =
        species.length > 0 ? Get.arguments.species.id.toString() : '';
  }

  void upDateProductionCut() async {
    productionCut.assignAll(await apiAuthProvider.getMyProductionCut());
    print("length of productionCut ${productionCut.length}");
    production.value = productionCut.length > 0
        ? production.value = productionCut[0].id.toString()
        : '';
  }

  var deliveryRadioValue = 0.obs;
  var stockRadioValue = 0.obs;

  void deliveryStockValue() {
    deliveryRadioValue.value = Get.arguments.willDeliver == true ? 0 : 1;
    stockRadioValue.value = Get.arguments.inStock == true ? 0 : 1;
  }

  File image;
  String path;
  final _picker = ImagePicker();

  Future<void> getCameraImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    }
  }

  Future<void> getGalleryImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    }
  }

  //to get a target path to provide for compressed file location
  Future<String> targetPath() async {
    final directory = await getApplicationDocumentsDirectory();
    String targetPath = directory.path + "/" + basename(image.path);
    print("Target Path $targetPath");
    return targetPath;
  }

  Future<File> testCompressAndGetFile(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 60,
    );

    return result;
  }

  void deleteImage() {
    imageName.value = "";
    image = null;
    update();
  }

  void handleDeliveryRadioValueChange(int val) {
    deliveryRadioValue.value = val;
    update();
    switch (deliveryRadioValue.value) {
      case 0:
        break;
      case 1:
        break;
    }
  }

  void handleStockRadioValueChange(int val) {
    stockRadioValue.value = val;
    update();
    switch (stockRadioValue.value) {
      case 0:
        break;
      case 1:
        break;
    }
  }

  final count = 0.obs;

  @override
  void onInit() {
    fetchCategories();
    fetchSpecies();
    upDateProductionCut();
    deliveryStockValue();
    imageName.value = Get.arguments.image;
    super.onInit();
  }

  void placeOrderOnPressed(int id) async {
    print("product id $id");
    if (image == null) {
      var formData = dio.FormData.fromMap({
        "name": productNameController.text.trim(),
        "description": descriptionController.text.trim() ?? "",
        "selling_price": sellingPriceController.text.trim(),
        "offer_price": offerPriceController.text.trim(),
        "quantity": quantityController.text.trim(),
        "unit": "packet",
        "delivery_charge": deliveryChargeController.text.trim(),
        "category": int.parse(category.value),
        "species": int.parse(specie.value),
        "production_cut": int.parse(production.value),
        "will_deliver": deliveryRadioValue.value == 0 ? true : false,
        "in_stock": stockRadioValue.value == 0 ? true : false,
      });

      createProduct(formData, id);
    } else {
      File compressedImage =
          await testCompressAndGetFile(image, await targetPath());
      var formData = dio.FormData.fromMap({
        "name": productNameController.text.trim(),
        "description": descriptionController.text.trim() ?? "",
        "image": await dio.MultipartFile.fromFile(
          compressedImage.path,
        ),
        "selling_price": sellingPriceController.text.trim(),
        "offer_price": offerPriceController.text.trim(),
        "quantity": quantityController.text.trim(),
        "unit": "packet",
        "delivery_charge": deliveryChargeController.text.trim(),
        "category": int.parse(category.value),
        "species": int.parse(specie.value),
        "production_cut": int.parse(production.value),
        "will_deliver": deliveryRadioValue.value == 0 ? true : false,
        "in_stock": stockRadioValue.value == 0 ? true : false,
      });

      createProduct(formData, id);
    }
  }

  Future createProduct(myProductCreateMap, id) async {
    setState(ViewState.Busy);
    productCreateResponse =
        await apiAuthProvider.updateProduct(myProductCreateMap, id);
    setState(ViewState.Retrieved);
    if (productCreateResponse) {
      Get.back();
      Get.snackbar("Product updated successfully!", "Success",
          backgroundColor: Colors.red[400],
          colorText: Colors.white,
          duration: Duration(seconds: 2));
      myProductsController.fetchMyProducts();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
