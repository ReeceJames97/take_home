import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:take_home_pj/controllers/home_controller.dart';

class DashboardProfileController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  late User user;

  @override
  void onInit() async {
    super.onInit();
    user = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void logout() async {
    await homeController.googleSign.disconnect();
    await homeController.firebaseAuth.signOut();
  }
}
