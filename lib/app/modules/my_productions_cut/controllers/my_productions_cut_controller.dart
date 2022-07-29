import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_hay/api/api_auth_provider.dart';
import 'package:get_hay/base%20model/base_model.dart';
import 'package:get_hay/constants/enum.dart';
import 'package:get_hay/models/myProductionCut.dart';

class MyProductionsCutController extends BaseController {
  final apiAuthProvider = ApiAuthProvider();
  var myProductionCut = List<MyProductionCut>().obs;

  MyProductionCut myProductionCutResponse;

  TextEditingController myProductionCutName = TextEditingController();

  void fetchMyProductionCut() async {
    setState(ViewState.Busy);
    await apiAuthProvider.getMyProductionCut();
    myProductionCut.assignAll(await apiAuthProvider.getMyProductionCut());
    print("length of myProductionCut ${myProductionCut.length}");
    setState(ViewState.Retrieved);
  }

  Future<MyProductionCut> addNewSpeciesAddress(Map name) async {
    setState(ViewState.Busy);
    myProductionCutResponse = await apiAuthProvider.addMyProductionCut(name);
    print("Shipping address ${myProductionCutResponse.name}");
    setState(ViewState.Retrieved);
    return myProductionCutResponse;
  }

  void addMyProductionCut() {
    Map categoryMap = {
      "name": myProductionCutName.text.trim(),
    };

    addNewSpeciesAddress(categoryMap).then((MyProductionCut value) {
      print(myProductionCutResponse);
      if (myProductionCutResponse != null) {
        myProductionCut.add(myProductionCutResponse);
        fetchMyProductionCut();
        Get.back();
        myProductionCutName.clear();
        Fluttertoast.showToast(
            msg: 'Successfully added production cut!',
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
    fetchMyProductionCut();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
