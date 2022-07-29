import 'package:get/state_manager.dart';
import 'package:get_hay/constants/enum.dart';

class BaseController extends GetxController {
  var _state = ViewState.Idle.obs;

  ViewState get state => _state.value;

  void setState(ViewState newState){
    _state.value = newState;
  }
}