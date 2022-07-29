import 'package:get/get.dart';

import '../controllers/species_controller.dart';

class SpeciesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpeciesController>(
      () => SpeciesController(),
    );
  }
}
