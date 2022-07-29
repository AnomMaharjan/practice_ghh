import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/stripe_payment_controller.dart';

class StripePaymentView extends GetView<StripePaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StripePaymentView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'StripePaymentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
