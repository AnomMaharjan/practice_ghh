import 'package:get/get.dart';
import 'package:get_hay/api/api_auth_provider.dart';
import 'package:get_hay/base%20model/base_model.dart';
import 'package:get_hay/constants/enum.dart';
import 'package:get_hay/models/Species.dart';

class SpeciesController extends BaseController {
  final apiAuthProvider = ApiAuthProvider();
  var species = List<Species>().obs;

  void fetchSpecies() async {
    setState(ViewState.Busy);
    print('Species airacha');
    await apiAuthProvider.getSpecies();
    species.assignAll(await apiAuthProvider.getSpecies());
    print("length of Species ${species.length}");
    setState(ViewState.Retrieved);
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchSpecies();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
