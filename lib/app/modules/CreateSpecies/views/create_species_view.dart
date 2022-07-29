import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_hay/app/modules/Species/views/species_view.dart';
import 'package:get_hay/app/modules/SpeciesForm/views/species_form_view.dart';

import '../controllers/create_species_controller.dart';

class CreateSpeciesView extends GetView<CreateSpeciesController> {
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
                  'Species',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        body: SpeciesView(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red[400],
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => Get.to(SpeciesFormView())));
  }
}
