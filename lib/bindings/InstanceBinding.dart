import 'package:get/get.dart';
import 'package:take_home_pj/controllers/firebase_controller.dart';
import 'package:take_home_pj/controllers/home_controller.dart';
import 'package:take_home_pj/controllers/login_controller.dart';
import 'package:take_home_pj/controllers/dashboard_profile_controller.dart';


class InstanceBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<FirebaseController>(() => FirebaseController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DashboardProfileController>(() => DashboardProfileController());

  }

}