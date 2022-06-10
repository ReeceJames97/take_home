
import 'package:get/get.dart';
import 'package:take_home_pj/controllers/dashboard_profile_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardProfileController>(DashboardProfileController());
  }
}