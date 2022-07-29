import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_hay/api/api_auth_provider.dart';
import 'package:get_hay/base%20model/base_model.dart';
import 'package:get_hay/constants/enum.dart';
import 'package:get_hay/models/orderDelveryStatusModel.dart';
import 'package:get_hay/models/received_order_model.dart';
import 'package:get_hay/models/status_response_model.dart';

class ReceivedOrderController extends BaseController {
  var selectedDate = DateTime.now().obs;
  final apiAuthProvider = ApiAuthProvider();
  var myReceivedOrder = List<MyReceivedOrder>().obs;
  var responseStatus = "".obs;
  final count = 0.obs;
  StatusResponse statusResponse;
  var busy = "".obs;
  var myOrderDeliveryStatus = List<OrderDeliveryStatus>().obs;

  pickDate(DateTime date) {
    selectedDate.value = date;
  }

  @override
  void onInit() {
    fetchMyReceivedOrder();
    super.onInit();
  }

  Future<void> refresh() async {
    fetchMyReceivedOrder();
  }

  void fetchMyReceivedOrder() async {
    await apiAuthProvider.getMyProducts();
    myReceivedOrder.assignAll(await apiAuthProvider.getMyReceivedOrder());
    print(myReceivedOrder.length);
    print(myReceivedOrder.toString());
  }

  void createChangeStatus(String status, int id, int index) async {
    busy.value = "busy";
    print(busy.value);

    myReceivedOrder[index].status =
        await apiAuthProvider.changeStatus(status, id);
    if (myReceivedOrder[index].status != null) {
      Fluttertoast.showToast(
          msg: "You have set the order to ${myReceivedOrder[index].status}",
          backgroundColor: Colors.red[400],
          textColor: Colors.white,
          gravity: ToastGravity.TOP,
          toastLength: Toast.LENGTH_SHORT);
    }
    busy.value = "free";
    fetchMyReceivedOrder();
  }

  void changeOrderDeliveryStatus(
      bool deliverStatus, int id, int index, String date) async {
    setState(ViewState.Busy);

    print("this is date " + date);
    print(selectedDate.value);
    date = "${selectedDate.value}";

    myReceivedOrder[index].isDelivered =
        await apiAuthProvider.orderDeliveryStatus(deliverStatus, id, date);
    print("status ${myReceivedOrder[index].isDelivered}");

    setState(ViewState.Retrieved);
    fetchMyReceivedOrder();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
