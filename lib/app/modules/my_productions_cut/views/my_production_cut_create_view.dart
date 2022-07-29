import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_hay/app/modules/my_productions_cut/views/my_production_cut_form_view.dart';
import 'package:get_hay/app/modules/my_productions_cut/views/my_productions_cut_view.dart';

class MyProductionCutCreateView extends GetView {
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
                'My Productions Cut',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      body: MyProductionsCutView(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red[400],
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () => Get.to(() => MyProductionCutFormView())),
    );
  }
}
