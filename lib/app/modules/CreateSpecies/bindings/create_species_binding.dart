import 'package:get/get.dart';

import '../controllers/create_species_controller.dart';

class CreateSpeciesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateSpeciesController>(
      () => CreateSpeciesController(),
    );
  }
}
