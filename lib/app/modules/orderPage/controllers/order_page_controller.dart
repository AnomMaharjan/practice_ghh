import 'package:get/get.dart';
import 'package:get_hay/api/api_auth_provider.dart';
import 'package:get_hay/base%20model/base_model.dart';
import 'package:get_hay/constants/enum.dart';
import 'package:get_hay/models/order_model.dart';

class OrderPageController extends BaseController {
  final apiAuthProvider = ApiAuthProvider();
  List<OrderList> orderList = [];

  final count = 0.obs;
  var added = List<int>().obs;

  @override
  void onInit() {
    fetchOrderList();
    super.onInit();
  }

  void fetchOrderList() async {
    setState(ViewState.Busy);
    print('chalyo ');
    orderList = await apiAuthProvider.getOrderList();
    print(orderList);
    setState(ViewState.Retrieved);
  }

  Future<void> refresh() async {
    fetchOrderList();
  }
}
