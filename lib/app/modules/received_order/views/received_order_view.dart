import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_hay/constants/enum.dart';
import '../controllers/received_order_controller.dart';

class ReceivedOrderView extends GetView<ReceivedOrderController> {
  final ReceivedOrderController receivedOrderController =
      Get.put(ReceivedOrderController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Obx(() =>
                receivedOrderController.myReceivedOrder.length == null
                    ? _buildLoadingWidget()
                    : _buildSuccessWidget(context))));
  }

  Widget _buildLoadingWidget() {
    return SpinKitCircle(color: Colors.red);
  }

  Widget _buildSuccessWidget(context) {
    selectDate(BuildContext context, bool deliverStatus, int id, int index,
        String date) async {
      final DateTime picked = await showDatePicker(
        context: context,
        initialDate: receivedOrderController.selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
      );
      if (picked != null &&
          picked != receivedOrderController.selectedDate.value) {
        receivedOrderController.pickDate(picked.add(Duration(days: 1)));
        receivedOrderController.changeOrderDeliveryStatus(
            deliverStatus, id, index, date);
      }
    }

    return RefreshIndicator(
      onRefresh: () => receivedOrderController.refresh(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            gap(12, 0),
            Expanded(
              child: ListView(
                children: List.generate(
                    receivedOrderController.myReceivedOrder.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 0.0),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              offset: Offset(0, 0),
                              blurRadius: 7,
                              spreadRadius: 1)
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      gap(10, 0),
                                      Row(
                                        children: [
                                          Text('Order ID: '),
                                          Text(
                                            receivedOrderController
                                                .myReceivedOrder[index].orderId
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.red[400],
                                                fontWeight: FontWeight.w600),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      gap(6, 0),
                                      Row(
                                        children: [
                                          Text('Total: '),
                                          Text(
                                            (receivedOrderController
                                                        .myReceivedOrder[index]
                                                        .total +
                                                    receivedOrderController
                                                        .myReceivedOrder[index]
                                                        .totalDeliveryCharge)
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.red[400],
                                                fontWeight: FontWeight.w600),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      gap(6, 0),
                                      Row(
                                        children: [
                                          Text('Total Items: '),
                                          Text(
                                            receivedOrderController
                                                .myReceivedOrder[index]
                                                .totalItems
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.red[400],
                                                fontWeight: FontWeight.w600),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      gap(6, 0),
                                      Obx(() => controller.busy.value == "busy"
                                          ? Center(
                                              child: Container(
                                                height: 20,
                                                width: 20,
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            )
                                          : receivedOrderController
                                                      .myReceivedOrder[index]
                                                      .status ==
                                                  "PENDING"
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Do you Want to accept the order?',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Row(children: [
                                                      SizedBox(
                                                        width: Get.width / 3.5,
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            receivedOrderController
                                                                .createChangeStatus(
                                                                    "APPROVED",
                                                                    receivedOrderController
                                                                        .myReceivedOrder[
                                                                            index]
                                                                        .id,
                                                                    index);
                                                          },
                                                          color: Colors.green,
                                                          child: Text(
                                                            "Accept",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ),
                                                      ),
                                                      gap(0, 5),
                                                      SizedBox(
                                                        width: Get.width / 3.5,
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            receivedOrderController
                                                                .createChangeStatus(
                                                                    "REJECTED",
                                                                    receivedOrderController
                                                                        .myReceivedOrder[
                                                                            index]
                                                                        .id,
                                                                    index);
                                                          },
                                                          color: Colors.red,
                                                          child: Text(
                                                            "Reject",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ],
                                                )
                                              : Row(
                                                  children: [
                                                    Text('Status: '),
                                                    Text(
                                                      receivedOrderController
                                                          .myReceivedOrder[
                                                              index]
                                                          .status
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Colors.red[400],
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                )),
                                      gap(6, 0),
                                      Row(
                                        children: [
                                          Text(
                                            'Is Delivered:',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Obx(
                                            () => receivedOrderController
                                                        .myReceivedOrder[index]
                                                        .isDelivered ==
                                                    true
                                                ? Text(
                                                    "YES",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.green,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )
                                                : Text(
                                                    "NO",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                          ),
                                        ],
                                      ),
                                      gap(6, 0),
                                      Obx(() => receivedOrderController.state ==
                                              ViewState.Busy
                                          ? Center(
                                              child: Container(
                                                height: 20,
                                                width: 20,
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            )
                                          : receivedOrderController
                                                          .myReceivedOrder[
                                                              index]
                                                          .isDelivered ==
                                                      false &&
                                                  receivedOrderController
                                                          .myReceivedOrder[
                                                              index]
                                                          .status ==
                                                      "APPROVED"
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Do you want to deliver?",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    MaterialButton(
                                                      onPressed: () {
                                                        selectDate(
                                                            context,
                                                            true,
                                                            receivedOrderController
                                                                .myReceivedOrder[
                                                                    index]
                                                                .id,
                                                            index,
                                                            "${receivedOrderController.selectedDate.value}");
                                                      },
                                                      color: Colors.red,
                                                      child: Text(
                                                        'Deliver',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : receivedOrderController
                                                          .myReceivedOrder[
                                                              index]
                                                          .deliveredDate ==
                                                      null
                                                  ? SizedBox()
                                                  : Text(
                                                      "Delivery Date: ${receivedOrderController.myReceivedOrder[index].deliveredDate}",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )),
                                      gap(20, 0),
                                      Column(
                                          children: List.generate(
                                              receivedOrderController
                                                  .myReceivedOrder[index]
                                                  .products
                                                  .length, (index2) {
                                        return Container(
                                          margin: EdgeInsets.only(
                                              bottom: 20, right: 10),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 16),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.4),
                                                  offset: Offset(0, 0),
                                                  blurRadius: 7,
                                                  spreadRadius: 1)
                                            ],
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Name:'),
                                                    Text('Price:'),
                                                    Text('Delivery Charge:'),
                                                    Text('Quantity:'),
                                                    Text('Total Price:'),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      receivedOrderController
                                                          .myReceivedOrder[
                                                              index]
                                                          .products[index2]
                                                          .product,
                                                      style: TextStyle(
                                                          color:
                                                              Colors.red[400],
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    Text(
                                                      receivedOrderController
                                                          .myReceivedOrder[
                                                              index]
                                                          .products[index2]
                                                          .price
                                                          .toString(),
                                                      style: TextStyle(
                                                          color:
                                                              Colors.red[400],
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Text(
                                                      receivedOrderController
                                                          .myReceivedOrder[
                                                              index]
                                                          .products[index2]
                                                          .deliveryCharge
                                                          .toString(),
                                                      style: TextStyle(
                                                          color:
                                                              Colors.red[400],
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Text(
                                                      receivedOrderController
                                                          .myReceivedOrder[
                                                              index]
                                                          .products[index2]
                                                          .quantity
                                                          .toString(),
                                                      style: TextStyle(
                                                          color:
                                                              Colors.red[400],
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Text(
                                                      receivedOrderController
                                                          .myReceivedOrder[
                                                              index]
                                                          .products[index2]
                                                          .total
                                                          .toString(),
                                                      style: TextStyle(
                                                          color:
                                                              Colors.red[400],
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      })),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget gap(double hvalue, double wvalue) {
  return SizedBox(
    height: hvalue,
    width: wvalue,
  );
}

Widget imageHolder(imagelink) {
  return Container(
    height: 120.0,
    width: 100.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      image: DecorationImage(
        image: NetworkImage(imagelink.toString()),
        fit: BoxFit.fill,
      ),
    ),
  );
}
