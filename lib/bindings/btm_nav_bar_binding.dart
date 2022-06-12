import 'package:get/get.dart';
import 'package:take_home_pj/controllers/btm_nav_bar_controller.dart';

class BtmNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BtmNavBarController>(BtmNavBarController());
  }
}
