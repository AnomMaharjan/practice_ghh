import 'package:get/get.dart';
import 'package:get_hay/api/api_auth_provider.dart';
import 'package:get_hay/base%20model/base_model.dart';
import 'package:get_hay/constants/enum.dart';
import 'package:get_hay/models/categories.dart';

class CategoriesController extends BaseController {

  final apiAuthProvider = ApiAuthProvider();
  var categories = List<Categories>().obs;

  void fetchCategories() async {
    setState(ViewState.Busy);
    await apiAuthProvider.getCategories();
    categories.assignAll(await apiAuthProvider.getCategories());
    print("length of categories ${categories.length}");
    setState(ViewState.Retrieved);
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
