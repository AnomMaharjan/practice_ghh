import 'package:get/get.dart';

import '../controllers/species_form_controller.dart';

class SpeciesFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpeciesFormController>(
      () => SpeciesFormController(),
    );
  }
}
