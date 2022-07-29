import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_hay/constants/enum.dart';
import '../controllers/add_product_seller_controller.dart';

class AddProductSellerView extends GetView<AddProductSellerController> {
  final AddProductSellerController addProductController =
      Get.put(AddProductSellerController());
  final _formKey = GlobalKey<FormState>();
  final RegExp regexp = RegExp(r'[0-9]*\.[0-9]*');

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowGlow();
        return;
      },
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            final FocusScopeNode currentScope = FocusScope.of(context);
            if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
              FocusManager.instance.primaryFocus.unfocus();
            }
          },
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 20,
                    color: Colors.black,
                  )),
              title: Text(
                'Add new products',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Product Description',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.red[700]),
                            ),
                            gap(10),
                            Text(
                              'General',
                              style: TextStyle(fontSize: 24),
                            ),
                            gap(24),
                            Text(
                              'Name',
                              style: TextStyle(fontSize: 20),
                            ),
                            gap(10),
                            inputName(),
                            gap(20),
                            Text(
                              'Description',
                              style: TextStyle(fontSize: 20),
                            ),
                            gap(10),
                            inputDescription(),
                            gap(20),
                            Text(
                              'Upload Image',
                              style: TextStyle(fontSize: 20),
                            ),
                            gap(20),
                            imageContainer(context),
                            gap(20),
                            Text(
                              'Product Category',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            gap(10),
                            categoryDropdown(),
                            gap(20),
                            Text(
                              'Species Category',
                              style: TextStyle(fontSize: 20),
                            ),
                            gap(10),
                            speciesDropdown(),
                            gap(20),
                            Text(
                              'My Production Cut',
                              style: TextStyle(fontSize: 20),
                            ),
                            gap(10),
                            productionDropdown(),
                            gap(20),
                            Text(
                              'Delivery',
                              style: TextStyle(fontSize: 20),
                            ),
                            gap(10),
                            Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                      activeColor: Colors.red,
                                      value: 0,
                                      groupValue: addProductController
                                          .deliveryRadioValue.value,
                                      onChanged: addProductController
                                          .handleDeliveryRadioValueChange),
                                  Text('Yes'),
                                  Radio(
                                      activeColor: Colors.red,
                                      value: 1,
                                      groupValue: addProductController
                                          .deliveryRadioValue.value,
                                      onChanged: addProductController
                                          .handleDeliveryRadioValueChange),
                                  Text('No'),
                                ],
                              ),
                            ),
                            gap(16),
                            Obx(
                              () => addProductController
                                          .deliveryRadioValue.value ==
                                      1
                                  ? SizedBox()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Delivery Charge',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Container(
                                            width: 100,
                                            child: deliveryChargeInput()),
                                      ],
                                    ),
                            ),
                            gap(30),
                            Text(
                              'Price Description',
                              style: TextStyle(
                                  color: Colors.red[700], fontSize: 18),
                            ),
                            gap(10),
                            Text(
                              'General',
                              style: TextStyle(fontSize: 24),
                            ),
                            gap(30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Selling Price',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                    width: 100, child: sellingPriceInput()),
                              ],
                            ),
                            gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Offer Price',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(width: 100, child: offerPriceInput()),
                              ],
                            ),
                            gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Quantity',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(width: 100, child: quantityInput()),
                              ],
                            ),
                            gap(20),
                            Text(
                              'Unit',
                              style: TextStyle(fontSize: 20),
                            ),
                            gap(20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Stock',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  child: Obx(
                                    () => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Radio(
                                            activeColor: Colors.red,
                                            value: 0,
                                            groupValue: addProductController
                                                .stockRadioValue.value,
                                            onChanged: addProductController
                                                .handleStockRadioValueChange),
                                        Text('Yes'),
                                        Radio(
                                            activeColor: Colors.red,
                                            value: 1,
                                            groupValue: addProductController
                                                .stockRadioValue.value,
                                            onChanged: addProductController
                                                .handleStockRadioValueChange),
                                        Text('No'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            gap(30),
                            saveButton(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget inputName() {
    return TextFormField(
        controller: addProductController.productNameController,
        decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey),
            hintText: 'Product Name',
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

  Widget inputDescription() {
    return TextFormField(
      autofocus: false,
      keyboardType: TextInputType.multiline,
      controller: addProductController.descriptionController,
      maxLines: 4,
      validator: (value) {
        if (value.isEmpty) {
          return 'Field Empty';
        } else
          return null;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          hintText: 'Product Description',
          hintStyle: TextStyle(color: Colors.grey),
          // hintText: 'Product Description',
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Colors.black)),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Colors.black))),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        addProductController.getGalleryImage();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      addProductController.getCameraImage();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget imageContainer(context) {
    return GetBuilder<AddProductSellerController>(
        init: AddProductSellerController(),
        builder: (controller) => Center(
              child: Stack(children: [
                Container(
                  height: Get.height * 0.3,
                  width: Get.width * 0.55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.05),
                        blurRadius: 5,
                        spreadRadius: 3,
                      )
                    ],
                    border: Border.all(
                        width: 0.5, color: Colors.grey.withOpacity(0.3)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 3)
                                ]),
                          ),
                          GetBuilder<AddProductSellerController>(
                              builder: (con) => GestureDetector(
                                  onTap: con.image == null
                                      ? () {
                                          _showPicker(context);
                                        }
                                      : () {},
                                  child: con.image != null
                                      ? Container(
                                          height: 140,
                                          width: 140,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: FileImage(con.image),
                                                fit: BoxFit.cover),
                                          ),
                                        )
                                      : Container(
                                          height: 140,
                                          width: 140,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.add_a_photo,
                                            size: 40,
                                            color: Colors.black45,
                                          )))),
                        ],
                      ),
                      gap(16),
                      TextFormField(
                        controller: controller.productNameController,
                        enabled: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration.collapsed(
                          hintText: null,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                    right: 0,
                    child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red[400],
                          size: 30,
                        ),
                        onPressed: () => controller.deleteImage()))
              ]),
            ));
  }

  Widget gap(double value) {
    return SizedBox(
      height: value,
    );
  }

  Widget categoryDropdown() {
    return Obx(() => Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          width: Get.width,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: addProductController.category.value,
              hint: Text('Choose your category'),
              items: addProductController.categories.map((item) {
                return new DropdownMenuItem(
                  value: item.id.toString(),
                  child: new Text(item.name),
                );
              }).toList(),
              onChanged: (String newValue) {
                addProductController.category.value = newValue;
              },
            ),
          ),
        ));
  }

  Widget speciesDropdown() {
    print("length of species ${addProductController.species.length}");
    return Obx(() => Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          width: Get.width,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: addProductController.specie.value,
              hint: Text('Choose your species'),
              items: addProductController.species.map((item) {
                return new DropdownMenuItem(
                  value: item.id.toString(),
                  child: new Text(item.name),
                );
              }).toList(),
              onChanged: (String newValue) {
                addProductController.specie.value = newValue;
              },
            ),
          ),
        ));
  }

  Widget productionDropdown() {
    print("length of species ${addProductController.productionCut.length}");
    return Obx(() => Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          width: Get.width,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: addProductController.production.value,
              hint: Text('Choose your productionCut'),
              items: addProductController.productionCut.map((item) {
                return new DropdownMenuItem(
                  value: item.id.toString(),
                  child: new Text(item.name),
                );
              }).toList(),
              onChanged: (String newValue) {
                addProductController.production.value = newValue;
              },
            ),
          ),
        ));
  }

  Widget deliveryChargeInput() {
    return TextFormField(
      controller: addProductController.deliveryChargeController,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(8),
          hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
          hintText: 'Delivery charge',
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Colors.black)),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Colors.black))),
      validator: (value) {
        if (value.isEmpty) {
          return 'Field empty';
        } else if (!regexp.hasMatch(value) && !value.isNumericOnly) {
          return 'Number only';
        } else
          return null;
      },
    );
  }

  Widget sellingPriceInput() {
    return TextFormField(
        controller: addProductController.sellingPriceController,
        decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(8),
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            hintText: 'Selling Price',
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.black)),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.black))),
        validator: (value) {
          if (value.isEmpty) {
            return 'Field empty';
          } else if (!regexp.hasMatch(value) && !value.isNumericOnly) {
            return 'Number only';
          } else
            return null;
        });
  }

  Widget offerPriceInput() {
    return TextFormField(
        controller: addProductController.offerPriceController,
        decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(8),
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            hintText: 'Offer Price',
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.black)),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.black))),
        validator: (value) {
          if (value.isEmpty) {
            return 'Field empty';
          } else if (value.isNotEmpty) {
            if (!regexp.hasMatch(value) && !value.isNumericOnly) {
              return 'Number only';
            }
          } else
            return null;
        });
  }

  Widget quantityInput() {
    return TextFormField(
      controller: addProductController.quantityController,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(8),
        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
        hintText: 'Quantity',
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Colors.black)),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Colors.black)),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Field empty';
        } else if (!value.isNumericOnly) {
          return 'Number only';
        } else
          return null;
      },
    );
  }

  Widget saveButton() {
    return Center(
        child: Obx(
      () => MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 12),
        minWidth: Get.width,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        color: Colors.red[700],
        onPressed: controller.state == ViewState.Busy
            ? () {}
            : () {
                // addProductController.placeOrderOnPressed();

                if (addProductController.image != null) {
                  _formKey.currentState.validate();
                  if (int.parse(
                          addProductController.offerPriceController.text) <=
                      int.parse(
                          addProductController.sellingPriceController.text)) {
                    if (_formKey.currentState.validate()) {
                      addProductController.placeOrderOnPressed();
                    } else
                      Fluttertoast.showToast(
                          msg: 'Product could not be created',
                          gravity: ToastGravity.TOP,
                          toastLength: Toast.LENGTH_SHORT,
                          backgroundColor: Colors.red[400],
                          textColor: Colors.white);
                  } else
                    Fluttertoast.showToast(
                        msg: 'Offer price must be lesser than selling price',
                        gravity: ToastGravity.TOP,
                        toastLength: Toast.LENGTH_SHORT,
                        backgroundColor: Colors.red[400],
                        textColor: Colors.white);
                } else
                  Fluttertoast.showToast(
                      msg: 'Image Required',
                      gravity: ToastGravity.TOP,
                      toastLength: Toast.LENGTH_SHORT,
                      backgroundColor: Colors.red[400],
                      textColor: Colors.white);
                // return Get.snackbar('Image Required', '',
                //     snackPosition: SnackPosition.BOTTOM);
              },
        child: controller.state == ViewState.Busy
            ? SpinKitCircle(
                color: Colors.red,
              )
            : Text(
                'Save',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
      ),
    ));
  }
}
