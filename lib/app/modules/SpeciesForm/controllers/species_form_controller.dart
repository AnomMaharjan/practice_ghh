import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_hay/api/api_auth_provider.dart';
import 'package:get_hay/app/modules/Species/controllers/species_controller.dart';
import 'package:get_hay/base%20model/base_model.dart';
import 'package:get_hay/constants/enum.dart';
import 'package:get_hay/models/addSpecies.dart';

class SpeciesFormController extends BaseController {
  final apiAuthProvider = ApiAuthProvider();
  var addSpecies = List<AddSpecies>().obs;
  AddSpecies addSpeciesResponse;
  final TextEditingController newSpeciesAddress = TextEditingController();
  final SpeciesController speciesController = Get.put(SpeciesController());

  Future<AddSpecies> addNewSpeciesAddress(Map name) async {
    setState(ViewState.Busy);
    addSpeciesResponse = await apiAuthProvider.addNewSpecies(name);
    print("Shipping address ${addSpeciesResponse.name}");
    setState(ViewState.Retrieved);
    return addSpeciesResponse;
  }

  void addSpeciesButtonPress() {
    Map categoryMap = {
      "name": newSpeciesAddress.text.trim(),
    };

    addNewSpeciesAddress(categoryMap).then((AddSpecies value) {
      print(addSpeciesResponse);
      if (addSpeciesResponse != null) {
        addSpecies.add(addSpeciesResponse);
        print("Species");
        speciesController.fetchSpecies();
        Get.back();
        newSpeciesAddress.clear();
        Fluttertoast.showToast(
            msg: 'Successfully added species!',
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.white,
            backgroundColor: Colors.red[400],
            gravity: ToastGravity.TOP);
      }
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
